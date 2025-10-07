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
    type ENUM ('sit down','stand up','inverted','suspended','wing','bobsled','flying') DEFAULT NULL,
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
INSERT INTO villes (ville_id, nom, fk_pays_id) VALUES(1, 'Bad Wörishofen', 1), (2, 'Bottrop', 1), (3, 'Brühl', 1), (4, 'Friesoythe-Thüle', 1), (5, 'Geiselwind', 1), (6, 'Hassloch', 1), (7, 'Leipzig', 1), (8, 'Lengenfeld', 1),(9, 'Loifling', 1), (10, 'Rust', 1), (11, 'Salzhemmendorf', 1), (12, 'Sierksdorf', 1), (13, 'Wustermark', 1), (14, 'St. Margarethen', 2), (15, 'Vienne', 2), (16, 'Adinkerke-De Panne', 3),(17, 'Lichtaart', 3), (18, 'Wavre', 3), (19, 'Ypres', 3), (20, 'Århus', 4), (21, 'Copenhague', 4), (22, 'Holme-Olstrup', 4), (23, 'Klampenborg', 4), (24, 'Nimtofte', 4),(25, 'Nykøbing', 4), (26, 'Benidorm', 5), (27, 'Madrid', 5), (28, 'Salou', 5), (29, 'San Martín de la Vega', 5), (30, 'Helsinki', 6), (31, 'Kauhava', 6), (32, 'Tampere', 6),(33, 'Bocasse', 7), (34, 'Dolancourt', 7), (35, 'Jeanménil', 7), (36, 'Maizières-les-Metz', 7), (37, 'Marne la Vallée', 7), (38, 'Merlimont', 7), (39, 'Plailly', 7), (40, 'Plumelin', 7),(41, 'Saint-Paul', 7), (42, 'Saint-Pierre-du-Perray', 7), (43, 'Budapest', 8), (44, 'Ashbourne', 9), (45, 'Belpasso', 10), (46, 'Castagneto Carducci', 10), (47, 'Castelnuovo del Garda', 10), (48, 'Fasano', 10),(49, 'Jesolo', 10), (50, 'Rimini', 10), (51, 'Savio', 10), (52, 'Treviso', 10), (53, 'Valmontone', 10), (54, 'Vinterbro', 11), (55, 'Narberth', 12), (56, 'Biddinghuizen', 13),(57, 'Hellendoorn', 13), (58, 'Kaatsheuvel', 13), (59, 'La Haye', 13), (60, 'Sevenum', 13), (61, 'Rzgów', 14), (62, 'Zator', 14), (63, 'Alton', 15), (64, 'Blackpool', 15),(73, 'Skegness', 15), (74, 'Southend On Sea', 15), (75, 'Gothenburg', 16), (76, 'Stockholm', 16), (77, 'Antalya', 17), (78, 'Tuzla', 17), (79, 'Quarteira', 18), (80, 'Reisbach', 1),(65, 'Brean', 15), (66, 'Chertsey', 15), (67, 'Chessington', 15), (68, 'Drayton Bassett', 15), (69, 'Great Yarmouth', 15), (70, 'Ingoldmells', 15), (71, 'Lowestoft', 15), (72, 'Romsey', 15),(89, 'Jeanménil', 7), (90, 'Geiselwind', 1), (91, 'Lengenfeld', 1), (92, 'Gävle', 16), (94, 'Soltau', 1), (95, 'Lillehammer', 11), (96, 'Séville', 5), (97, 'Jaderberg', 1),(81, 'Rome', 10), (82, 'Lipperswil', 19), (83, 'Wassenaar', 13), (84, 'Cleebronn', 1), (85, 'Vias', 7), (86, 'Blokhus', 4), (87, 'Salou', 5), (88, 'Malton', 15),(106, 'Lazise', 10), (107, 'Marseillan', 7), (108, 'Monteux', 7), (109, 'Kaisersbach', 1), (110, 'Slagharen', 13), (111, 'Benidorm', 5), (112, 'Barcelone', 5), (113, 'Istanbul', 17),(98, 'Wustermark', 1), (99, 'Kolmården', 16), (100, 'Milizac', 7), (101, 'Dompierre-sur-Besbre', 7), (102, 'Chorzów', 14), (103, 'Agde', 7), (104, 'Torzym', 14), (105, 'Kayseri', 17),(122, 'Atlanta', 20), (123, 'Baltimore', 20), (124, 'Cincinnati ', 20), (125, 'Clearfield', 20), (126, 'Hayden', 20), (127, 'La Selva Beach', 20), (128, 'Logan', 20), (129, 'Sunbury', 20),(130, 'Altavilla Vicentina', 10), (131, 'Suzzara', 10), (132, 'Trevise', 10), (133, 'Schaan', 22),(134, 'Vlodrop', 13), (135, 'Weert', 13), (136, 'Altendorf', 19), (137, 'Monthey', 19),(138, 'Sankt Jakob in Haus', 2),(114, 'Les Avenières', 7), (115, 'Sankt Jakob in Haus', 2), (116, 'Deggendorf', 1), (117, 'München', 1), (118, 'Münsterhausen', 1), (119, 'Rasdorf', 1), (120, 'Waldkirch', 1), (121, 'West Chester', 20);

