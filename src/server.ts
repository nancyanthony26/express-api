
import { PrismaClient } from '@prisma/client';
import express from 'express';


const app = express();
const prisma = new PrismaClient

app.get('/', (req,res) => {
    res.send('Hello')
  })

  app.get('/api/technicalskills', async (req,res) => {
    const technicalskills = await prisma.technicalSkills.findMany();

    res.status(200);
    res.json(technicalskills);
});


app.post('/api/technicalskills', async (req,res) => {

  const employees =await prisma.employees.create({
    data:{
       name: 'Anthony',
       email: ' anthony@gmail.com',
       phonenumber: 9841870302,
       gender: 'Male',
       city: 'Hyderbad'
    }
  });

   const technicalSkills=await prisma.technicalSkills.create({
      data:{
        title:'GIT',
        desc: 'Github,Gitbash',
        Employees:{
          connect:{
            id: employees.id
          }
        }
      }
   })
  res.status(201);
  return res.json(technicalSkills);
  
})
app.post('/api/workexperience', async (req,res) => {
const workexperience =await prisma.workExperience.create({
  data:{
     company: 'TCS',
     years:'10',
     TechnicalSkillsId: 4
  }
})
res.status(202);
res.json(workexperience);

})

export default app;