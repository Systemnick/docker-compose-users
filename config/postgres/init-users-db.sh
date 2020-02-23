#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 <<-EOSQL
    CREATE TABLE users
    (
      id uuid NOT NULL
        CONSTRAINT users_pk
          PRIMARY KEY,
      login VARCHAR(255) NOT NULL,
      password VARCHAR(255) NOT NULL,
      email VARCHAR(255) NOT NULL,
      phone VARCHAR(255) NOT NULL,
      creation_time TIMESTAMP NOT NULL
    );

    ALTER TABLE users OWNER TO postgres;

    CREATE UNIQUE INDEX users_id_uindex
      ON users (id);

    CREATE UNIQUE INDEX users_email_uindex
      ON users (email);

    CREATE UNIQUE INDEX users_login_uindex
      ON users (login);

    CREATE UNIQUE INDEX users_phone_uindex
      ON users (phone);

EOSQL
