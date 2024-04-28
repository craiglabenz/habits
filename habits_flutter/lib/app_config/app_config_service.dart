import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';

/// Interface of the AppConfigRepository's `service` field.
// ignore: one_member_abstracts
abstract class IAppConfigService {
  /// A Stream of app config [Map]s.
  Stream<Map<String, Object?>> appConfig();
}

/// Real implementation of the AppConfigRepository's `service` field.
// class FirestoreAppConfigService extends IAppConfigService {
//   FirestoreAppConfigService() : _firestore = FirebaseFirestore.instance;

//   final FirebaseFirestore _firestore;

//   @override
//   Stream<Map<String, Object?>> appConfig() => _firestore
//       .doc('global/app_config')
//       .snapshots()
//       .map((snapshot) => snapshot.data() ?? <String, dynamic>{})
//       .asBroadcastStream();
// }

/// {@template FakeAppConfigService}
/// Fake implementation of the AppConfigRepository's `service` field.
/// {@endtemplate}
class FakeAppConfigService extends IAppConfigService {
  /// {@macro FakeAppConfigService}
  FakeAppConfigService()
      : _appConfigController = StreamController<Map<String, Object?>>();

  final StreamController<Map<String, Object?>> _appConfigController;

  /// Fake-only method to force a new app config onto the stream for any
  /// listeners.
  void add(Map<String, dynamic> val) => _appConfigController.add(val);

  @override
  Stream<Map<String, Object?>> appConfig() =>
      _appConfigController.stream.asBroadcastStream();
}
