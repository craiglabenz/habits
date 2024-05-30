import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/bootstrap.dart';

void main() {
  const url = String.fromEnvironment('SERVER_URL');
  bootstrap(
    // Allows Emulator to hit localhost
    apiBaseUrl: url != '' ? url : 'http://macbook.local:8080/',
    // Allows a connected device to hit localhost
    // (IP address may need updating)
    // apiBaseUrl: 'http://192.168.1.75:8000',
    env: Environment.dev,
    child: const App(),
  );
}
