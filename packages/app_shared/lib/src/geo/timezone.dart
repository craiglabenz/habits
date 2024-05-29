import 'package:app_shared/app_shared.dart';
import 'package:logging/logging.dart';
import 'package:timezone/data/latest_10y.dart' as tze;
import 'package:timezone/timezone.dart' as tze;

final _log = Logger('Timezone');

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
  })  : _nameLowerCase = name.toLowerCase(),
        _abbreviationLowerCase = abbreviation.toLowerCase(),
        displayName = name.replaceAll('_', ' '),
        offsetStr = Timezone._formatOffset(offset);

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

  static String _formatOffset(int offsetInMilliseconds) {
    if (offsetInMilliseconds == 0) return '+00:00';
    // Assuming a value of 8100 seconds, create '2'
    String hours =
        (offsetInMilliseconds / 3600000).roundTo(0).toInt().toString();
    // Assuming a value of 8100 seconds, create '15'
    String minutes =
        (((offsetInMilliseconds / 1000) % 3600) / 60).toInt().toString();
    final sign = offsetInMilliseconds > 0 ? '+' : '';
    hours = hours.padLeft(2, '0');
    minutes = minutes.padLeft(2, '0');
    return '$sign$hours:$minutes';
  }

  /// Seconds east of UTC.
  final int offset;

  /// Display-friendly version of [offset].
  final String offsetStr;

  /// Whether this [Timezone] is Daylight Savings Time.
  final bool isDst;

  /// Shorthand for this [Timezone].
  final String abbreviation;

  /// Cached lowercase version of [abbreviation].
  final String _abbreviationLowerCase;

  /// Full name for this [Timezone], like "America/Los_Angeles".
  final String name;

  /// Version of [name] without underscores.
  final String displayName;

  /// Cached lowercase version of [name].
  final String _nameLowerCase;

  /// Value to show to users.
  String get display => 'GMT($offsetStr) $displayName $abbreviation';

  /// Json serializer for [tze.TimeZone].
  Json toJson() => <String, Object?>{
        'name': name,
        'offset': offset,
        'isDst': isDst,
        'abbreviation': abbreviation,
      };

  @override
  String toString() => 'Timezone(name: $name, abbreviation: $abbreviation, '
      'offset: $offsetStr, isDst: $isDst)';
}

/// {@template TimezoneRepository}
/// {@endtemplate}
class TimezoneRepository {
  /// {@macro TimezoneRepository}
  TimezoneRepository() {
    final st = DateTime.now();
    tze.initializeTimeZones();
    final knownTimezones = <int>{};
    for (final tze.Location location in tze.timeZoneDatabase.locations.values) {
      final timezone = location.currentTimeZone;
      if (knownTimezones.contains(timezone.hashCode)) {
        continue;
      }
      knownTimezones.add(timezone.hashCode);
      timezones.add(Timezone.fromTz(timezone, location));
    }
    timezones.sort((a, b) => a.offset.compareTo(b.offset));
    _log.fine('Timezones ready after ${DateTime.now().difference(st)}');
  }

  /// All available time zones.
  final timezones = <Timezone>[];

  final _cache = <String, List<Timezone>>{};

  /// Returns matching [Timezone] objects.
  List<Timezone> search(String query) {
    final lowerCaseQuery = query.toLowerCase();
    if (!_cache.containsKey(lowerCaseQuery)) {
      _cache[lowerCaseQuery] = _search(lowerCaseQuery);
    }
    return _cache[lowerCaseQuery]!;
  }

  List<Timezone> _search(String query) {
    final matches = <Timezone>[];
    for (final timezone in timezones) {
      if (timezone._abbreviationLowerCase.contains(query)) {
        matches.add(timezone);
      } else if (timezone.offsetStr.contains(query)) {
        matches.add(timezone);
      } else if (timezone._nameLowerCase.contains(query)) {
        matches.add(timezone);
      }
    }
    return matches;
  }
}
