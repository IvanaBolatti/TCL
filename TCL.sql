CREATE SCHEMA biblioteca;
USE biblioteca;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE autor(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    id_nacionalidad INT NOT NULL,
    FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad (id)
);

-- Uso de commit
START TRANSACTION;
INSERT INTO lector VALUES (null, "Carlos", "Mina","San Martin 231");
INSERT INTO lector VALUES (null, "Belen", "Rodriguez"," Uruguay 432");
COMMIT;

-- Uso de rollback
START TRANSACTION;
INSERT INTO lector VALUES (null, "Camila", "Paz","San Jeronimo 231");
DELETE FROM lector WHERE apellido="Mina";
ROLLBACK;

-- Uso de savepoint 
START TRANSACTION;
INSERT INTO lector VALUES (null, "Romina", "Tome","Los Talas 543");
DELETE FROM lector WHERE apellido="Mina";
SAVEPOINT sp1;
INSERT INTO lector VALUES (null, "Claudio", "Gomez","Los Nilos 543");
INSERT INTO lector VALUES (null, "Catalina", "Moreno","Las Palmeras 543");
ROLLBACK TO sp1;

SELECT * FROM lector;


