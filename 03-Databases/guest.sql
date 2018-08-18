CREATE TABLE guests (
    guestid integer PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    email VARCHAR (50) NOT NULL
);

INSERT INTO guests (guestid, first_name, last_name, email)
    VALUES
    (1, 'Steeve', 'Powers','sp@aol.com'),
    (2, 'Bob', 'Mathews', 'bm@gmail.com'),
    (3, 'Kathy', 'Griffin', 'kg@att.com'),
    (4, 'Oscar', 'Robinson', 'lost@yahoo.com'),
    (5, 'Kevin', 'Dove','kd@aol.com');
