# All
install: packages/install server/install client/install shared/install app/install

test: packages/test app/test server/test

# Packages
packages/install:
	cd packages/app_shared && dart pub get
	cd packages/app_client && flutter pub get
	cd habits_shared && dart pub get

app_shared/build:
	cd packages/app_shared && dart run build_runner build --delete-conflicting-outputs

app_client/build:
	cd packages/app_client && dart run build_runner build --delete-conflicting-outputs

habits_shared/build:
	cd habits_shared && dart run build_runner build --delete-conflicting-outputs

packages/build: app_shared/build app_client/build habits_shared/build

packages/test:
	cd packages/app_shared && dart test
	cd packages/app_client && flutter test
	# cd habits_shared && dart test

# Server
server/install:
	cd habits_server && dart pub get

server/build: server/generate

server/mocks:
	cd habits_server && dart run build_runner build

server/test:
	cd habits_server && dart test

server/generate:
	cd habits_server && serverpod generate

server/migrations:
	cd habits_server && serverpod create-migration

server/migrate:
	cd habits_server && dart bin/main.dart --apply-migrations --role=maintenance

server/run:
	cd habits_server && dart bin/main.dart --apply-migrations

# Client
client/install:
	cd habits_client && dart pub get

# App
app/build:
	cd habits_flutter && flutter pub run build_runner build --delete-conflicting-outputs
	cd habits_flutter && flutter pub get

app/install:
	cd habits_flutter && flutter pub get

app/intl:
	cd habits_flutter && flutter gen-l10n

app/run:
	cd habits_flutter && flutter run -d macos --target=lib/main_development.dart

app/run/iphone:
	cd habits_flutter && flutter run -d "Craig" --target=lib/main_development.dart --dart-define=SERVER_URL=http://macbook.local:8080/

app/test:
	cd habits_flutter && flutter test
