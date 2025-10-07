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
--------------------------------------------------
-- Insertion d'elements villes :
INSERT INTO villes (ville_id, nom, fk_pays_id) VALUES(1, 'Bad Wörishofen', 1), (2, 'Bottrop', 1), (3, 'Brühl', 1), (4, 'Friesoythe-Thüle', 1), (5, 'Geiselwind', 1), (6, 'Hassloch', 1), (7, 'Leipzig', 1), (8, 'Lengenfeld', 1),(9, 'Loifling', 1), (10, 'Rust', 1), (11, 'Salzhemmendorf', 1), (12, 'Sierksdorf', 1), (13, 'Wustermark', 1), (14, 'St. Margarethen', 2), (15, 'Vienne', 2), (16, 'Adinkerke-De Panne', 3),(17, 'Lichtaart', 3), (18, 'Wavre', 3), (19, 'Ypres', 3), (20, 'Århus', 4), (21, 'Copenhague', 4), (22, 'Holme-Olstrup', 4), (23, 'Klampenborg', 4), (24, 'Nimtofte', 4),(25, 'Nykøbing', 4), (26, 'Benidorm', 5), (27, 'Madrid', 5), (28, 'Salou', 5), (29, 'San Martín de la Vega', 5), (30, 'Helsinki', 6), (31, 'Kauhava', 6), (32, 'Tampere', 6),(33, 'Bocasse', 7), (34, 'Dolancourt', 7), (35, 'Jeanménil', 7), (36, 'Maizières-les-Metz', 7), (37, 'Marne la Vallée', 7), (38, 'Merlimont', 7), (39, 'Plailly', 7), (40, 'Plumelin', 7),(41, 'Saint-Paul', 7), (42, 'Saint-Pierre-du-Perray', 7), (43, 'Budapest', 8), (44, 'Ashbourne', 9), (45, 'Belpasso', 10), (46, 'Castagneto Carducci', 10), (47, 'Castelnuovo del Garda', 10), (48, 'Fasano', 10),(49, 'Jesolo', 10), (50, 'Rimini', 10), (51, 'Savio', 10), (52, 'Treviso', 10), (53, 'Valmontone', 10), (54, 'Vinterbro', 11), (55, 'Narberth', 12), (56, 'Biddinghuizen', 13),(57, 'Hellendoorn', 13), (58, 'Kaatsheuvel', 13), (59, 'La Haye', 13), (60, 'Sevenum', 13), (61, 'Rzgów', 14), (62, 'Zator', 14), (63, 'Alton', 15), (64, 'Blackpool', 15),(73, 'Skegness', 15), (74, 'Southend On Sea', 15), (75, 'Gothenburg', 16), (76, 'Stockholm', 16), (77, 'Antalya', 17), (78, 'Tuzla', 17), (79, 'Quarteira', 18), (80, 'Reisbach', 1),(65, 'Brean', 15), (66, 'Chertsey', 15), (67, 'Chessington', 15), (68, 'Drayton Bassett', 15), (69, 'Great Yarmouth', 15), (70, 'Ingoldmells', 15), (71, 'Lowestoft', 15), (72, 'Romsey', 15),(89, 'Jeanménil', 7), (90, 'Geiselwind', 1), (91, 'Lengenfeld', 1), (92, 'Gävle', 16), (94, 'Soltau', 1), (95, 'Lillehammer', 11), (96, 'Séville', 5), (97, 'Jaderberg', 1),(81, 'Rome', 10), (82, 'Lipperswil', 19), (83, 'Wassenaar', 13), (84, 'Cleebronn', 1), (85, 'Vias', 7), (86, 'Blokhus', 4), (87, 'Salou', 5), (88, 'Malton', 15),(106, 'Lazise', 10), (107, 'Marseillan', 7), (108, 'Monteux', 7), (109, 'Kaisersbach', 1), (110, 'Slagharen', 13), (111, 'Benidorm', 5), (112, 'Barcelone', 5), (113, 'Istanbul', 17),(98, 'Wustermark', 1), (99, 'Kolmården', 16), (100, 'Milizac', 7), (101, 'Dompierre-sur-Besbre', 7), (102, 'Chorzów', 14), (103, 'Agde', 7), (104, 'Torzym', 14), (105, 'Kayseri', 17),(122, 'Atlanta', 20), (123, 'Baltimore', 20), (124, 'Cincinnati ', 20), (125, 'Clearfield', 20), (126, 'Hayden', 20), (127, 'La Selva Beach', 20), (128, 'Logan', 20), (129, 'Sunbury', 20),(130, 'Altavilla Vicentina', 10), (131, 'Suzzara', 10), (132, 'Trevise', 10), (133, 'Schaan', 22),(134, 'Vlodrop', 13), (135, 'Weert', 13), (136, 'Altendorf', 19), (137, 'Monthey', 19),(138, 'Sankt Jakob in Haus', 2);(114, 'Les Avenières', 7), (115, 'Sankt Jakob in Haus', 2), (116, 'Deggendorf', 1), (117, 'München', 1), (118, 'Münsterhausen', 1), (119, 'Rasdorf', 1), (120, 'Waldkirch', 1), (121, 'West Chester', 20),

--------------------------------------------------
-- Exemple de jointure :
SELECT * FROM villes v 
JOIN pays p FROM fk_pays_id = pays_id
WHERE p.pays_id = 3 ;