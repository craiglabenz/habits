import 'package:logging/logging.dart';
export 'package:logging/src/level.dart';

/// {@template AppLogger}
/// {@endtemplate}
class AppLogger {
  /// {@macro AppLogger}
  AppLogger(this.name, [Level? level]) : overrideLevel = level;

  Logger? _logger;

  /// [Logger] from pkg:logging.
  Logger get logger => _logger ??= Logger(name);

  /// The name of this logger.
  final String name;

  /// The override level of this logger.
  final Level? overrideLevel;

  /// Default logging behavior using [level] for verbosity.
  void log(Object message, [Level level = Level.INFO]) =>
      logger.log(overrideLevel ?? level, message);

  /// Logs a message with [Level.INFO] importance.
  void info(Object message) => log(message);

  /// Logs a message with [Level.FINE] importance.
  void fine(Object message) => log(message, Level.FINE);

  /// Logs a message with [Level.FINER] importance.
  void finer(Object message) => log(message, Level.FINER);

  /// Logs a message with [Level.FINEST] importance.
  void finest(Object message) => log(message, Level.FINEST);

  /// Logs a message with [Level.WARNING] importance.
  void warning(Object message) => log(message, Level.WARNING);

  /// Logs a message with [Level.SHOUT] importance.
  void shout(Object message) => log(message, Level.SHOUT);

  /// Logs a message with [Level.SEVERE] importance.
  void severe(Object message) => log(message, Level.SEVERE);
}
