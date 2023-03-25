DROP TABLE "Rytir_jedi" CASCADE CONSTRAINTS;
DROP TABLE "Vesmirna_lod" CASCADE CONSTRAINTS;
DROP TABLE "Planeta" CASCADE CONSTRAINTS;
DROP TABLE "Hvezda" CASCADE CONSTRAINTS;
DROP TABLE "Planetarni_system" CASCADE CONSTRAINTS;
DROP TABLE "Chemicky_prvek" CASCADE CONSTRAINTS;
DROP TABLE "flotila" CASCADE CONSTRAINTS;
DROP TABLE "obiha" CASCADE CONSTRAINTS;
DROP TABLE "slozena_z" CASCADE CONSTRAINTS;
DROP TABLE "atmosfera_slozena_z" CASCADE CONSTRAINTS;
-------------CREATE TABLES-----------

CREATE TABLE "Rytir_jedi" (
    "id" INT GENERATED AS IDENTITY NOT NULL PRIMARY KEY,
    "jmeno" VARCHAR(70) NOT NULL,
    "datum_narozeni" DATE DEFAULT NULL,
    "rasa" VARCHAR(30) DEFAULT NULL,
    "kontakt" INT DEFAULT NULL,
    "hodnost" VARCHAR(30) DEFAULT NULL,
    "barva_mece" VARCHAR(15) DEFAULT NULL
);


CREATE TABLE "Vesmirna_lod" (
    "id" int GENERATED AS IDENTITY NOT NULL PRIMARY KEY,
    "technicky_stav" VARCHAR(40) DEFAULT NULL,
    "rozpeti_kridel" FLOAT DEFAULT NULL,
    "naklad" VARCHAR(100) DEFAULT NULL,
    "nosnost_tun" INT DEFAULT NULL,
    "pocet_del_laser" INT DEFAULT NULL
);


CREATE TABLE "Planeta" (
    "id" INT GENERATED AS IDENTITY NOT NULL PRIMARY KEY,
    "nazev" VARCHAR(40) DEFAULT NULL,
    "pocet_obyvatel" INT DEFAULT NULL,
    "hmotnost" DECIMAL(30,2) DEFAULT NULL,
    "typ" VARCHAR(40) DEFAULT NULL
);


CREATE TABLE "Hvezda" (
    "id" int GENERATED AS IDENTITY NOT NULL PRIMARY KEY,
    "typ" VARCHAR(20) NOT NULL
);


CREATE TABLE "Planetarni_system" (
    "id" int GENERATED AS IDENTITY NOT NULL PRIMARY KEY,
    "nazev" VARCHAR(40) NOT NULL,
    "poloha" VARCHAR(100) NOT NULL
);


CREATE TABLE "Chemicky_prvek" (
    "id" int GENERATED AS IDENTITY NOT NULL PRIMARY KEY,
    "nazev" VARCHAR(40) NOT NULL
);
----------------------------------------------------------------


CREATE TABLE "flotila" (
    "id" INT GENERATED AS IDENTITY NOT NULL PRIMARY KEY,
    "jedi_id" INT NOT NULL,
    "lod_id" INT NOT NULL,
    CONSTRAINT "jedi_id_fk"
            FOREIGN KEY ("jedi_id")
            REFERENCES "Rytir_jedi" ("id"),
    CONSTRAINT "lod_id_fk"
            FOREIGN KEY ("lod_id")
            REFERENCES "Vesmirna_lod" ("id")
);


CREATE TABLE "obiha" (
    "hvezda_id" INT NOT NULL,
    "planeta_id" INT NOT NULL,
    CONSTRAINT "hvezda_planeta_id_pk"
            PRIMARY KEY ("hvezda_id", "planeta_id"),
    CONSTRAINT "hvezda_id_fk"
            FOREIGN KEY ("hvezda_id")
            REFERENCES "Hvezda" ("id"),
    CONSTRAINT "planeta_id_fk"
            FOREIGN KEY ("planeta_id")
            REFERENCES "Planeta" ("id")
);


CREATE TABLE "slozena_z" (
    "procentualni_zastoupeni" FLOAT NOT NULL,
    "hvezda_id" INT NOT NULL,
    "chemicky_prvek_id" INT NOT NULL,
    CONSTRAINT "hvezda_prvek_id_pk"
            PRIMARY KEY ("hvezda_id", "chemicky_prvek_id"),
    CONSTRAINT "hvezda_id_fk_sl"
            FOREIGN KEY ("hvezda_id")
            REFERENCES "Hvezda" ("id"),
    CONSTRAINT "chemicky_prvek_id_fk"
            FOREIGN KEY ("chemicky_prvek_id")
            REFERENCES "Chemicky_prvek" ("id")
);


CREATE TABLE "atmosfera_slozena_z" (
    "procentualni_zastoupeni" FLOAT NOT NULL,
    "chemicky_prvek_id" INT NOT NULL,
    "planeta_id" INT NOT NULL,
    CONSTRAINT "prvek_planeta_id_pk"
            PRIMARY KEY ("planeta_id", "chemicky_prvek_id"),
    CONSTRAINT "planeta_id_fk_at"
            FOREIGN KEY ("planeta_id")
            REFERENCES "Planeta" ("id"),
    CONSTRAINT "chemicky_prvek_id_fk_at"
            FOREIGN KEY ("chemicky_prvek_id")
            REFERENCES "Chemicky_prvek" ("id")
);

