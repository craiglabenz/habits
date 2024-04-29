import 'dart:io' as io;
import 'package:logging/logging.dart';

/// Turns on logging for messages above a given [Level].
void initLogging(Level level) {
  Logger.root.level = level;
  Logger.root.onRecord.listen((record) {
    // ignore: missing_whitespace_between_adjacent_strings
    io.stdout.writeln('${record.level.name} [${record.loggerName}]'
        '['
        '${record.time.hour}:'
        '${record.time.minute.toString().padLeft(2, "0")}:'
        '${record.time.second.toString().padLeft(2, "0")}.'
        '${record.time.millisecond.toString().padRight(3, "0")}'
        '] ${record.message}');
  });
  Logger('LOGGING').info('Logging initialized to $level');
}
