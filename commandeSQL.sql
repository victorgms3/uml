-- Pour voir la table avec le type etc
DESCRIBE 'Table'
USE 'nom de la base'

-- 

CREATE TABLE parcs(
    parc_id INTEGER auto_increment PRIMARY KEY NOT NULL,
    nom VARCHAR(50),
    fk_ville_id INTEGER REFERENCES villes(ville_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    date_ouverture INTEGER,
    superficie INTEGER
);

-- Table frequentations
CREATE TABLE frequentations (
    annee YEAR,
    fk_parc_id INT REFERENCES parcs(parc_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY(annee, fk_parc_id),
    nombre_visiteurs INTEGER
);

--------------------------------------------------
--Table constructeurs
CREATE TABLE constructeurs (
    constructeur_id INTEGER auto_increment PRIMARY KEY,
    nom VARCHAR(30),
    fk_ville_id INTEGER REFERENCES villes(ville_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    adresse VARCHAR(100),
    url_site_web VARCHAR(100),
    url_facebook VARCHAR(100),
    url_instagram VARCHAR(100),
    url_linked_in VARCHAR(100),
    date_creation YEAR
);

--------------------------------------------------
--Table elements
CREATE TABLE elements(
    element_id INTEGER auto_increment PRIMARY KEY,
    nom VARCHAR(50)
);



--------------------------------------------------
--Table rollercoasters
CREATE TABLE rollercoasters(
    rollercoaster_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    structure ENUM('acier','bois') NOT NULL,
    type ENUM ('sit down','standup','inverted','suspended','wing','bobsled','flying') DEFAULT NULL,
    date_ouverture YEAR,
    hauteur DECIMAL(4,1),
    fk_constructeur_id  INTEGER  REFERENCES constructeurs(constructeur_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    fk_parc_id INTEGER REFERENCES parcs(parc_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
--------------------------------------------------
--Table compositions

CREATE TABLE compositions(
    fk_rollercoaster_id INTEGER REFERENCES rollercoasters(rollercoaster_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    fk_element_id INTEGER REFERENCES elements(element_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY(fk_rollercoaster_id,fk_element_id),
    nombre INTEGER
);

--------------------------------------------------
-- Insertion d'elements exemple :
INSERT INTO nomTable (attribut_1, attribute_2, ..., attribut_n) VALUES
(val_1_1, val_1_2,..., val_1_n),
...,
(val_N_1, val_N_2,..., val_N_n);

--------------------------------------------------
-- Insertion d'elements pays :
INSERT INTO pays (pays_id, nom) VALUES(1, 'Allemagne'), (2, 'Autriche'), (3, 'Belgique'), (4, 'Danemark'), (5, 'Espagne'), (6, 'Finlande'),(7, 'France'), (8, 'Hongrie'), (9, 'Irlande'), (10, 'Italie'), (11, 'Norvège'), (12, 'Pays de Galles'),(13, 'Pays-Bas'), (14, 'Pologne'), (15, 'Royaume-Uni'), (16, 'Suède'), (17, 'Turquie'), (18, 'Portugal'),    (19, 'Suisse'), (20, 'États Unis'), (21, 'Japon'), (22, 'Liechtenstein');

