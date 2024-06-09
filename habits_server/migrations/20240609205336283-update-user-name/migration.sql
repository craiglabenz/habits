BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" RENAME COLUMN "name" TO "username";
ALTER TABLE "user" ADD COLUMN "firstName" text;
ALTER TABLE "user" ADD COLUMN "lastName" text;
ALTER TABLE "user" ALTER COLUMN "createdAt" SET NOT NULL;
ALTER TABLE "user" ALTER COLUMN "updatedAt" SET NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "serverpod_user_info" ALTER COLUMN "userName" DROP NOT NULL;

--
-- MIGRATION VERSION FOR habits
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('habits', '20240609205336283-update-user-name', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240609205336283-update-user-name', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
