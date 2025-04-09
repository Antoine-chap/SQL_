CREATE DATABASE IF NOT EXISTS address_book;

CREATE TABLE IF NOT EXISTS contacts (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    email VARCHAR (100) UNIQUE NOT NULL,
    creat_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO contacts
(first_name, last_name, email)
VALUES ("faker","boss","fakerleboss@gmail.com"),
       ("manu","lasap","manulasap@gmail.com"),
       ("tsubi","chat","tsubichat@gmail.com");

UPDATE contacts
SET email = 'manulesapologue@gmail.com'
WHERE first_name = 'manu';

DELETE FROM contacts WHERE first_name = "faker";

INSERT INTO contacts
(first_name, last_name, email)
VALUES ("faker","boss","fakerboss@gmail.com");

ALTER TABLE contacts
ADD phone_number  VARCHAR (20);

UPDATE contacts
SET phone_number = (case when email = "fakerboss@gmail.com" then '0444778899'
                         when email = 'manulesapologue@gmail.com' then '0888696969'
                         when email = "tsubichat@gmail.com" then '0222223344'
                    end);








