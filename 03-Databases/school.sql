

CREATE TABLE students (
  "id" INTEGER,
  "name" VARCHAR(50),

  PRIMARY KEY("id")
  );

INSERT INTO students
  ("id", "name")
  VALUES
  ( 1,   'Goku'),
  ( 2,   'Gohan'),
  ( 3,   'Vegeta'),
  ( 4,   'Bulma'),
  ( 5,   'Krillin'),
  ( 6,   'Picolo'),
  ( 7,   'Goten'),
  ( 8,   'Trunks'),
  ( 9,   'Frieza');
-- ====================================


CREATE TABLE classes(
  "id" INTEGER,
  "name" VARCHAR(50),

  PRIMARY KEY("id")
);

INSERT INTO classes
  ("id", "name")
  VALUES
  (11, 'Chemistry'),
  (22, 'History'),
  (33, 'English'),
  (44, 'French'),
  (55, 'Biology'),
  (66, 'Anatomy'),
  (77, 'Calculus'),
  (88, 'Computer Science'),
  (99, 'Math');
-- ====================================


CREATE TABLE report(
"id"           INTEGER,
"class_id"     INTEGER,
"student_id"   INTEGER,
"grade"        VARCHAR(3),
CHECK( grade in ('A', 'A+', 'B', 'C', 'D', 'F')),

FOREIGN KEY ("class_id")
  REFERENCES "classes" ("id")
  ON DELETE CASCADE,

FOREIGN KEY ("student_id")
  REFERENCES "students" ("id")
  ON DELETE CASCADE,

PRIMARY KEY("id")
);

INSERT INTO report
  ("id", "student_id", "class_id", "grade")
  VALUES
  (1, 1, 99, 'A+'),
  (2, 2, 99, 'C'),
  (3, 3, 99, 'B'),
  (4, 4, 99, 'A'),
  (5, 5, 99, 'C'),
  (6, 6, 99, 'F'),
  (7, 7, 99, 'A'),
  (8, 8, 99, 'A+'),
  (9, 9, 99, 'C'),
  (10, 1, 88, 'A'),
  (11, 1, 77, 'A'),
  (12, 1, 66, 'D'),
  (13, 1, 55, 'A'),
  (14, 1, 44, 'A'),
  (15, 1, 33, 'A'),
  (16, 1, 22, 'B'),
  (17, 1, 11, 'A+');
