
drop database if exists thinktwice;
create database thinktwice;

use thinktwice;

drop table if exists personne;
drop table if exists facette;
drop table if exists personne_facette;
drop table if exists personnalite;
drop table if exists personne_personnalite;
drop table if exists situationFamiliale;
drop table if exists niveauEtude;
drop table if exists origine;
drop table if exists interet;
drop table if exists question;
drop table if exists typeBareme;
drop table if exists universite;
drop table if exists loisir;
drop table if exists metier;
drop table if exists sexe;
drop table if exists ttmatch;
drop table if exists msg;
drop table if exists origine_interet;


CREATE TABLE personne (id int(10) NOT NULL AUTO_INCREMENT, prenom varchar(255) NOT NULL, nom varchar(255) NOT NULL, dateDeNaissance date NOT NULL, taille int(10) NOT NULL, adresse text NOT NULL, cp mediumint(9) NOT NULL, ville varchar(255) NOT NULL, login varchar(255) NOT NULL, mdp text NOT NULL, mail varchar(255) NOT NULL, situationFamilialeid int(10) NOT NULL, niveauEtudeid int(10) NOT NULL, origineid int(10) NOT NULL, universiteid int(10) NOT NULL, loisirid int(10) NOT NULL, metierid int(10) NOT NULL, sexeid int(10) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE facette (id varchar(2) NOT NULL, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE personne_facette (score int(10) NOT NULL, facetteid varchar(2) NOT NULL, personneid int(10) NOT NULL, PRIMARY KEY (facetteid, personneid));
CREATE TABLE personnalite (id varchar(1) NOT NULL, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE personne_personnalite (score int(10), personnaliteid varchar(1) NOT NULL, personneid int(10) NOT NULL, PRIMARY KEY (personnaliteid, personneid));
CREATE TABLE situationFamiliale (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(25) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE niveauEtude (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE origine (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE interet (id int(10) NOT NULL AUTO_INCREMENT, age int(10), taille int(10), niveauEtudeid int(10), sexeid int(10) NOT NULL, facetteid varchar(2) NOT NULL, facetteid2 varchar(2) NOT NULL, facetteid3 varchar(2) NOT NULL, personneid int(10) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
CREATE TABLE question (id int(10) NOT NULL AUTO_INCREMENT, libelle varchar(255) NOT NULL, typeBaremeid int(10) NOT NULL, facetteid varchar(2) NOT NULL, PRIMARY KEY (id), UNIQUE INDEX (id));
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
ALTER TABLE personne_personnalite ADD INDEX FKpersonne_p244485 (personneid), ADD CONSTRAINT FKpersonne_p244485 FOREIGN KEY (personneid) REFERENCES personne (id);
ALTER TABLE personne_personnalite ADD INDEX FKpersonne_p359973 (personnaliteid), ADD CONSTRAINT FKpersonne_p359973 FOREIGN KEY (personnaliteid) REFERENCES personnalite (id);
ALTER TABLE personne ADD INDEX FKpersonne474493 (situationFamilialeid), ADD CONSTRAINT FKpersonne474493 FOREIGN KEY (situationFamilialeid) REFERENCES situationFamiliale (id);
ALTER TABLE personne ADD INDEX FKpersonne50289 (niveauEtudeid), ADD CONSTRAINT FKpersonne50289 FOREIGN KEY (niveauEtudeid) REFERENCES niveauEtude (id);
ALTER TABLE personne ADD INDEX FKpersonne585214 (origineid), ADD CONSTRAINT FKpersonne585214 FOREIGN KEY (origineid) REFERENCES origine (id);
ALTER TABLE interet ADD INDEX FKinteret296933 (personneid), ADD CONSTRAINT FKinteret296933 FOREIGN KEY (personneid) REFERENCES personne (id);
ALTER TABLE interet ADD INDEX FKinteret330341 (facetteid), ADD CONSTRAINT FKinteret330341 FOREIGN KEY (facetteid) REFERENCES facette (id);
ALTER TABLE interet ADD INDEX FKinteret847191 (facetteid2), ADD CONSTRAINT FKinteret847191 FOREIGN KEY (facetteid2) REFERENCES facette (id);
ALTER TABLE interet ADD INDEX FKinteret847190 (facetteid3), ADD CONSTRAINT FKinteret847190 FOREIGN KEY (facetteid3) REFERENCES facette (id);
ALTER TABLE question ADD INDEX FKquestion351915 (typeBaremeid), ADD CONSTRAINT FKquestion351915 FOREIGN KEY (typeBaremeid) REFERENCES typeBareme (id);
ALTER TABLE question ADD INDEX FKquestion296330 (facetteid), ADD CONSTRAINT FKquestion296330 FOREIGN KEY (facetteid) REFERENCES facette (id);
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



INSERT INTO loisir (libelle) 
    VALUES ('Sport');
	

INSERT INTO loisir (libelle) 
    VALUES ('Lecture');
	
	
INSERT INTO loisir (libelle) 
    VALUES ('Cinema');
	

INSERT INTO metier (libelle) 
    VALUES 
('Aéronautique Et Espace'),
('Agriculture - Agroalimentaire'),
('Agroalimentaire - Industries Alimentaires'),
('Artisanat'),
('Audiovisuel, Cinéma'),
('Audit, Comptabilité, Gestion'),
('Automobile'),
('Banque, Assurance'),
('Bâtiment, Travaux Publics'),
('Biologie, Chimie, Pharmacie'),
('Commerce, Distribution'),
('Communication'),
('Création, Métiers D art'),
('Culture, Patrimoine'),
('Défense, Sécurité'),
('Documentation, Bibliothèque'),
('Droit'),
('Edition, Livre'),
('Enseignement'),
('Environnement'),
('Ferroviaire'),
('Foires, Salons Et Congrès'),
('Fonction Publique'),
('Hôtellerie, Restauration'),
('Humanitaire'),
('Immobilier'),
('Industrie'),
('Informatique, Télécoms, Web'),
('Journalisme'),
('Lgues'),
('Marketing, Publicité'),
('MédicalMode-Textile'),
('Paramédical'),
('Propreté Et Services Associés'),
('Psychologie'),
('Ressources Humaines'),
('Sciences Humaines Et Sociales'),
('Secrétariat'),
('Social'),
('Spectacle - Métiers De La Scène'),
('Sport'),
('Tourisme'),
('Transport-Logistique');


INSERT INTO situationFamiliale (libelle) 
VALUES 
('Célibataire'),
('Marié(e)'),
('Divorcé(e)'),
('Veuf(ve)');

INSERT INTO universite (libelle) 
VALUES 
('Panthéon-Sorbonne'),
('Descartes'),
('Diderot');

INSERT INTO niveauEtude (libelle) 
VALUES 
('Aucun'),
('CAP/BEP'),
('BAC'),
('BAC+2, BTS, DUT'),
('BAC+3 ou 4 : licence, maîtrise ou équivalent'),
('BAC+4 ou 5 : master, doctorat, diplôme de grande école');

INSERT INTO origine (libelle) 
VALUES 
('Européenne'),
('Africaine'),
('Asiatique'),
('Arabe'),
('Indienne'),
('Hispanique'),
('Autre ');

INSERT INTO sexe (code,libelle) 
VALUES 
('O','Indifférent'),
('M','Homme'),
('F','Femme');

INSERT INTO facette (id,libelle) 
VALUES 
('N1','Anxiété'),
('E1','Chaleur'),
('O1','Ouverture aux reveries'),
('A1','Confiance'),
('C1','Compétence'),
('N2','Colère Hostilité'),
('E2','Gégarité'),
('O2','OUverture à l estetique'),
('A2','Droiture'),
('C2','Ordre'),
('N3','Dépression'),
('E3','Assertivité'),
('O3','Ouverture aux actions'),
('A3','Altruisme'),
('C3','Sens du devoir'),
('N4','Timidité social'),
('E4','Activité'),
('O4','Ouverture aux actions'),
('A4','Compliance'),
('C4','Recherche de réussite'),
('N5','Impulsivité'),
('E5','Recherche de sensations'),
('O5','Ouverture aux idées'),
('A5','Modestie'),
('C5','Autodiscipline'),
('N6','Vulnerabilité'),
('E6','Emotions positives'),
('O6','Ouverture aux valeurs'),
('A6','Sensibilité'),
('C6','Délibération');


INSERT INTO personnalite (id,libelle) 
VALUES 
('N','Névrosisme'),
('E','Extraversion'),
('O','Ouverture'),
('A','Agreabilité'),
('C','Conscience');

INSERT INTO typeBareme (libelle) 
VALUES 
('BaremeDecroissant'),
('BaremeCroissant');


INSERT INTO question (libelle,typeBaremeid,facetteid) 
VALUES 
('Je ne suis pas du genre à me faire du soucis',1,'N1'),
('J\'aime vraiment bien la plupart des gens que je rencontre',2,'E1'),
('J\'ai une imagination très active',2,'O1'),
('J\'ai tendance à être cynique et sceptique en ce qui concerne les intentions des autres',1,'A1'),
('Je suis reputée pour ma prudence et mon bon sens',2,'C1'),
('Je me mets souvent en colère à cause de la manière dont les gens me traitent',2,'N2'),
('J\'essaie d\'éviter les foules',1,'E2'),
('Les préoccupations esthétiques et artistiques ne sont pas très importantes pour moi',1,'O2'),
('Je ne suis ni rusé(e) ni sournois(e)',2,'A2'),
('Je préfère me garder des possibilités de choix plutôt que tout planifier, à l\'avance',1,'C2'),
('Il est rare que je me sente trop seul(e)et cafardeux(se)',1,'N3'),
('Je suis autoritaire, énergique et je n\'gésite pas à m\'affirmer',2,'E3'),
('Sans emotion fortes, la vie serait sans interet pour moi',2,'O3'),
('Certains trouvent que je suis egoiste et que je ne pense qu\'à moi',1,'A3'),
('J\'essaie d\'accomplir consciencieusement toutes les taches qui me sont confièes',2,'C3'),
('Quand j\'ai affaire à d\'autres personnes, je redoute toujours de faire une gaffe',2,'N4'),
('Dans le travail et dans les loisirs, je prens tout mon temps',1,'E4'),
('Je suis bien installé( e) dans mes habitudes',1,'O4'),
('Je preferais cooperer avec les autres plutôt que me mettre en compétition avec eux',2,'A4'),
('Je suis nonchalant( e) et pas très ambitieux (se)',1,'C4'),
('Je sfait rarement des exces en quoi que ce soit',1,'N5'),
('J\'ai souvent une forte envie de quelquec hose qui romprait la monotonie',2,'E5'),
('Je prends souvent plaisir à jouer avec des théories et des idees abstraites',2,'O5'),
('Cela ne me gene pas de me vanter de mes talents et de ce que j\'ai réalisé',1,'A5'),
('J\'arrive assez bien à m\'organiser pour faire les choses à temps',2,'C5'),
('Je me sens souvent desespere( e) et je voudrais que quelqu\'un d\'autre résolve mes problèmes',2,'N6'),
('Je n\'ai jamais sauté de joie au sens littéral du terme',1,'E6'),
('Je crois que laisser les etudiants écouter un orateur controverséss ne peut que les embrouiller et les égarer',1,'O6'),
('Les dirigeants politiques doivent être plus attentifs à l\'aspect humain de leur politique',2,'E6'),
('Au fil des années, j\'ai fait un certain nombre de choses plutot stupides ',1,'C6'),
('Il est facile de me faire peur',2,'N1'),
('Je n\'ai pas beaucoup de plaisir à bavarder avec les gens',1,'E1'),
('J\'essaie de maintenir toutes mes pensées dans une direction réaliste et d\'éviter les envolées de l\'imagination',1,'O1'),
('Je crois que la plupart des gens sont fondammentalement bien intentionnés',2,'A1'),
('Je ne prends pas les devoirs civiques, comme le vote, tres au serieux',1,'C1'),
('Je suis une personne d\'humeur égale',1,'N2'),
('J\'aime avoir beaucoup de gens autour de moi',2,'E2'),
('Il m\'arrive quelquefois de m\'absorber completement dans la musique que j\'écoute',2,'O2'),
('Si c\'est necessaire, je suis disposé ( e) à manipuler les gens pour obtenir ce que je veux',1,'A2'),
('Je maintiens mes affaires nettes et propres',2,'C2'),
('Quelquefois, je me sens completement  sans valeur',2,'N3'),
('Je ne m\'affirme pas toujours autant que je devrais',1,'E3'),
('J\'éprouve rarement des emotions fortes',1,'O3'),
('J\'essaie d\'etre poli( e) avec chaque personne que je rencontre',2,'A3'),
('il m\'arrive parfois de ne pas tenir mes engagements ou de ne pas assumer mes responsabilités comme je le devrais',1,'C3'),
('Je me sens rarement mal à l\'aise quand je suis avec des gens',1,'N4'),
('Quand je fais quelque chose, je le fais avec energie',2,'E4'),
('Je pense qu\'il est interessant d\'pprendre de nouvelles activités de loisir et de s\'y perfectionner',2,'O4'),
('Je peux etre sarcastique et cassant( e) si besoin est',1,'A4'),
('J\'ai un ensemble bien défini d\'objectifs et je travaille pour les atteindre de façon ordonnée',2,'C4'),
('J\'ai du mal à resister à mes désirs',2,'N5'),
('Je n\'aimerais pas passer mes vacances à Las Vegas',1,'E5'),
('Je trouve les discussions philosophiques ennuyeuses',1,'O5'),
('Je prefere ne pas parler de moi-meme ni de ce que j\'ai accompli',2,'A5'),
('Je perds beaucoup de temps avant de me mettre au travail',1,'C5'),
('Je me sens capable de faire face à la plupart de mes problemes',1,'N6'),
('J\'ai quelquefois éprouvé une joie intense et de l\'extase',2,'E6'),
('Je crois que les lois et les politiques sociales devraient changer pour refleter les beoins d\'un monde qui change',1,'O6'),
('J\'ai la tete dure et je suis pas sentimental( e) dans mes attitudes',2,'A6'),
('J\'examine les choses eb détail avant d\'arriver à ma décision',2,'C6'),
('Il est rare que je me sente craintif(ve) ou anxieux(se)',1,'N1'),
('J\'ai la reputation d\'être une personne chaleureuse et amicale',2,'E1'),
('J\'ai une vie imaginaire active',2,'O1'),
('Je crois que la plupart des gens vont profiter de vous si vous vous laissez faire',1,'A1'),
('Je me tiens au courant et je prends habituellement des decisions intelligentes ',2,'C1'),
('J\'ai la reputation d\'avoir la sang chaud et de me mettre facilement en colère',1,'N2'),
('Je prefere habituellement faire les choses seul( e)',2,'E2'),
('Assister à des spectacles de ballet et de danse moderne m\'ennuies',1,'O2'),
('Je ne pourrais tromper personne, meme si je voulais',2,'A2'),
('Je ne suis pas quelqu\'un de tres methodique',1,'C2'),
('Je suis raremen triste et deprimé ( e )',1,'N3'),
('J\'ai souvent dirigé les groupes auxquels j\'ai appartenu',2,'E3'),
('La manière dont je sens les choses est importante pour moi',2,'O3'),
('Ceratins me trouvent froid( e) et calculateur (trice)',1,'A3'),
('Je paie mes dettes rapidement et dans leur totalité',2,'C3'),
('Certaines fois, j\'ai eu tellement honte que j\'aurai voulu me cacher',2,'N4'),
('J\'ai tendance à travailler lentement mais surement',1,'E4'),
('Une fois que j\'ai trouvé la bonne manière de faire quelquechose, je m\'y tiens',1,'O4'),
('j\'hesite à exprimer ma colère, mame quand elle est justifiée',2,'A4'),
('"Quand je commence un programme d\'amélioration personnelles (par exemple : faire de la gymnastique, faire un regime, ou suivre une serie de cours, etc.), j\'abandonne habituelement au bout de quelques jours"',1,'C4N5'),
('J\'ai peu de difficulté à resister à la tentation',1,'E5'),
('Il m\'est arrivé de faire des choses rien que pour l\'excitation ou le frisson',2,'O5'),
('Je prends plaisir à résoudre des problèmes et des enigmes',2,'A5'),
('Je suis meilleur( e) que la plupart des gens et je le sais',1,'C5'),
('Je suis quelqu\'un d\'efficace qui vient toujours à bout du travail',2,'N6'),
('QUand je suis sous la pression de situations trop difficiles, j\'ai quelquefois l\'impression que je vais m\'effondrer',2,'E6'),
('Je ne suis pas un ( e) optimiste souriant ( e)',1,'O6'),
('Je crois que nous devrions nous tourner vers nos autorités remigieuses pour les decisions concernant les questions morales',1,'A6'),
('On n\'en fait jamais trop pour les pauvres et les personnes agées',2,'C6'),
('Il m\'arrive à l\'occasion d\'agir d\'abord et de reflechir ensuite',1,'N1'),
('Je me sens souvent tendu( e) et nerveux(se)',2,'E1'),
('Beaucoup de gens me trouvent assez froid( e) et distant( e)',1,'O1'),
('Je n\'aime pas perdre mon temps à revasser',1,'A1'),
('Je pense que la plupart des gens auxquels j\'ai affaire sont honnêtes et dignes de confiance',2,'C1'),
('Je me mets souvent dans des situations sans y etre completement prepare( e)',1,'N2'),
('On ne me considère pas comme une personne susceptible et ombrageuse',1,'E2'),
('J\'ai vraiment besoin des autres si je reste longtemps seul( e)',2,'O2'),
('Je suis integré( e) par les formes et les morifs que je trouve dans l\'art et dans la nature',2,'A2'),
('Etre parfaitement honnete est une mauvaise façon de faire des affaires',1,'C2'),
('J\'aime bien garder chaque chose à sa place, comm cela je sais exatement où elle est',2,'N3'),
('J\'ai quelquefois éprouvé un sentiment profond de culpabilité ou de péché',2,'E3'),
('Dans les réunions, je laisse d\'habitude les autres parler',1,'O3'),
('Il est rare que j\'accorde beaucoup d\'attention à mes sentimenst du moment',1,'A3'),
('J\'essaie en general d\'etre attentionné( e) et prevenant( e)',2,'C3'),
('Il m\'arrive de tricher quand je joue seul ( e) (par exemple : quand je joue au solitaire, quand je fais des reussites, etc.)',1,'N4'),
('ça ne me gene pas trop si les gens se moquent de moi ou me taquinent',1,'E4'),
('J\'ai souvent le sentiment de déborder d\'énergie',2,'O4'),
('J\'essaie souvent des plats nouveaux et exotiques',2,'A4'),
('Si je n\'aime pas les gens, je leur fais savoir',1,'C4'),
('Je travaille dur pour atteidre mes objectifs',2,'N5'),
('Quand je suis devant mes plats favoris, j\'ai tendance à trop manger',2,'E5'),
('J\'ai tendance à éviter les films choquant ou effrayants',1,'O5'),
('Je perds quelquefois tout interet quand les gens parlent de sujets tres abstraits et theoriques',1,'A5'),
('J\'essaie d\'etre modeste',2,'C5'),
('J\'ai du mal à me forcer à faire ce que je devrais',1,'N6'),
('Je garde la tête froide dans les situations d\'urgence',1,'E6'),
('Quelquefois, je déborde de bonheur',2,'O6'),
('Je crois que les idées différentes du bon (bien, beau, vrai) et du mauvais (mal, laid,faux) que les gens ont dans d\'autres societes peuvent être valables pour eux',2,'A6'),
('Je n\'ai aucune sympathie pour les mendiants',1,'C6'),
('Avant d\'agir, je reflechis toujours aux consequences de mon action',2,'N1'),
('Je ressens rarement de l\'appréhension au sujet de l\'avenir',1,'E1'),
('Je prends réelement plaisir à parler aux gens',2,'O1'),
('Je prends plaisir à me concentrer sur une image interieure ou une reverie et à explorer toutes ses possibilités en les laissant croitre et se developper',2,'A1'),
('Je suis mefiant( e) quand quelqu\'un fait quelque chose de gentil pour moi',1,'C1'),
('Je suis fier( e) de la surete de mon jugement',2,'N2'),
('J\'en arrive souvent à etre degouté( e) par les gens auxquels je dois avoir affaire',2,'E2'),
('Je prefere un  travail qui me permet de travailler suel( e) sans etre embete( e) par les autres',1,'O2'),
('La poesie a peu ou pas d\'effet sur moi',1,'A2'),
('Je detesterais qu\'on me prenne pour un( e) hypocrite',2,'C2'),
('Il me semble que je neserai jamais capable de m\'organiser',1,'N3'),
('J\'ai tendance à me faire des reproches quand quelque chose va de travers',2,'E3'),
('Les autres se tournent souvent vers moi pour prendre des decisions',2,'O3'),
('J\'éprouve une grande variété d\'émotions ou de sentiments',2,'A3'),
('Je n\'ai pas la reputation d\'tre genereux (se)',1,'C3'),
('Quand je prends un engagement, on peut toujours compl$ter sur moi pour aller jusqu\'au bout',2,'N4'),
('Je me sens souvent inférieur( e)aux autres',2,'E4'),
('Je ne suis pas aussi rapide et dynamique que les autres',1,'O4'),
('Je prefere passer mon temps avec mon entourage familier',1,'A4'),
('Quand on m\'a insulté( e), j\'essaie simplement de pardonner et d\'oublier',2,'C4'),
('Je ne ressens pas un besoin intense de promotion',1,'N5'),
('Je m\'abandonne rarement a mes impulsions',1,'E5'),
('J\'aime bien etre là où il y a de l\'action',2,'O5'),
('Je prends plaisir à travailler sur des enigmes du genre "casse-tete" ou "sport cerebral"',2,'A5'),
('J\'ai une très haute opinion de moi-meme',1,'C5'),
('Une fois que je demarre un projet, je termine presque toujours',2,'N6'),
('Il est souvent difficile pour moi de prendre une decision',2,'E6'),
('Je ne me trouve pas particulièrement insouciant( e) et gai( e)',1,'O6'),
('Je crois que la fidelité à ses propres ideaux et principes est plus importants que l\'"ouverture d\'esprit"',1,'A6'),
('Les besoins humains devraient toujours avoir la priorité sur les considerations economiques',2,'C6'),
('Je fais souvent des choses sur l\'impulsion du moment',1,'N1'),
('Je me fais souvent du souci à propos de choses qui pourraient mal tourner',2,'E1'),
('Je trouve facile de sourire et d\'être agréable avec des inconnus',2,'O1'),
('Si je sens que mon esprit commence à dériver vers des reveries, j\'ai l\'habitude de m\'occuper et de me mettre à me concentrer sur un travail ou une activité',1,'A1'),
('Ma première réaction est de faire confiance aux gens',2,'C1'),
('Je n\'ai pas l\'impression de réussir complètement en quoi que ce soit',1,'N2'),
('Il en faut beaucoup pour me rendre furieux (se)',1,'E2'),
('Je prefererais des vacances sur une plage à la mode plutôt que dans une cabane isolée dans les bois',2,'O2'),
('Certaines genres de musique exercent sur moi une fascination sans fin',2,'A2'),
('Parfois j\'utilise  la ruse pour amener les gens à faire ce que je veux',1,'C2'),
('J\'ai tendance à être quelque peu méticuleux (se) et exigeant( e)',2,'N3'),
('J\'ai une mauvaise opinion de moi-meme',2,'E3'),
('Je prefere suivre mon propre chemin plutôt que diriger les autres',1,'O3'),
('Je remarque rarement les changements d\'humeur ou les sentiments que provoquent des environnements différents',1,'A3'),
('La plupart des gens que je connais m\'aiment bien',2,'C3'),
('J\'ai des principes moraux et j\'y adhere strictement',2,'N4'),
('Je me sens à l\'aise en présence de mes patrons ou d\'autres autorités',1,'E4'),
('J\'ai habituellement l\'impression d\'etre pressé( e)',2,'O4'),
('Je fais parfois des changements dans la maison, juste pour essayer quelque chose de different',2,'A4'),
('Si quelqu\'un provoque une bagarre, je suis prêt( e) à riposter',1,'C4'),
('Je m\'efforce de reussir tout ce que je peux',2,'N5'),
('Je mange quelquefois à m\'en rendre malade',2,'E5'),
('J\'adore le frisson qu\'on ressent sur les montagnes russes',2,'O5'),
('J\'ai peu d\'interet pour la reflexion sur la nature de l\'univers ou sur la condition humaine',1,'A5'),
('Je n\'ai pas l\'impression d\'etre meilleur ( e) que les autres, quelle que soir leur situation',2,'C5'),
('Quand un projet devient trop difficile, j\'ai tendance à en démarrer un autre',1,'N6'),
('Je me debrouille assez bien dans une situation de crise',1,'E6'),
('Je suis une personne joyeuse et pleine de bonne humeur',2,'O6'),
('Je me trouve large d\'esprit et tolérant( e) pour les façons de vivre des autres',2,'A6'),
('Je crois que tous les etres humains sont dignes de respect',2,'C6'),
('Il est rare que je prenne des decisions hatives',2,'N1'),
('J\'ai moins de peurs que la plupart des gens',1,'N1'),
('J\'ai des liens affectifs forts avec mes amis',2,'E1'),
('Quand j\'étais enfant, il était rare que je prenne plaisir à "jouer à faire semblant"',1,'O1'),
('J\'ai tendance à supposer le meilleur chez les gens',2,'A1'),
('Je suis quelqu\'un de très compétent',2,'C1'),
('Il m\'est parfois arrivé d\'etre amer (ere) et plein( e) de ressentiment',2,'N2'),
('Habituellement, les reunions qui rassemblent un grand nombre de personnes m\'ennuieent',1,'E2'),
('Quelquefois, quand je lis de la poesie ou quand je regarde une œuvre d\'art, je ressens un frisson ou j\'ai la chair de poule',2,'O2'),
('Il m\'arrive de faire faire aux gens ce que je veux en les menaçant ou en les flattant',1,'A2'),
('Je ne suis pas un( e) maniaque du nettoyage',1,'C2'),
('Quelquefois, les choses me semblent pluôt mornes et sans espoir',2,'N3'),
('Dans les conversations, j\'ai tendance à parler plus que les autres',2,'E3'),
('Je trouve facile d\'avoir de l\'empathie, c\'est-à-dire de ressentir moi-meme ce que les autres ressentent',2,'O3'),
('Je me considere comme une personne charitable',2,'A3'),
('Ce que je fais, j\'essaie de la faire soigneusement, comme ça il n\'y a pas à le refaire',2,'C3'),
('Si j\'ai dit ou fait quelque chose de mal à quelqu\'un, je peux à peine supporter de le regarder en face à nouveau',2,'N4'),
('Mon rythme de vie est rapide',2,'E4'),
('En vacances, je prefere retourner dans un endroir que je connais bien plutôt qu\'aller dans un nouvel endroit',1,'O4'),
('je suis dur( e) et inflexible',1,'A4'),
('Je m\'efforce à l\'excellence dans tout ce que je fais',2,'C4'),
('Quelquefois je fais sur une impulsion des choses que je regrette par la suite',2,'N5'),
('Je suis attiré( e) par les couleurs vives et les styles voyants',2,'E5'),
('J\'ai beaucoup de curiosité intellectuelle',2,'O5'),
('J\'aime mieux faire l\'éloge des autres plutôt que de recevoir moi-meme des eloges',2,'A5'),
('Il y a tant de petits travaux qu\'il faudrait faire que parfois tout simplement, je les ignore tous',1,'C5'),
('Quand tout à l\'air d\'aller de travaers, je reste capable de prendre de bonnes decisions ',1,'N6'),
('J\'emploie rarement des mots tels que "fantastique" ou "sensationnel" pour decrire ce qui est arrivé',1,'E6'),
('Je pense que si les gens ne savent pas à quoi ils croient quand ils ont vingt-cinq ans, il y a quelque chose qui ne tourne pas rond chez eux',2,'O6'),
('J\'ai de la compassion pour ceux qui ont moins de chance que moi',2,'A6'),
('Quand je pars en voyage, je prepare à l\'avance un programme minutiaux',2,'C6'),
('Des pensées effrayantes s\'introduisent quelquefois dans ma tête.',2,'N1'),
('Je m\'interesse vraiment aux gens avec lesquels je travaille',2,'E1'),
('J\'aurais du mal à laisser simplement mon esprit vagabonder sans contrôle ni direction',2,'O1'),
('J\'ai une grande confiance dans la nature humaine',1,'A1'),
('Je suis efficace et productif(ve) dans mon travail',2,'C1'),
('Pour moi, meme des petits contrariétés peuvent être irritantes',2,'N2'),
('J\'aime les "fetes" avec plein de gens',2,'E2'),
('J\'aime lire de la poesie qui met l\'accent sur les sentiments et les images plutôt que sur le déroulement de l\'histoire',2,'O2'),
('Je suis fier (ère) de l\'habileté avec laquelle je manipule les gens',1,'A2'),
('Je passe beaucoup de temps à chercher des choses que j\'ai mal rangées',1,'C2'),
('Trop souvent, quand les choses vont mal, je me décourage et j\'ai envie d\'abandonner',2,'N3'),
('Je ne trouve pas facile de prendre une situation en main',1,'E3'),
('Des choses étranges - comme certains parfaums ou des noms d\'endroits lointains - peuvent provoquer en moi des emotions puissantes.',2,'O3'),
('Si je peux je fais un effort pour aider les autres',2,'A3'),
('Il faudrait réellement que je sois malade pour manquer une journée de travail',2,'C3'),
('Quand des gens que je connais font des choses idiotes, j\'en suis gene( e) pour eux',2,'N4'),
('Je suis une personne très active',2,'E4'),
('Je prends toujours le meme chemin quand je vais quelque part',1,'O4'),
('Je m\'engage souvent dans des disputes avec ma famille ou mes collegues de travail',1,'A4'),
('Je consacre trop de temps au travail en negligeant la famille, les amis et les sloisirs',2,'C4'),
('Je suis tojours capable de garder le contrôle de mes sentiments',1,'N5'),
('J\'aime faire partie de la foule dans les manifestations sportives',2,'E5'),
('J\'ai une grande variété d\'interets intellectuels',2,'O5'),
('Je suis quelqu\'un de superieur',1,'A5'),
('J\'ai beaucoup d\'autodiscipline',2,'C5'),
('Je suis assez stable emotionnellement',1,'N6'),
('Je ris facilement',2,'E6'),
('Je crois que la "nouvelle morale" à base de permissivité n\'est pas du tout une morale',1,'O6'),
('Je prefererais avoir la réputation de pardonner plutôt que celle d\'etre juste',2,'A6'),
('Avant de répondre à une question, j\'y reflechis à deux fois',2,'C6');