-------------------------Insert---------------------------------

INSERT INTO "Rytir_jedi" ("jmeno", "datum_narozeni", "rasa", "kontakt", "hodnost", "barva_mece")
VALUES ('Qui-Gon Jinn', TO_DATE('1923-08-12', 'YYYY-MM-DD'), 'Human', 456789012, 'Jedi Master', 'green');

INSERT INTO "Rytir_jedi" ("jmeno", "datum_narozeni", "rasa", "kontakt", "hodnost", "barva_mece")
VALUES ('Obi-Wan Kenobi', TO_DATE('1923-08-12', 'YYYY-MM-DD'), 'Human', 987654321, 'Jedi Master', 'blue');

INSERT INTO "Rytir_jedi" ("jmeno", "datum_narozeni", "rasa", "kontakt", "hodnost", "barva_mece")
VALUES ('Ahsoka Tano', TO_DATE('1923-08-12', 'YYYY-MM-DD'), 'Togruta', 456789123, 'Padawan', 'green');

INSERT INTO "Rytir_jedi" ("jmeno", "datum_narozeni", "rasa", "kontakt", "hodnost", "barva_mece")
VALUES ('Kit Fisto', TO_DATE('1923-08-12', 'YYYY-MM-DD'), 'Nautolan', 789123456, 'Jedi Master', 'green');

INSERT INTO "Rytir_jedi" ("jmeno", "datum_narozeni", "rasa", "kontakt", "hodnost", "barva_mece")
VALUES ('Mace Windu', TO_DATE('1923-08-12', 'YYYY-MM-DD'), 'Human', 321654987, 'Jedi Master', 'purple');

INSERT INTO "Vesmirna_lod" ("technicky_stav", "rozpeti_kridel", "naklad", "nosnost_tun")
VALUES ('opravena', 50.5, 'zboží', 500);

INSERT INTO "Vesmirna_lod" ("technicky_stav", "rozpeti_kridel", "naklad", "nosnost_tun")
VALUES ('porouchaná', 30.2, 'palivo', 200);

INSERT INTO "Vesmirna_lod" ("technicky_stav", "rozpeti_kridel", "pocet_del_laser")
VALUES ('nová', 100.0, 8);

INSERT INTO "Planeta" ("nazev", "pocet_obyvatel", "hmotnost", "typ")
VALUES ('Tatooine', 200000, 1000, 'pouštní');

INSERT INTO "Planeta" ("nazev", "pocet_obyvatel", "hmotnost", "typ")
VALUES ('Coruscant', 1000000000000, 3005, 'městská');

INSERT INTO "Planeta" ("nazev", "pocet_obyvatel", "hmotnost", "typ")
VALUES ('Naboo', 4500000000, 30000, 'jednoduchá');

INSERT INTO "Hvezda" ("typ")
VALUES ('červený trpaslík');

INSERT INTO "Hvezda" ("typ")
VALUES ('modrý veleobr');

INSERT INTO "Hvezda" ("typ")
VALUES ('žlutý trpaslík');

INSERT INTO "Planetarni_system" ("nazev", "poloha")
VALUES ('Sluneční soustava', 'Vnější okraj Galaxie');

INSERT INTO "Planetarni_system" ("nazev", "poloha")
VALUES ('Alpha Centauri', 'Jižní souhvězdí Kentaura');

INSERT INTO "Planetarni_system" ("nazev", "poloha")
VALUES ('Kepler-90', 'V souhvězdí Draka');

INSERT INTO "Chemicky_prvek" ("nazev")
VALUES ('vodík');

INSERT INTO "Chemicky_prvek" ("nazev")
VALUES ('helium');

INSERT INTO "Chemicky_prvek" ("nazev")
VALUES ('uhlík');

INSERT INTO "obiha" ("hvezda_id", "planeta_id")
VALUES (1, 1);

INSERT INTO "obiha" ("hvezda_id", "planeta_id")
VALUES (1, 2);

INSERT INTO "obiha" ("hvezda_id", "planeta_id")
VALUES (2, 3);

INSERT INTO "flotila" ("jedi_id", "lod_id")
VALUES (1, 1);

INSERT INTO "flotila" ("jedi_id", "lod_id")
VALUES (2, 2);

INSERT INTO "flotila" ("jedi_id", "lod_id")
VALUES (1, 2);

INSERT INTO "slozena_z" ("procentualni_zastoupeni","hvezda_id", "chemicky_prvek_id")
VALUES (10.5, 1, 1);

INSERT INTO "slozena_z" ("procentualni_zastoupeni", "hvezda_id", "chemicky_prvek_id")
VALUES (35.2, 2, 2);

INSERT INTO "slozena_z" ("procentualni_zastoupeni","hvezda_id","chemicky_prvek_id")
VALUES (20.0, 1, 2);

INSERT INTO "atmosfera_slozena_z" ("procentualni_zastoupeni", "chemicky_prvek_id", "planeta_id")
VALUES (100.0, 1, 2);

INSERT INTO "atmosfera_slozena_z" ("procentualni_zastoupeni", "chemicky_prvek_id", "planeta_id")
VALUES (10.0, 2, 1);

INSERT INTO "atmosfera_slozena_z" ("procentualni_zastoupeni", "chemicky_prvek_id", "planeta_id")
VALUES (20.0, 1, 1);
