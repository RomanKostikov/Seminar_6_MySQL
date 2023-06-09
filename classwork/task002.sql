USE seminar_6;

DROP TABLE IF EXISTS bankaccounts;
CREATE TABLE bankaccounts (
    accountno VARCHAR(20) PRIMARY KEY NOT NULL,
    funds DECIMAL(8 , 2 )
);

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);
SELECT * FROM bankaccounts;

-- Изменим баланс на аккаунтах
START TRANSACTION;
UPDATE bankaccounts SET funds = funds - 100 WHERE accountno='ACC1';
UPDATE bankaccounts SET funds = funds + 100 WHERE accountno='ACC2';
COMMIT;
SELECT * FROM bankaccounts;