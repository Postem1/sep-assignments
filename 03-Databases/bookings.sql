CREATE TABLE bookings (
    bookingid integer PRIMARY KEY,
    roomid integer NOT NULL,
    guestid integer NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL,

    FOREIGN KEY ("guestid")
    REFERENCES "guests" ("guestid")
    ON DELETE CASCADE,

    FOREIGN KEY ("roomid")
    REFERENCES "rooms" ("roomid")
    ON DELETE CASCADE
);

INSERT INTO bookings (bookingid, roomid, guestid, check_in, check_out)
    VALUES
    (1, 1, 1, '2018-08-01', '2018-08-02' ),
    (2, 2, 2, '2018-08-04', '2018-08-05' ),
    (3, 3, 3, '2018-08-02', '2018-08-09' ),
    (4, 4, 4, '2018-08-03', '2018-08-04' ),
    (5, 5, 1, '2018-08-01', '2018-08-02' ),
    (6, 2, 2, '2018-08-06', '2018-08-07' ),
    (7, 5, 4, '2018-08-03', '2018-08-05' );
