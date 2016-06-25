CREATE TABLE personne (id int(10) NOT NULL AUTO_INCREMENT, prenom varchar(255) NOT NULL, nom varchar(255) NOT NULL, dateDeNaissance date NOT NULL, taille int(10) NOT NULL, adresse text NOT NULL, cp mediumint(9) NOT NULL, ville varchar(255) NOT NULL, login varchar(255) NOT NULL, `mdp text` int(11) NOT NULL, situationFamilialeid int(10) NOT NULL, niveauEtudeid int(10) NOT NULL, origineid int(10) NOT NULL, universiteid int(10) NOT NULL, loisirid int(10) NOT NULL, metierid int(10) NOT NULL, sexeid int(10) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE facette (id varchar(2) NOT NULL, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE personne_facette (score int(10) NOT NULL, facetteid varchar(2) NOT NULL, personneid int(10) NOT NULL, PRIMARY KEY (facetteid, personneid));
CREATE TABLE personalite (id varchar(1) NOT NULL, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE personne_personalite (score int(10), personaliteid varchar(1) NOT NULL, personneid int(10) NOT NULL, PRIMARY KEY (personaliteid, personneid));
CREATE TABLE situationFamiliale (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(25) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE niveauEtude (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE origine (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE interet (id int(10) NOT NULL AUTO_INCREMENT, age int(10), taille int(10), niveauEtudeid int(10), sexeid int(10) NOT NULL, facetteid varchar(2) NOT NULL, facetteid2 varchar(2) NOT NULL, facetteid3 varchar(2) NOT NULL, personneid int(10) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE question (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, typeBaremeid int(10) NOT NULL, Facetteid varchar(2) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE typeBareme (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE universite (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE loisir (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE metier (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE sexe (id int(10) NOT NULL AUTO_INCREMENT, code varchar(1) NOT NULL, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE ttmatch (id int(10) NOT NULL AUTO_INCREMENT, date_debut date NOT NULL, personneid int(10) NOT NULL, personneid2 int(10) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE msg (id int(10) NOT NULL AUTO_INCREMENT, txt longtext NOT NULL, date_post date NOT NULL, ttmatchid int(10) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE origine_interet (origineid int(10) NOT NULL, interetid int(10) NOT NULL, PRIMARY KEY (origineid, interetid));
ALTER TABLE personne_facette ADD INDEX FKpersonne_f620685 (personneid), ADD CONSTRAINT FKpersonne_f620685 FOREIGN KEY (personneid) REFERENCES personne (id);
ALTER TABLE personne_facette ADD INDEX FKpersonne_f587277 (facetteid), ADD CONSTRAINT FKpersonne_f587277 FOREIGN KEY (facetteid) REFERENCES facette (id);
ALTER TABLE personne_personalite ADD INDEX FKpersonne_p244485 (personneid), ADD CONSTRAINT FKpersonne_p244485 FOREIGN KEY (personneid) REFERENCES personne (id);
ALTER TABLE personne_personalite ADD INDEX FKpersonne_p359973 (personaliteid), ADD CONSTRAINT FKpersonne_p359973 FOREIGN KEY (personaliteid) REFERENCES personalite (id);
ALTER TABLE personne ADD INDEX FKpersonne474493 (situationFamilialeid), ADD CONSTRAINT FKpersonne474493 FOREIGN KEY (situationFamilialeid) REFERENCES situationFamiliale (id);
ALTER TABLE personne ADD INDEX FKpersonne50289 (niveauEtudeid), ADD CONSTRAINT FKpersonne50289 FOREIGN KEY (niveauEtudeid) REFERENCES niveauEtude (id);
ALTER TABLE personne ADD INDEX FKpersonne585214 (origineid), ADD CONSTRAINT FKpersonne585214 FOREIGN KEY (origineid) REFERENCES origine (id);
ALTER TABLE interet ADD INDEX FKinteret296933 (personneid), ADD CONSTRAINT FKinteret296933 FOREIGN KEY (personneid) REFERENCES personne (id);
ALTER TABLE interet ADD INDEX FKinteret330341 (facetteid), ADD CONSTRAINT FKinteret330341 FOREIGN KEY (facetteid) REFERENCES facette (id);
ALTER TABLE interet ADD INDEX FKinteret847191 (facetteid2), ADD CONSTRAINT FKinteret847191 FOREIGN KEY (facetteid2) REFERENCES facette (id);
ALTER TABLE interet ADD INDEX FKinteret847190 (facetteid3), ADD CONSTRAINT FKinteret847190 FOREIGN KEY (facetteid3) REFERENCES facette (id);
ALTER TABLE question ADD INDEX FKquestion351915 (typeBaremeid), ADD CONSTRAINT FKquestion351915 FOREIGN KEY (typeBaremeid) REFERENCES typeBareme (id);
ALTER TABLE question ADD INDEX FKquestion296330 (Facetteid), ADD CONSTRAINT FKquestion296330 FOREIGN KEY (Facetteid) REFERENCES facette (id);
ALTER TABLE personne ADD INDEX FKpersonne894276 (universiteid), ADD CONSTRAINT FKpersonne894276 FOREIGN KEY (universiteid) REFERENCES universite (id);
ALTER TABLE personne ADD INDEX FKpersonne25865 (loisirid), ADD CONSTRAINT FKpersonne25865 FOREIGN KEY (loisirid) REFERENCES loisir (id);
ALTER TABLE personne ADD INDEX FKpersonne957630 (metierid), ADD CONSTRAINT FKpersonne957630 FOREIGN KEY (metierid) REFERENCES metier (id);
ALTER TABLE personne ADD INDEX FKpersonne969610 (sexeid), ADD CONSTRAINT FKpersonne969610 FOREIGN KEY (sexeid) REFERENCES sexe (id);
ALTER TABLE interet ADD INDEX FKinteret930014 (sexeid), ADD CONSTRAINT FKinteret930014 FOREIGN KEY (sexeid) REFERENCES sexe (id);
ALTER TABLE msg ADD INDEX FKmsg84838 (ttmatchid), ADD CONSTRAINT FKmsg84838 FOREIGN KEY (ttmatchid) REFERENCES ttmatch (id);
ALTER TABLE origine_interet ADD INDEX FKorigine_in226670 (origineid), ADD CONSTRAINT FKorigine_in226670 FOREIGN KEY (origineid) REFERENCES origine (id);
ALTER TABLE origine_interet ADD INDEX FKorigine_in767238 (interetid), ADD CONSTRAINT FKorigine_in767238 FOREIGN KEY (interetid) REFERENCES interet (id);
ALTER TABLE ttmatch ADD INDEX FKttmatch503246 (personneid), ADD CONSTRAINT FKttmatch503246 FOREIGN KEY (personneid) REFERENCES personne (id);
ALTER TABLE ttmatch ADD INDEX FKttmatch108145 (personneid2), ADD CONSTRAINT FKttmatch108145 FOREIGN KEY (personneid2) REFERENCES personne (id);
ALTER TABLE interet ADD INDEX FKinteret849336 (niveauEtudeid), ADD CONSTRAINT FKinteret849336 FOREIGN KEY (niveauEtudeid) REFERENCES niveauEtude (id);