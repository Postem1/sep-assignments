CREATE TABLE rooms (
  roomid integer PRIMARY KEY,
  room_number integer,
  floor_number integer NOT NULL,
  price_per_night numeric(5, 2) NOT NULL
);

INSERT INTO rooms (roomid, room_number, floor_number, price_per_night)
    VALUES
    (1, 1, 5, 100.00),
    (2, 2, 5, 130.00),
    (3, 3, 5, 99.99),
    (4, 4, 5, 200.00),
    (5, 5, 10, 250.00)
    ;
