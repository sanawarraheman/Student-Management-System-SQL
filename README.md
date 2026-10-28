# Student Management System (MySQL)

A beginner-friendly SQL project for managing students, subjects, and marks using MySQL.

## Project Overview

This project demonstrates how to:
- Create a database and relational tables
- Use primary keys and foreign keys
- Create a stored procedure to add a student
- Insert subject and marks records
- Join students, subjects, and marks
- Calculate total marks and average marks
- Sort results to identify the top-performing student

## Database Structure

```text
studentmanegementDB
├── students
│   ├── student_id (Primary Key)
│   ├── student_name
│   ├── student_gender
│   ├── student_contact
│   └── student_email
├── sujects
│   ├── subject_id (Primary Key)
│   └── subject_name
└── marks
    ├── mark_id (Primary Key)
    ├── student_id (Foreign Key → students.student_id)
    ├── subject_id (Foreign Key → sujects.subject_id)
    └── marks
```

> Note: The table is named `sujects` in the current SQL script. This spelling is preserved exactly as in the original code.

## SQL Concepts Used

- `CREATE DATABASE` and `USE`
- `CREATE TABLE`
- `PRIMARY KEY` and `AUTO_INCREMENT`
- `ENUM` and `VARCHAR`
- `FOREIGN KEY`
- Stored procedure (`CREATE PROCEDURE`, `CALL`)
- `INSERT INTO`
- `INNER JOIN`
- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`
- `GROUP BY`, `ORDER BY`, and `LIMIT`

## How to Run

1. Open MySQL Workbench.
2. Open `student_management.sql`.
3. Select the whole script and run it in a fresh schema/environment.
4. Review the output of the `SELECT` queries.

## Important Notes Before Running

The SQL file is kept as originally provided; its SQL statements have not been changed.

Depending on the existing database state and foreign-key constraints, some sample inserts may fail:
- The script creates three subjects, so their auto-generated IDs will normally be `1`, `2`, and `3`; the sample marks rows also reference subject ID `4`.
- The second marks insert references student ID `2`, but the script only calls the procedure once to add one student.
- The final query uses `COUNT(*) AS total_students` in a grouped query. In that query, the count is the number of matching marks rows per student, not the overall number of students.

These notes are included so anyone reviewing or running the project understands the current script behavior.

## Author

Sanawar Raheman

## Future Improvements

- Add more student records through the `addstudent` procedure.
- Add validation for marks and IDs.
- Add a separate query for the overall student count.
- Add sample output screenshots.
