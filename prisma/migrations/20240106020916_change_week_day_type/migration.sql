/*
  Warnings:

  - You are about to alter the column `week_day` on the `habit-week_days` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_habit-week_days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,
    CONSTRAINT "habit-week_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_habit-week_days" ("habit_id", "id", "week_day") SELECT "habit_id", "id", "week_day" FROM "habit-week_days";
DROP TABLE "habit-week_days";
ALTER TABLE "new_habit-week_days" RENAME TO "habit-week_days";
CREATE UNIQUE INDEX "habit-week_days_habit_id_week_day_key" ON "habit-week_days"("habit_id", "week_day");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
