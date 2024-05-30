import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/test_model.dart';

const id1 = 'uuid';
const id2 = 'uuid2';
const detailResponseBody = '{"id": "$id1", "msg": "Fred"}';
const detailResponseBody2 = '{"id": "$id2", "msg": "Flintstone"}';

final obj1 = TestModel.fromJson(jsonDecode(detailResponseBody) as Json);
final obj2 = TestModel.fromJson(jsonDecode(detailResponseBody2) as Json);

final details = RequestDetails();
final localDetails = RequestDetails.local();
final refreshDetails = RequestDetails.refresh();
final abcDetails = RequestDetails(
  filters: const [TestModelFilter.messageStartsWith('abc')],
);
final localAbcDetails = RequestDetails(
  filters: const [TestModelFilter.messageStartsWith('abc')],
  requestType: RequestType.local,
);

class FakeRemoteSource extends LocalMemorySource<TestModel, String> {
  FakeRemoteSource() : super(canSetIds: true);

  @override
  SourceType get sourceType => SourceType.remote;
}

SourceList<TestModel, String> getSourceList() => SourceList<TestModel, String>(
      sources: <Source<TestModel, String>>[
        LocalMemorySource<TestModel, String>(),
        FakeRemoteSource(),
      ],
      bindings: const TestModelBindings(),
    );

