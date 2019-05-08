CREATE TABLE fontaines_staging (
  id integer PRIMARY KEY,
  arrondissement text,
  nom_parc_lieu text,
  proximite_jeu_repere text,
  intersection text,
  etat text,
  remarques text,
  precision_localisation text,
  x numeric,
  y numeric,
  latitude numeric,
  longitude numeric
);

COPY fontaines_staging
FROM '/home/whereveryouputthis/fontaine_eau_clean.csv'
DELIMITERS ',' NULL AS 'NA' CSV HEADER;

CREATE TABLE fontaines (
  id integer PRIMARY KEY,
  arrondissement text,
  nom_parc_lieu text,
  proximite_jeu_repere text,
  intersection text,
  etat text,
  remarques text,
  precision_localisation text,
  position geometry
);

INSERT INTO fontaines (id, arrondissement, nom_parc_lieu, proximite_jeu_repere, intersection, etat, remarques, precision_localisation, position)
SELECT
	id,
	arrondissement,
	nom_parc_lieu,
  proximite_jeu_repere,
  intersection,
  etat,
  remarques,
  precision_localisation,
	ST_SetSRID(ST_MakePoint(longitude,latitude),4326) as position
FROM fontaines_staging
WHERE latitude IS NOT NULL and longitude IS NOT NULL;
