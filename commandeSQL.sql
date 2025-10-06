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


