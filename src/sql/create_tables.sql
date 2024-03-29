-- Creation of parameter table
CREATE TABLE IF NOT EXISTS parameter (
  parameter_id SMALLINT PRIMARY KEY,
  password BYTEA NULL,
  initialized BOOLEAN NOT NULL
);

-- Creation of account table
CREATE TABLE IF NOT EXISTS account (
  account_id CHAR(1) PRIMARY KEY,
  email VARCHAR(250) UNIQUE NULL,
  password BYTEA NULL,
  initialized BOOLEAN NOT NULL
);

-- Creation of loginfo table
CREATE TABLE IF NOT EXISTS loginfo (
  loginfo_id SERIAL PRIMARY KEY,
  account_id CHAR(1) NULL,
  log_date TIMESTAMP NOT NULL,
  log_description VARCHAR(100),
  CONSTRAINT fk_account
      FOREIGN KEY(account_id)
    REFERENCES account(account_id)
);

-- Fill parameter table
INSERT INTO parameter(parameter_id, initialized)
VALUES (1, FALSE)
ON CONFLICT (parameter_id) DO NOTHING;

-- Fill account table
INSERT INTO account(account_id, initialized)
VALUES ('A', FALSE),
       ('B', FALSE),
       ('C', FALSE),
       ('D', FALSE)
ON CONFLICT (account_id) DO NOTHING;
