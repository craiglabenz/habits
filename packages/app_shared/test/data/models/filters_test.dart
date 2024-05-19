import 'package:app_shared/app_shared.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

@immutable
class Data {
  const Data(this.id, this.body);
  final int id;
  final String body;

  @override
  String toString() => 'Body($id, "$body")';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          body == other.body;

  @override
  int get hashCode => Object.hash(id.hashCode, body.hashCode);
}

enum BooleanLogic { and, or }

///
final class DataFilter extends BaseFilter<Data> {
  DataFilter._({
    this.idGreaterThan,
    this.idLessThan,
    this.bodyContains,
    this.operator,
    this.children,
  });

  factory DataFilter.and(List<DataFilter> children) =>
      DataFilter._(children: children, operator: BooleanLogic.and);
  factory DataFilter.or(List<DataFilter> children) =>
      DataFilter._(children: children, operator: BooleanLogic.or);
  factory DataFilter.idGreaterThan(int id) => DataFilter._(idGreaterThan: id);
  factory DataFilter.idLessThan(int id) => DataFilter._(idLessThan: id);
  factory DataFilter.bodyContains(String value) =>
      DataFilter._(bodyContains: value);

  final List<DataFilter>? children;
  final BooleanLogic? operator;
  final int? idGreaterThan;
  final int? idLessThan;
  final String? bodyContains;

  @override
  bool apply(covariant Data obj) {
    if (children != null) {
      return switch (operator!) {
        BooleanLogic.and => children!.every((f) => f.apply(obj)),
        BooleanLogic.or => children!.any((f) => f.apply(obj)),
      };
    }
    if (idGreaterThan != null) return obj.id > idGreaterThan!;
    if (idLessThan != null) return obj.id < idLessThan!;
    if (bodyContains != null) return obj.body.contains(bodyContains!);
    return true;
  }

  /// Stub implementation to satisfy the interface.
  @override
  Json toJson() => {};
}

void main() {
  const one = Data(1, 'one');
  const two = Data(2, 'two');
  const three = Data(3, 'three');
  const four = Data(4, 'four');
  const data = [one, two, three, four];

  group('ComboFilters should apply', () {
    test('AND logic correctly', () {
      final filter = DataFilter.and(
        [DataFilter.idGreaterThan(1), DataFilter.bodyContains('t')],
      );
      expect(filter.apply(one), isFalse);
      expect(filter.apply(two), isTrue);
      expect(filter.apply(three), isTrue);
      expect(filter.apply(four), isFalse);
      expect(filter.applyToList(data), [two, three]);
    });

    test('OR logic correctly', () {
      final filter = DataFilter.or(
        [DataFilter.idGreaterThan(1), DataFilter.bodyContains('t')],
      );
      expect(filter.apply(one), isFalse);
      expect(filter.apply(two), isTrue);
      expect(filter.apply(three), isTrue);
      expect(filter.apply(four), isTrue);
      expect(filter.applyToList(data), [two, three, four]);
    });

    test('OR and AND logic correctly', () {
      final filter = DataFilter.or(
        [
          DataFilter.idGreaterThan(3),
          DataFilter.and(
            [DataFilter.idLessThan(3), DataFilter.bodyContains('t')],
          ),
        ],
      );
      expect(filter.apply(one), isFalse);
      expect(filter.apply(two), isTrue);
      expect(filter.apply(three), isFalse);
      expect(filter.apply(four), isTrue);
      expect(filter.applyToList(data), [two, four]);
    });
  });
}
