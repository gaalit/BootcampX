const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

//1. create a querry replacing all incoming data as $(number=> starting at 1)
const queryString = `
  SELECT students.id as student_id, students.name as name, cohorts.name as cohort
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2;
  `;

//2. for each $(data) create variables
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
//3. store the vulnerable data into one array
const values = [`%${cohortName}%`, limit];


//4. join querry and array of variables in the pool.querry
pool.query(queryString, values).then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
}).catch(err => console.error('query error', err.stack));