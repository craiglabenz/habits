import 'package:habits_flutter/app/app.dart';
import 'package:habits_flutter/app_config/app_config.dart';
import 'package:habits_flutter/bootstrap.dart';
import 'package:habits_flutter/core/core.dart';

void main() {
  bootstrap(
    apiBaseUrl: 'https://habits.com',
    env: Environment.prod,
    child: App(deps: AppDependencies()),
  );
}
