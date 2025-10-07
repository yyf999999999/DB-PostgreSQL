import { db } from "@/libs/drizzle";
import { pgTable, serial, text, integer } from "drizzle-orm/pg-core";

const s_users = pgTable("s_users", {
  id: serial("id").primaryKey(),
  name: text("name").notNull(),
  age: integer("age"),
});

const users = await db.select().from(s_users);
console.log(users);
