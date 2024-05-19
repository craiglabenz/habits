import 'dart:io';
import 'package:ansi/ansi.dart' as ansi;
import 'package:path/path.dart' as path;

/// Lists the class names to which to apply the toJson/fromJson modification.
/// These are any classes from the `shared` directory - not models completely
/// managed by Serverpod.
const classNamesToAdjust = <String>[
  'UserFilter',
];

void main() {
  if (!Directory.current.path.endsWith('habits_server')) {
    stderr.writeln(
      'Invoked `adjust_protocol.dart` from wrong directory. '
      'Use Makefile to run this after running `serverpod generate`.',
    );
    exit(1);
  }

  final serverProtocol = File(
    path.join(Directory.current.path, 'lib/src/generated/protocol.dart'),
  );

  if (!serverProtocol.existsSync()) {
    stderr.writeln('Could not find server protocol file');
    exit(1);
  }
  for (final className in classNamesToAdjust) {
    dropProtocolParameter(className, serverProtocol);
  }
  stdout.writeln(ansi.green('Updated server protocol.dart'));

  final clientProtocol = File(
    path.join(
      Directory.current.path,
      '../habits_client/lib/src/protocol/protocol.dart',
    ),
  );

  if (!clientProtocol.existsSync()) {
    stderr.writeln('Could not find client protocol file');
    exit(1);
  }
  for (final className in classNamesToAdjust) {
    dropProtocolParameter(className, clientProtocol);
  }
  stdout.writeln(ansi.green('Updated client protocol.dart'));
}

void dropProtocolParameter(String className, File file) {
  final content = file.readAsStringSync();
  file.writeAsStringSync(
    content.replaceAll(
      '$className.fromJson(data, this)',
      '$className.fromJson(data)',
    ),
  );
}
