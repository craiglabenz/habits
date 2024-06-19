// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'dart:async';

import 'package:meta/meta.dart';

/// Possible statuses for the readiness check flow.
enum Readiness {
  /// Fully ready. All dependencies cleared.
  ready,

  /// Striving for readiness. Some or all dependencies not yet cleared.
  loading,

  /// Failed to achieve readiness. This is potentially fatal.
  failed,
}

/// Adds functionality to check and verify readiness. This usually constitutes
/// completing some asynchronous setup operation, but could also involve
/// depending on another object's readiness and then taking an action.
mixin ReadinessMixin {
  /// Cache of whether this object is ready. Set by the completer.
  Readiness status = Readiness.loading;

  /// Returns `true` if this object has successfully achieved readiness.
  bool get isReady => status == Readiness.ready;

  /// Returns `true` if this object has not yet successfully achieved readiness,
  /// or if this object has failed.
  bool get isNotReady => status != Readiness.ready;

  /// Returns `true` if this object has failed to achieve readiness.
  bool get failed => status == Readiness.failed;

  /// Returns `true` if this object has either achieved readiness or died
  /// trying.
  bool get isResolved => status != Readiness.loading;

  /// Returns `true` if this object is still trying to achieve readiness.
  bool get isNotResolved => status == Readiness.loading;

  // That which flips the readiness bit.
  Completer<bool>? _readinessCompleter;

  /// Resolves when readiness is achieved, or immediately if it has already been
  /// achieved.
  Future<bool> get ready {
    if (_readinessCompleter == null) {
      throw Exception('Accessed `ready` without calling `initReadyCheck`');
    }
    return _readinessCompleter!.future;
  }

  /// Adds wires up listeners for when readiness is achieved.
  @mustCallSuper
  void initReadyCheck() {
    if (_readinessCompleter != null && !_readinessCompleter!.isCompleted) {
      _readinessCompleter!.complete(false);
    }
    _readinessCompleter = Completer<bool>();
  }

  /// Marks this object as ready.
  void markReady() {
    if (_readinessCompleter!.isCompleted) {
      if (failed) {
        throw Exception(
          'Cannot mark an object as ready after previously marking it unready',
        );
      }
      return;
    }
    status = Readiness.ready;
    _readinessCompleter!.complete(true);
  }

  /// Mark this object is having failed to achieve readiness. This is different
  /// than the time spent acquiring readiness, which does not indicate a
  /// catastrophic failure as this likely does.
  void markReadinessFailed() {
    if (_readinessCompleter!.isCompleted) {
      if (isReady) {
        throw Exception(
          'Cannot mark an object as unready after previously marking it ready',
        );
      }
      return;
    }
    status = Readiness.failed;
    _readinessCompleter!.complete(false);
  }
}
