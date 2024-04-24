import 'dart:io';
import 'package:ansi/ansi.dart' as ansi;
import 'package:path/path.dart' as path;

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
  dropProtocolParameter(serverProtocol);
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
  dropProtocolParameter(clientProtocol);
  dropProtocolParameter(serverProtocol);
  stdout.writeln(ansi.green('Updated client protocol.dart'));
}

void dropProtocolParameter(File file) {
  final content = file.readAsStringSync();
  file.writeAsStringSync(
    content.replaceAll('fromJson(data, this)', 'fromJson(data)'),
  );
}
