import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/bootstrap.dart';

void main() {
  bootstrap(
    apiBaseUrl: 'https://staging.habits.com',
    env: Environment.qa,
    child: const App(),
  );
}
