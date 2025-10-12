import type { s_users } from "@prisma/client";
import { prisma } from "@/libs/prisma";

const users: s_users[] = await prisma.s_users.findMany();
console.log(users);