--------------------------------------------------
-- Insertion d'elements parcs :

INSERT INTO parcs (parc_id, nom, fk_ville_id, date_ouverture, superficie) VALUES
    (1, 'Skyline Park', 1, 1999, 20), (2, 'Movie Park Germany', 2, 1967, 45), (3, 'Phantasialand', 3, 1967, 28), (4, 'Tier- und Freizeitpark Thüle', 4, 1965, 25),
    (5, 'Freizeit-Land Geiselwind', 5, 1969, 45), (6, 'Holiday Park', 6, 1971, 45), (7, 'Belantis', 7, 2003, 27), (8, 'Freizeitpark Plohn', 8, 1996, 30),
    (9, 'Churpfalzpark', 9, 1971, 30), (10, 'Europa Park', 10, 1975, 95), (11, 'Rasti-Land', 11, 1973, 15), (12, 'Hansa-Park', 12, 1973, 46),
    (13, 'Karls Erlebnis-Dorf Elstal', 13, 2014, 25), (14, 'Familypark', 14, 1968, 14), (15, 'Wiener Prater', 15, 1766, 60), (16, 'Plopsaland De Panne', 16, 1935, 10),
    (17, 'Bobbejaanland', 17, 1961, 55), (18, 'Walibi Belgium', 18, 1975, 64), (19, 'Bellewaerde Park', 19, 1954, 50), (20, 'Tivoli Friheden', 20, 1958, 15),
    (21, 'Tivoli Gardens', 21, 1843, 8), (22, 'BonBon-Land', 22, 1992, 25), (23, 'Bakken', 23, 1583, 30), (24, 'Djurs Sommerland', 24, 1981, 50),
    (25, 'Sommerland Sjælland', 25, 1985, 30), (26, 'Terra Mítica', 26, 2000, 100), (27, 'Parque de Atracciones de Madrid', 27, 1969, 45), (28, 'PortAventura Park', 28, 1995, 119), (29, 'Parque Warner Madrid', 29, 2002, 55),
    (30, 'Linnanmäki', 30, 1950, 10), (31, 'PowerPark', 31, 2002, 50), (32, 'Särkänniemi Amusement Park', 32, 1966, 20), (33, 'Parc du Bocasse', 33, 1967, 20),
    (34, 'Nigloland', 34, 1987, 40), (35, 'Fraispertuis City', 35, 1966, 50), (36, 'Walygator Grand Est', 36, 1989, 70), (37, 'Disneyland Paris - Disneyland Park', 37, 1992, 194),
    (38, 'Bagatelle', 38, 1955, 6), (39, 'Parc Astérix', 39, 1989, 50), (40, 'Kingoland', 40, 2014, 18), (41, 'Parc Saint Paul', 41, 1983, 30),
    (42, 'Winnoland', 42, 2008, 8), (43, 'Waterland', 43, 2001, 35), (44, 'Emerald Park', 44, 2010, 11), (45, 'Etnaland', 45, 2001, 90),
    (46, 'Cavallino Matto', 46, 1967, 12), (47, 'Cavallino Matto', 46, 1967, 12), (48, 'Gardaland', 47, 1975, 45), (49, 'Zoosafari Fasanolandia', 48, 1973, 50),
    (50, 'New Jesolandia', 49, 2004, 12), (51, 'Fiabilandia', 50, 1976, 10), (52, 'Mirabilandia', 51, 1992, 85), (53, 'Osteria Ai Pioppi', 52, 1969, 8),
    (54, 'MagicLand', 53, 2011, 25), (55, 'TusenFryd', 54, 1988, 50), (56, 'Oakwood Theme Park', 55, 1987, 25), (57, 'Walibi Holland', 56, 1971, 68),
    (58, 'Avonturenpark Hellendoorn', 57, 1936, 25), (59, 'Efteling', 58, 1952, 72), (60, 'Drievliet Family Park', 59, 1938, 15), (61, 'Toverland', 60, 2001, 90),
    (62, 'Mandoria', 61, 2021, 20), (63, 'Energylandia', 62, 2014, 90), (64, 'Alton Towers', 63, 1980, 200), (65, 'Pleasure Beach Resort', 64, 1896, 12),
    (66, 'Brean Theme Park', 65, 1970, 10), (67, 'Thorpe Park', 66, 1979, 100), (68, 'Chessington World of Adventures', 67, 1931, 55), (69, 'Drayton Manor', 68, 1949, 30),
    (70, 'Great Yarmouth Pleasure Beach', 69, 1910, 6), (71, 'Fantasy Island', 70, 1995, 5), (72, 'Pleasurewood Hills', 71, 1983, 10), (73, 'Paultons Park', 72, 1983, 65),
    (74, "Botton's Pleasure Beach", 73, 1927, 4), (75, 'Adventure Island', 74, 1918, 7), (76, 'Liseberg', 75, 1923, 30), (77, 'Gröna Lund', 76, 1883, 8),
    (78, 'Land of Legends Theme Park', 77, 2016, 63), (79, 'Korsan Adasi', 78, 2015, 20), (80, 'Aquashow Family Park', 79, 1999, 11), (81, 'Bayern-Park', 80, 1985, 40),
    (82, 'Cinecittà World', 81, 2014, 24), (83, 'Conny-Land', 82, 1983, 18), (84, 'Duinrell', 83, 1935, 40), (85, 'Erlebnispark Tripsdrill', 84, 1929, 77),
    (86, 'Fabrikus World', 85, 1985, 6), (87, 'Fårup Sommerland', 86, 1975, 90), (88, 'Ferrari Land', 87, 2017, 7), (89, 'Flamingo Land', 88, 1959, 150),
    (90, 'Fraispertuis City', 89, 1966, 6), (91, 'Freizeit-Land Geiselwind', 90, 1969, 50), (92, 'Freizeitpark Plohn', 91, 1996, 25), (93, 'Furuvik', 92, 1900, 32),
    (95, 'Heide Park Resort', 94, 1978, 85), (96, 'Hunderfossen Eventyrpark', 95, 1984, 15), (97, 'Isla Mágica', 96, 1997, 21), (98, 'Jaderpark', 97, 1996, 20),
    (99, 'Karls Erlebnis-Dorf Elstal', 98, 2014, 15), (100, 'Kolmården', 99, 1965, 150), (101, 'La Récré des 3 Curés', 100, 1989, 15), (102, 'Le Pal', 101, 1973, 50),
    (103, 'Legendia Slaskie Wesole Miasteczko', 102, 1959, 26), (104, 'Lunapark', 103, 2005, NULL), (105, 'Majaland Kownaty', 104, 2018, 10), (106, 'Mazaka Land', 105, 2021, NULL),
    (107, 'Movieland Park', 106, 2002, 20), (108, "Parc d'Attractions Marseillan-Plage", 107, 1979, 3), (109, 'Parc Spirou Provence', 108, 2018, 8), (110, 'Schwaben Park', 109, 1972, 40),
    (111, 'Slagharen Themepark & Resort', 110, 1963, 50), (112, 'Terra Mítica', 111, 2000, 100), (113, 'Tibidabo', 112, 1901, 7), (114, 'Vialand', 113, 2013, 60), (115, 'Walibi Rhône-Alpes', 114, 1979, 35),
    (116, 'Freizeitpark Familienland', 138, 2000, NULL);



--------------------------------------------------
-- Exemple de jointure :
SELECT * FROM villes v 
JOIN pays p FROM fk_pays_id = pays_id
WHERE p.pays_id = 3 ;