void main() {
  group('SourceList.getById should', () {
    test('get and cache items', () async {
      final sl = getSourceList();
      // Seed our fake "API"
      await sl.sources.last.setItem(obj1, details);

      final localReadResult = await sl.getById(id1, localDetails);
      expect(localReadResult, isRight);
      expect(localReadResult.getOrRaise().item, isNull);

      final readResult = await sl.getById(id1, details);
      expect(readResult, isRight);
      final obj = readResult.getOrRaise().item;
      expect(obj1, equals(obj1));
      expect((sl.sources[0] as LocalMemorySource).itemIds, contains('uuid'));
      expect((await sl.getById(id1, localDetails)).getOrRaise().item, obj);
    });

    test('return empty result when the item is not found', () async {
      final sl = getSourceList();
      final readResult = await sl.getById(id1, details);
      expect(readResult, isRight);
      expect((sl.sources[0] as LocalMemorySource).itemIds, isEmpty);
      expect((sl.sources[1] as LocalMemorySource).itemIds, isEmpty);
      expect(readResult.getOrRaise().item, isNull);
    });

    test('honor request types in getById', () async {
      final sl = getSourceList();
      await sl.setItem(obj1, localDetails);

      final readResult = await sl.getById(obj1.id!, details);
      expect(readResult.getOrRaise().item, obj1);

      final localReadResult = await sl.getById(obj1.id!, localDetails);
      expect(localReadResult.getOrRaise().item, obj1);

      final remoteReadResult = await sl.getById(obj1.id!, refreshDetails);
      expect(remoteReadResult.getOrRaise().item, isNull);
    });
  });

  group('SourceList.getByIds should', () {
    test('get and cache items', () async {
      final sl = getSourceList();
      // Seed our fake "API"
      await sl.sources[1].setItem(obj1, details);
      await sl.sources[1].setItem(obj2, details);

      final localReadResult = await sl.getByIds({id1, id2}, localDetails);
      expect(localReadResult, isRight);
      expect(localReadResult.getOrRaise().items, isEmpty);

      final readResult = await sl.getByIds({id1, id2}, details);
      expect(readResult, isRight);
      expect(readResult.getOrRaise().items, equals([obj1, obj2]));
      expect(
        (sl.sources[0] as LocalMemorySource).itemIds,
        containsAll([id1, id2]),
      );
    });

    test('get and cache items on partial returns', () async {
      final sl = getSourceList();
      // Seed our fake "API"
      await sl.sources[1].setItem(obj1, details);

      final readResult = await sl.getByIds({id1, id2}, details);
      expect(readResult, isRight);
      expect(readResult.getOrRaise().items, equals([obj1]));
      expect((sl.sources[0] as LocalMemorySource).itemIds, contains(id1));
      expect((sl.sources[0] as LocalMemorySource).items[id2], isNull);
    });

    test('complete partially filled local hits', () async {
      final sl = getSourceList();
      // Seed previously loaded data
      await sl.sources[0].setItem(obj1, localDetails);
      // Seed fake "API"
      await sl.sources[1].setItem(obj1, localDetails);
      await sl.sources[1].setItem(obj2, localDetails);

      final localReadResult =
          await sl.getByIds({obj1.id!, obj2.id!}, localDetails);
      expect(localReadResult, isRight);
      final result = localReadResult.getOrRaise();
      expect(result.items.length, 1);

      final remoteReadResult =
          await sl.getByIds({obj1.id!, obj2.id!}, refreshDetails);
      expect(remoteReadResult.getOrRaise().items.length, 2);
    });

    test('honor request types', () async {
      final sl = getSourceList();
      await sl.sources[0].setItems([obj1, obj2], localDetails);

      final readResult = await sl.getByIds({obj1.id!, obj2.id!}, details);
      expect(readResult.getOrRaise().items.length, 2);

      final localReadResult =
          await sl.getByIds({obj1.id!, obj2.id!}, localDetails);
      expect(localReadResult.getOrRaise().items.length, 2);

      final remoteReadResult =
          await sl.getByIds({obj1.id!, obj2.id!}, refreshDetails);
      expect(remoteReadResult.getOrRaise().items.length, 0);

      // Empty API result above did not delete records in local cache
      final localReadResult2 =
          await sl.getByIds({obj1.id!, obj2.id!}, localDetails);
      expect(localReadResult2.getOrRaise().items.length, 2);
    });
  });

  group('SourceList.getItems should', () {
    test('load items', () async {
      final sl = getSourceList();
      await sl.sources[0].setItems([obj1, obj2], details);
      await sl.sources[1].setItems([obj1, obj2], details);

      final localReadResult = await sl.getItems(localDetails);
      expect(localReadResult.getOrRaise().items.length, 2);

      final remoteReadResult = await sl.getItems(refreshDetails);
      expect(remoteReadResult.getOrRaise().items.length, 2);
    });

    test('honor request types and cache items', () async {
      final sl = getSourceList();
      await sl.sources[1].setItems([obj1, obj2], details);

      final localReadResult = await sl.getItems(localDetails);
      expect(localReadResult.getOrRaise().items.length, 0);

      final remoteReadResult = await sl.getItems(refreshDetails);
      expect(remoteReadResult.getOrRaise().items.length, 2);
      expect(
        (sl.sources[0] as LocalMemorySource<TestModel, String>).items.length,
        2,
      );

      final localReadResult2 = await sl.getItems(localDetails);
      expect(localReadResult2.getOrRaise().items.length, 2);
    });

    test('honor filters', () async {
      final sl = getSourceList();
      await sl.sources[1].setItems([obj1, obj2], details);

      final remoteReadResult = await sl.getItems(details);
      expect(remoteReadResult.getOrRaise().items.length, 2);

      final localReadResult = await sl.getItems(localDetails);
      expect(localReadResult.getOrRaise().items.length, 2);

      final filteredReadResult = await sl.getItems(
        RequestDetails(
          filters: const [TestModelFilter.messageStartsWith('abc')],
          requestType: RequestType.local,
        ),
      );
      expect(filteredReadResult.getOrRaise().items.length, 0);
    });

    test('honor filters with request types', () async {
      final sl = getSourceList();
      await sl.sources[0].setItems([obj2], details);
      await sl.sources[1].setItems([obj1, obj2], details);

      final localReadResult = await sl.getItems(localDetails);
      expect(localReadResult.getOrRaise().items.length, 1);

      final localMsgFlintstoneDetails = RequestDetails(
        filters: const [TestModelFilter.messageEquals('Flintstone')],
        requestType: RequestType.local,
      );

      final localReadResult2 = await sl.getItems(localMsgFlintstoneDetails);
      expect(localReadResult2.getOrRaise().items.length, 1);
      expect(localReadResult2.getOrRaise().items.first.msg, 'Flintstone');

      final localMsgFredDetails = RequestDetails(
        filters: const [TestModelFilter.messageEquals('Fred')],
        requestType: RequestType.local,
      );

      final localReadResult3 = await sl.getItems(localMsgFredDetails);
      expect(localReadResult3.getOrRaise().items, isEmpty);

      final globalMsgFredDetails = RequestDetails(
        filters: const [TestModelFilter.messageEquals('Flintstone')],
      );

      final globalResults = await sl.getItems(globalMsgFredDetails);
      expect(globalResults.getOrRaise().items.length, 1);
      expect(globalResults.getOrRaise().items.first.msg, 'Flintstone');

      final refreshMsgFredDetails = RequestDetails(
        filters: const [TestModelFilter.messageEquals('Fred')],
        requestType: RequestType.refresh,
      );
      final refreshResults = await sl.getItems(refreshMsgFredDetails);
      expect(refreshResults.getOrRaise().items.length, 1);
      expect(refreshResults.getOrRaise().items.first.msg, 'Fred');

      final lastLocalReadResult = await sl.getItems(localDetails);
      expect(lastLocalReadResult.getOrRaise().items.length, 2);
    });
  });

  group('SourceList.setItem should', () {
    test('persist an item to all layers', () async {
      const newObj = TestModel(id: null, msg: 'new');
      final sl = getSourceList();
      final writeResult = await sl.setItem(newObj, details);
      expect(writeResult.getOrRaise().item.id, isNotNull);
      expect(writeResult.getOrRaise().item.msg, 'new');

      final localReadResult = await sl.getItems(localDetails);
      expect(localReadResult.getOrRaise().items.length, 1);
    });

    test('honor filters with a match', () async {
      const newObj = TestModel(id: null, msg: 'abcdef');
      final sl = getSourceList();
      final writeResult = await sl.setItem(newObj, abcDetails);
      final savedObj = writeResult.getOrRaise().item;
      expect(savedObj.id, isNotNull);
      expect(savedObj.msg, 'abcdef');

      final localReadResult = await sl.getItems(localAbcDetails);
      expect(localReadResult.getOrRaise().items.length, 1);
    });

    test('honor filters with a miss', () async {
      const newObj = TestModel(id: null, msg: 'xyz');
      final sl = getSourceList();
      final writeResult = await sl.setItem(newObj, abcDetails);
      final savedObj = writeResult.getOrRaise().item;
      expect(savedObj.id, isNotNull);
      expect(savedObj.msg, 'xyz');

      final localReadResult = await sl.getItems(localAbcDetails);
      expect(localReadResult.getOrRaise().items, isEmpty);
    });
  });

  group('SourceList.setItems should', () {
    test('persist items to all local layers', () async {
      const newObj = TestModel(id: 'item 1', msg: 'new');
      const newObj2 = TestModel(id: 'item 2', msg: 'new 2');
      final sl = getSourceList();
      await sl.setItems([newObj, newObj2], localDetails);

      final localReadResult = await sl.getItems(localDetails);
      expect(localReadResult.getOrRaise().items.length, 2);

      final remoteReadResult = await sl.getItems(refreshDetails);
      expect(remoteReadResult.getOrRaise().items, isEmpty);

      await sl.setItems([newObj, newObj2], details);
      final remoteReadResult2 = await sl.getItems(refreshDetails);
      expect(remoteReadResult2.getOrRaise().items.length, 2);
    });
  });
}
