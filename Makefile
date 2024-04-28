# All
install: packages/install server/install client/install shared/install app/install

test: packages/test app/test

# Packages
packages/install:
	cd packages/app_shared && dart pub get
	cd packages/app_client && flutter pub get
	cd habits_shared && dart pub get

packages/build:
	cd packages/app_shared && dart run build_runner build --delete-conflicting-outputs
	cd packages/app_client && dart run build_runner build --delete-conflicting-outputs
	habits_shared && dart run build_runner build --delete-conflicting-outputs

packages/test:
	cd packages/app_shared && dart test
	cd packages/app_client && flutter test
	cd habits_shared && dart test

# Server
server/install:
	cd habits_server && dart pub get

server/build: generate

generate:
	cd habits_server && serverpod generate
	cd habits_server && dart bin/adjust_protocol.dart

migrations:
	cd habits_server && serverpod create-migration

migrate:
	cd habits_server && dart bin/main.dart --apply-migrations --role=maintenance

server/run:
	cd habits_server && dart bin/main.dart --apply-migrations

# Client
client/install:
	cd habits_client && dart pub get

# App
app/install:
	cd habits_flutter && flutter pub get

app/intl:
	cd habits_flutter && flutter gen-l10n

app/run:
	cd habits_flutter && flutter run -d macos

app/test:
	cd habits_flutter && flutter test
