CREATE DATABASE cars;
GRANT ALL PRIVILEGES ON DATABASE cars TO program;

\c cars
CREATE TABLE cars
(
    id                  SERIAL PRIMARY KEY,
    car_uid             uuid UNIQUE NOT NULL,
    brand               VARCHAR(80) NOT NULL,
    model               VARCHAR(80) NOT NULL,
    registration_number VARCHAR(20) NOT NULL,
    power               INT,
    price               INT         NOT NULL,
    type                VARCHAR(20)
        CHECK (type IN ('SEDAN', 'SUV', 'MINIVAN', 'ROADSTER')),
    availability        BOOLEAN     NOT NULL
);
ALTER TABLE cars OWNER TO program;
GRANT ALL PRIVILEGES ON TABLE cars TO program;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO program;


CREATE DATABASE rentals;
GRANT ALL PRIVILEGES ON DATABASE rentals TO program;

\c rentals
CREATE TABLE rental
(
    id          SERIAL PRIMARY KEY,
    rental_uid  uuid UNIQUE              NOT NULL,
    username    VARCHAR(80)              NOT NULL,
    payment_uid uuid                     NOT NULL,
    car_uid     uuid                     NOT NULL,
    date_from   TIMESTAMP WITH TIME ZONE NOT NULL,
    date_to     TIMESTAMP WITH TIME ZONE NOT NULL,
    status      VARCHAR(20)              NOT NULL
        CHECK (status IN ('IN_PROGRESS', 'FINISHED', 'CANCELED'))
);
ALTER TABLE rental OWNER TO program;
GRANT ALL PRIVILEGES ON TABLE rental TO program;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO program;


CREATE DATABASE payments;
GRANT ALL PRIVILEGES ON DATABASE payments TO program;

\c payments
CREATE TABLE payment
(
    id          SERIAL PRIMARY KEY,
    payment_uid uuid        NOT NULL,
    status      VARCHAR(20) NOT NULL
        CHECK (status IN ('PAID', 'CANCELED')),
    price       INT         NOT NULL
);
ALTER TABLE payment OWNER TO program;
GRANT ALL PRIVILEGES ON TABLE payment TO program;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO program;