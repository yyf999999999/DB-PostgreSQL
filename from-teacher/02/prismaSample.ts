import { prisma } from "@/libs/prisma";

const users = await prisma.s_users.findMany();
console.log(users);
