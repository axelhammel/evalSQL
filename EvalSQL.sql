DROP DATABASE IF EXISTS evalSQL;
CREATE DATABASE if NOT EXISTS evalSQL;
USE evalSQL;

CREATE TABLE IF NOT EXISTS clients(
cli_num INT PRIMARY KEY,
cli_nom VARCHAR(50),
cli_adresse VARCHAR(50),
cli_tel VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS produit(
pro_num INT PRIMARY KEY,
pro_libelle VARCHAR(50),
pro_description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS commande(
com_num INT PRIMARY KEY,
cli_num INT,
com_date DATETIME,
com_obs VARCHAR(50),
FOREIGN KEY(cli_num) REFERENCES clients(cli_num)
);

CREATE TABLE IF NOT EXISTS est_compose(
com_num INT,
pro_num INT,
est_qte INT,
PRIMARY KEY(com_num,pro_num),
FOREIGN KEY(com_num) REFERENCES commande(com_num),
FOREIGN KEY(pro_num) REFERENCES produit(pro_num)
);
DROP INDEX IF EXISTS index_infos ON clients;
ALTER TABLE clients;
CREATE INDEX index_infos ON clients(cli_nom);
