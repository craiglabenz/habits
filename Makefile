# All
install: server/install client/install shared/install app/install

# Server
server/install:
	cd habits_server && dart pub get

server/build: server/install
	cd habits_server && serverpod generate

migrations:
	cd habits_server && serverpod create-migration

migrate:
	cd habits_server && dart bin/main.dart --apply-migrations --role=maintenance

server:
	cd habits_server && dart bin/main.dart --apply-migrations

# Client
client/install:
	cd habits_client && dart pub get

# Shared
shared/install:
	cd packages/habits_shared && dart pub get

# App
app/install:
	cd habits_flutter && flutter pub get

app:
	cd habits_flutter && flutter run -d macos
