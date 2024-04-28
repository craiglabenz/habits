// import 'package:habits_shared/habits_shared.dart';
// import 'package:serverpod/serverpod.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

// class TimezoneEndpoint extends Endpoint {
//   TimezoneEndpoint() {
//     _cacheTimeZones();
//   }

//   late final List<Timezone> _cachedTimezones;

//   void _cacheTimeZones() {
//     final timezones = <Timezone>{};
//     tz.initializeTimeZones();
//     for (final location in tz.timeZoneDatabase.locations.values) {
//       for (final timezone in location.zones) {
//         timezones.add(Timezone.fromTz(timezone, location));
//       }
//     }
//     print('timezones.length :: ${timezones.length}');
//     _cachedTimezones = timezones.toList();
//     _cachedTimezones.sort((a, b) => a.offset.compareTo(b.offset));
//     print('_cachedTimezones.length :: ${_cachedTimezones.length}');
//   }

//   Future<List<Timezone>> list(Session session) async => _cachedTimezones;
// }
