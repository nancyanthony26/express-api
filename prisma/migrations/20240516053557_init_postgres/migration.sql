-- CreateTable
CREATE TABLE "Employees" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phonenumber" BIGINT NOT NULL,
    "gender" TEXT NOT NULL,
    "city" TEXT NOT NULL,

    CONSTRAINT "Employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TechnicalSkills" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "desc" TEXT NOT NULL,
    "employeesId" INTEGER,

    CONSTRAINT "TechnicalSkills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkExperience" (
    "id" SERIAL NOT NULL,
    "company" TEXT NOT NULL,
    "years" TEXT NOT NULL,
    "TechnicalSkillsId" INTEGER,

    CONSTRAINT "WorkExperience_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TechnicalSkills" ADD CONSTRAINT "TechnicalSkills_employeesId_fkey" FOREIGN KEY ("employeesId") REFERENCES "Employees"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkExperience" ADD CONSTRAINT "WorkExperience_TechnicalSkillsId_fkey" FOREIGN KEY ("TechnicalSkillsId") REFERENCES "TechnicalSkills"("id") ON DELETE SET NULL ON UPDATE CASCADE;
