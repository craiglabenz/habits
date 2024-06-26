import 'dart:math';
import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_model.freezed.dart';

class TestModel extends Model<String> {
  const TestModel({required this.id, this.msg = defaultMessage});

  factory TestModel.randomId([String msg = defaultMessage]) => TestModel(
        id: Random().nextDouble().toString(),
        msg: msg,
      );

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json['id'] as String?,
        msg: json['msg'] as String,
      );
  @override
  final String? id;
  final String msg;

  static const defaultMessage = 'default';

  @override
  Map<String, dynamic> toJson() => {'id': id, 'msg': msg};

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          msg == other.msg;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => Object.hashAll([id, msg]);

  @override
  String toString() => 'TestModel(id: $id, msg: $msg)';
}

class TestModelBindings extends Bindings<TestModel, String> {
  const TestModelBindings();
  @override
  TestModel fromJson(Json json) => TestModel.fromJson(json);

  @override
  ApiUrl getDetailUrl(TestModel obj) => ApiUrl(path: 'test/$id');

  @override
  String? getId(TestModel obj) => obj.id;

  @override
  ApiUrl getListUrl() => const ApiUrl(path: 'test/');

  @override
  Json toJson(TestModel obj) => obj.toJson();

  @override
  TestModel copy(TestModel obj) => TestModel.fromJson(obj.toJson());
}

class FakeSourceList<T, K> extends SourceList<T, K> {
  FakeSourceList(Bindings<T, K> bindings)
      : super(sources: [], bindings: bindings);
  List<T> objs = <T>[];

  void addObj(T obj) => objs.add(obj);

  @override
  Future<ReadResult<T>> getById(K id, RequestDetails details) => Future.value(
        Right(
          ReadSuccess<T>(
            objs.firstWhere((o) => bindings.getId(o) == id),
            details: details,
          ),
        ),
      );

  @override
  Future<ReadListResult<T, K>> getByIds(
    Set<K> ids,
    RequestDetails details,
  ) =>
      Future.value(
        Right(
          ReadListSuccess<T, K>.fromList(
            objs.where((o) => ids.contains(bindings.getId(o))).toList(),
            details,
            bindings.getId,
          ),
        ),
      );

  @override
  Future<ReadListResult<T, K>> getItems(RequestDetails details) => Future.value(
        Right(
          ReadListSuccess<T, K>.fromList([objs.first], details, bindings.getId),
        ),
      );

  @override
  Future<WriteResult<T>> setItem(T item, RequestDetails details) => //
      Future.value(
        Right(
          WriteSuccess<T>(objs.first, details: details),
        ),
      );

  @override
  Future<WriteListResult<T>> setItems(
    List<T> items,
    RequestDetails details,
  ) =>
      Future.value(
        Right(
          BulkWriteSuccess<T>([objs.first], details: details),
        ),
      );
}

@Freezed()
class TestModelFilter extends BaseFilter with _$TestModelFilter {
  const TestModelFilter._();
  const factory TestModelFilter.messageEquals(String match) =
      TestModelMessageEquals;
  const factory TestModelFilter.messageStartsWith(String match) =
      TestModelMessageStartsWith;

  @override
  Params toParams() => map(
        messageEquals: (f) => {'message': f.match},
        messageStartsWith: (f) => {'message__startsWith': f.match},
      );

  @override
  bool apply(covariant TestModel obj) => map(
        messageEquals: (filter) => obj.msg == filter.match,
        messageStartsWith: (filter) => obj.msg.startsWith(filter.match),
      );

  /// Stub implementation to satisfy the interface, but not actually used in
  /// tests.
  @override
  Json toJson() => toParams();
}
