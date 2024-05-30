// ignore_for_file: prefer_const_constructors

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import '../models/test_model.dart';

void main() {
  group('RequestDetails should', () {
    test('generate matching cache keys', () {
      expect(
        RequestDetails().cacheKey,
        RequestDetails().cacheKey,
      );
      expect(
        RequestDetails().empty.cacheKey,
        RequestDetails().empty.cacheKey,
      );
    });
    test('generate matching cache keys with filters', () {
      final rd = RequestDetails(
        filters: const [TestModelFilter.messageEquals('abc')],
      );
      final rd2 = RequestDetails(
        filters: const [TestModelFilter.messageEquals('abc')],
      );
      expect(rd.cacheKey, rd2.cacheKey);
      expect(rd.empty.cacheKey, rd2.empty.cacheKey);
    });
    test('generate different cache keys with filters', () {
      final rd = RequestDetails(
        filters: const [TestModelFilter.messageEquals('ABC')],
      );
      final rd2 = RequestDetails(
        filters: const [TestModelFilter.messageEquals('abc')],
      );
      expect(rd.cacheKey, isNot(equals(rd2.cacheKey)));
      expect(rd.empty.cacheKey, rd2.empty.cacheKey);
    });
    test('generate matching cache keys with same pagination', () {
      final rd = RequestDetails(
        pagination: Pagination.page(1),
      );
      final rd2 = RequestDetails(
        pagination: Pagination.page(1),
      );
      expect(rd.cacheKey, equals(rd2.cacheKey));
      expect(rd.empty.cacheKey, rd2.empty.cacheKey);
    });

    test('generate different cache keys with different pagination', () {
      final rd = RequestDetails(
        pagination: Pagination.page(1),
      );
      final rd2 = RequestDetails(
        pagination: Pagination.page(2),
      );
      expect(rd.cacheKey, isNot(equals(rd2.cacheKey)));
      expect(rd.empty.cacheKey, rd2.empty.cacheKey);
    });

    test('generate same cache key as own empty', () {
      final rd = RequestDetails();
      expect(rd.cacheKey, rd.empty.cacheKey);
    });

    test('generate same cache key as own empty with diff request type', () {
      final rd = RequestDetails(requestType: RequestType.local);
      expect(rd.cacheKey, rd.empty.cacheKey);
    });

    test('copyWith null pagination', () {
      final rd = RequestDetails(
        requestType: RequestType.local,
        pagination: Pagination.page(2),
        filters: const [TestModelFilter.messageEquals('abc')],
      );
      // ignore: avoid_redundant_argument_values
      final rd2 = rd.copyWith(pagination: null);
      expect(rd2.pagination, isNull);
      expect(rd2.filters, hasLength(1));
    });
    test('copyWith null filters', () {
      final rd = RequestDetails(
        requestType: RequestType.local,
        pagination: Pagination.page(2),
        filters: const [TestModelFilter.messageEquals('abc')],
      );
      // ignore: avoid_redundant_argument_values
      final rd2 = rd.copyWith(filters: null);
      expect(rd2.pagination, isNotNull);
      expect(rd2.filters, isEmpty);
    });
  });
}
