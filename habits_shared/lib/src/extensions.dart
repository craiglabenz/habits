import 'package:app_shared/app_shared.dart';
import 'package:timezone/timezone.dart' as tze;

/// TODO: Instead of wrapping tz.TimeZone and sending it back and forth,
/// initialize the same wrapped dataset in both the Client and Server and only
/// pass back and forth names.

/// {@template Timezone}
/// Json-aware wrapper of [tze.TimeZone].
/// {@endtemplate}
class Timezone {
  /// {@macro Timezone}
  Timezone(
    this.offset, {
    required this.name,
    required this.isDst,
    required this.abbreviation,
  });

  /// Converter from [tze.TimeZone] to [Timezone].
  factory Timezone.fromTz(tze.TimeZone tz, tze.Location location) => Timezone(
        tz.offset,
        name: location.name,
        isDst: tz.isDst,
        abbreviation: tz.abbreviation,
      );

  /// Json deserializer for [Timezone].
  factory Timezone.fromJson(Json json) => Timezone(
        json['offset']! as int,
        name: json['name']! as String,
        isDst: json['isDst']! as bool,
        abbreviation: json['abbreviation']! as String,
      );

  /// Seconds east of UTC.
  final int offset;

  /// Whether this [Timezone] is Daylight Savings Time.
  final bool isDst;

  /// Shorthand for this [Timezone].
  final String abbreviation;

  /// Full name for this [Timezone], like "US/Eastern".
  final String name;

  /// Offset expressed in hours.
  double get offsetHours => (offset / 3600).roundTo(2);

  /// Json serializer for [tze.TimeZone].
  Json toJson() => <String, Object?>{
        'name': name,
        'offset': offset,
        'isDst': isDst,
        'abbreviation': abbreviation,
      };

  @override
  String toString() =>
      'Timezone(name: $name, abbreviation: $abbreviation, offset: $offset, '
      'offsetHours: $offsetHours, isDst: $isDst)';
}

/// Rounding helpers for [double].
extension RoundableDouble on double {
  /// Rounds a [double] to a fixed precision.
  double roundTo(int decimalPlaces) =>
      double.parse(toStringAsFixed(decimalPlaces));
}
