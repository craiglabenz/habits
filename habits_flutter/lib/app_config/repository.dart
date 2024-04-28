import 'dart:async';

import 'package:habits_flutter/app_config/app_config.dart';

/// {@template AppConfigRepository}
/// Repository which manages determining whether the application
/// is in maintenance mode or needs to be force upgraded.
///
/// [AppConfigRepository] listens to a stream of Maps from its supplied
/// [IAppConfigService] and converts each yielded entry into updates for the
/// app.
/// {@endtemplate}
abstract interface class BaseAppConfigRepository {
  /// Returns a [Stream<bool>] which indicates whether
  /// the current application status is down for maintenance.
  ///
  /// By default, [isDownForMaintenance] will emit `false`
  /// if unable to connected to the backend.
  Stream<bool> get isDownForMaintenance;

  /// Returns a [Stream<ForceUpgrade>] which indicates whether
  /// the current application requires a force upgrade.
  Stream<ForceUpgrade> get isForceUpgradeRequired;
}

/// {@macro AppConfigRepository}
class AppConfigRepository implements BaseAppConfigRepository {
  /// {@macro AppConfigRepository}
  AppConfigRepository({
    required IAppConfigService service,
    required AppDetails details,
  })  : _appDetails = details,
        _service = service,
        _maintenanceController = StreamController<bool>(),
        _upgradeController = StreamController<ForceUpgrade>() {
    _service.appConfig().listen(_onAppConfig);
  }

  final IAppConfigService _service;
  final AppDetails _appDetails;

  bool? _lastDownForMaintenance;
  ForceUpgrade? _lastForceUpgrade;

  /// Pass-thru stream from underlying `_service.appConfig()`
  final StreamController<bool> _maintenanceController;

  /// Pass-thru stream from underlying `_service.appConfig()`
  final StreamController<ForceUpgrade> _upgradeController;

  void _onAppConfig(Map<String, dynamic> configData) {
    try {
      final config = AppConfig.fromJson(configData);
      if (config.downForMaintenance != _lastDownForMaintenance) {
        _lastDownForMaintenance = config.downForMaintenance;
        _maintenanceController.add(_lastDownForMaintenance!);
      }

      final upgrade =
          ForceUpgrade.fromAppConfig(config, appDetails: _appDetails);
      if (upgrade != _lastForceUpgrade) {
        _lastForceUpgrade = upgrade;
        _upgradeController.add(_lastForceUpgrade!);
      }
    } catch (e) {
      _lastDownForMaintenance = false;
      _maintenanceController.add(_lastDownForMaintenance!);
      _lastForceUpgrade = const ForceUpgrade(isUpgradeRequired: false);
      _upgradeController.add(_lastForceUpgrade!);
    }
  }

  @override
  Stream<bool> get isDownForMaintenance =>
      _maintenanceController.stream.transform<bool>(
        StreamTransformer.fromHandlers(
          handleError: (obj, stackTrace, sink) {
            // ignore: avoid_print
            print(stackTrace);
            sink.add(false);
          },
        ),
      ).asBroadcastStream();

  @override
  Stream<ForceUpgrade> get isForceUpgradeRequired =>
      _upgradeController.stream.transform<ForceUpgrade>(
        StreamTransformer.fromHandlers(
          handleError: (obj, stacktrace, sink) {
            // ignore: avoid_print
            print(stacktrace);
            sink.add(const ForceUpgrade(isUpgradeRequired: false));
          },
        ),
      ).asBroadcastStream();
}

/// Faked implementation of [BaseAppConfigRepository] for testing.
class FakeAppConfigRepository implements BaseAppConfigRepository {
  final _maintenanceController = StreamController<bool>.broadcast();
  final _upgradeController = StreamController<ForceUpgrade>.broadcast();

  /// Forces a "requires maintenance" signal through the repository's stream.
  void publishRequiredMaintenance() => _maintenanceController.add(true);

  /// Forces a "no maintenance required" signal through the repository's stream.
  void publishNoMaintenance() => _maintenanceController.add(false);

  /// Forces a specific upgrade signal through the repository.
  void publishUpgradeStatus(ForceUpgrade val) => _upgradeController.add(val);

  @override
  // TODO: implement isDownForMaintenance
  Stream<bool> get isDownForMaintenance => _maintenanceController.stream;

  @override
  // TODO: implement isForceUpgradeRequired
  Stream<ForceUpgrade> get isForceUpgradeRequired => _upgradeController.stream;
}
