BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" ADD COLUMN "createdAt" timestamp without time zone;
ALTER TABLE "user" ADD COLUMN "updatedAt" timestamp without time zone;

--
-- MIGRATION VERSION FOR habits
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('habits', '20240518205508355-add-users-datetimes', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240518205508355-add-users-datetimes', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240115074239642', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074239642', "timestamp" = now();


COMMIT;
