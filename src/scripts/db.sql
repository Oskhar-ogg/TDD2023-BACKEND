CREATE DATABASE IF NOT EXISTS oscarc_bd;

USE oscarc_bd;

CREATE TABLE IF NOT EXISTS bitacora (
    bitacora_id INT NOT NULL AUTO_INCREMENT,
    bitacora_title VARCHAR(255) NOT NULL,
    bitacora_description TEXT NOT NULL,
    PRIMARY KEY (bitacora_id)
);

INSERT INTO bitacora (bitacora_title, bitacora_description) VALUES ('Bitacora 1', 'Descripcion de la bitacora 1');
INSERT INTO bitacora (bitacora_title, bitacora_description) VALUES ('Bitacora 2', 'Descripcion de la bitacora 2');
INSERT INTO bitacora (bitacora_title, bitacora_description) VALUES ('Bitacora 3', 'Descripcion de la bitacora 3');