create table adresse_cabinet(
	id int primary key, 
    numero int, 
    rue varchar(50),
    ville varchar(50),
    Departement varchar(50),
    Pays varchar(50)
    );
    
create table Medecin ( 
	id INT PRIMARY key, 
    prenom varchar(50), 
    nom varchar(50),
    date_naissance date,
    adresse_email varchar(50),
    mot_de_passe varchar(50),
    id_adresse int,
    FOREIGN KEY (id_adresse) REFERENCES adresse_cabinet(id)
    );
    
create table Patient( 
	id int primary key, 
    prenom varchar(50), 
    nom varchar(50),
    date_naissance date,
    sexe char,
    contraception varchar(50),
    poids int,
    taille float,
    allergie varchar(500),
    activite_metier int,
    risque_metier int, 
    activite_quotidienne int
    );
    
create table Medicament (
	CIS int primary key,
    nom varchar(50)
    );
    
create table Maladie (
	id int primary key, 
    symptome varchar(500),
    diagnostic varchar(500),
    debut_prise date,
    fin_prise date,
    id_medicament int,
    foreign key (id_medicament) references Medicament(CIS)
    );  
    
create table consultation (
	id int primary key, 
    id_medecin int,
    id_patient int,
    id_maladie int, 
    foreign key (id_maladie) references Maladie(id),
    foreign key (id_medecin) references Medecin(id),
    foreign key (id_patient) references Patient(id)
    );


-- Créer le déclencheur

alter table Patient 
add constraint activite_metier check ( activite_metier between 0 and 5 );

alter table Patient 
add constraint activite_quotidienne check ( activite_quotidienne between 0 and 5 );

alter table Patient 
add constraint risque_metier check ( risque_metier between 0 and 5 );

-- Créer le déclencheur

CREATE or replace TRIGGER check_date_fin
BEFORE INSERT ON Maladie
FOR EACH ROW
BEGIN
    IF :NEW.fin_prise < :NEW.debut_prise THEN
        RAISE_APPLICATION_ERROR(-20002,'La date de fin ne peut pas être antérieure à la date de début');
    END IF;
END;
/
-- Insertion dans la table adresse_cabinet
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(1, 123, 'Rue de la Santé', 'Paris', 'Paris', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(2, 456, 'Avenue des Médecins', 'Lyon', 'Rhône', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(3, 789, 'Boulevard de la Santé', 'Marseille', 'Bouches-du-Rhône', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(4, 101, 'Rue des Docteurs', 'Toulouse', 'Haute-Garonne', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(5, 222, 'Avenue Pasteur', 'Lille', 'Nord', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(6, 333, 'Place du Médecin', 'Bordeaux', 'Gironde', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(7, 444, 'Rue de la Santé', 'Nice', 'Alpes-Maritimes', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(8, 555, 'Avenue des Docteurs', 'Strasbourg', 'Bas-Rhin', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(9, 666, 'Boulevard du Médecin', 'Nantes', 'Loire-Atlantique', 'France');
INSERT INTO adresse_cabinet (id, numero, rue, ville, Departement, Pays) VALUES 
(10, 777, 'Rue des Médecins', 'Rennes', 'Ille-et-Vilaine', 'France');

-- Insertion dans la table Medecin
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(1, 'Jean', 'Dupont', date '1980-05-15', 'jean.dupont@example.com', 'motdepasse123', 1);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(2, 'Marie', 'Durand', date'1975-08-20', 'marie.durand@example.com', 'mdp456', 2);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(3, 'Pierre', 'Lefevre', date'1983-11-25', 'pierre.lefevre@example.com', 'mdp789', 3);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(4, 'Sophie', 'Martin', date'1978-03-12', 'sophie.martin@example.com', 'mdp101112', 4);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(5, 'Philippe', 'Garcia', date'1982-07-30', 'philippe.garcia@example.com', 'mdp131415', 5);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(6, 'Julie', 'Leroy', date'1976-09-18', 'julie.leroy@example.com', 'mdp161718', 6);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(7, 'François', 'Fournier', date'1985-01-05', 'francois.fournier@example.com', 'mdp192021', 7);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(8, 'Sylvie', 'Roux', date'1980-04-28', 'sylvie.roux@example.com', 'mdp222324', 8);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(9, 'Luc', 'Morin', date'1979-06-22', 'luc.morin@example.com', 'mdp252627', 9);
INSERT INTO Medecin (id, prenom, nom, date_naissance, adresse_email, mot_de_passe, id_adresse) VALUES 
(10, 'Céline', 'Roy', date'1984-08-17', 'celine.roy@example.com', 'mdp282930', 10);

SELECT * FROM USER_ERRORS WHERE TYPE = 'TRIGGER' AND NAME = 'CHECK_ACTIVITES_VALUES';

-- Insertion dans la table Patient
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(1, 'Alice', 'Martin', date'1990-03-10', 'F', 'Pilule', 60, 1.65, 'Aucune', 3, 2, 4);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(2, 'Paul', 'Dubois', date'1985-07-25', 'M', 'none', 80, 1.80, 'Allergie aux arachides', 4, 3, 5);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(3, 'Camille', 'Leroy', date'1993-02-12', 'F', 'Pilule', 55, 1.70, 'Aucune', 2, 1, 3);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(4, 'Thomas', 'Lefevre', date'1977-10-05', 'M', 'none', 70, 1.75, 'Aucune', 5, 4, 2);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(5, 'Émilie', 'Girard', date'1988-12-20', 'F', 'Implant', 65, 1.68, 'Aucune', 3, 2, 4);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(6, 'Vincent', 'Roux', date'1980-06-15', 'M', 'none', 90, 1.85, 'Aucune', 4, 3, 5);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(7, 'Marie', 'Fournier', date'1995-04-02', 'F', 'Pilule', 58, 1.63, 'Aucune', 2, 1, 3);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(8, 'Nicolas', 'Morin', date'1974-08-18', 'M', 'none', 75, 1.78, 'Allergie aux acariens', 5, 4, 2);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(9, 'Caroline', 'Roy', date'1983-11-30', 'F', 'none', 63, 1.72, 'Aucune', 3, 2, 4);
INSERT INTO Patient (id, prenom, nom, date_naissance, sexe, contraception, poids, taille, allergie, activite_metier, risque_metier, activite_quotidienne) VALUES 
(10, 'Alexandre', 'Leroux', date'1979-09-07', 'M', 'none', 85, 1.80, 'Aucune', 4, 3, 5);

-- Insertion dans la table Maladie
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(1, 'Fièvre, toux', 'Grippe', date '2024-01-10', date '2024-01-20');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(2, 'Douleurs abdominales', 'Gastrite', date'2024-02-05', date'2024-02-15');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(3, 'Éruption cutanée, démangeaisons', 'Allergie', date'2024-03-15',date '2024-03-25');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(4, 'Douleurs thoraciques, essoufflement', 'Infarctus du myocarde', date'2024-04-20',date '2024-05-05');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(5, 'Maux de tête, vision floue', 'Migraine', date'2024-05-10', date'2024-05-15');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(6, 'Fatigue, perte de poids', 'Diabète de type 2', date'2024-06-01', date'2024-06-30');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(7, 'Crampes musculaires, faiblesse', 'Déshydratation',date '2024-07-15',date '2024-07-25');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(8, 'Nausées, vomissements', 'Intoxication alimentaire', date'2024-08-05',date '2024-08-15');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(9, 'Démangeaisons anales, saignements', 'Hémorroïdes',date '2024-09-10',date '2024-09-20');
INSERT INTO Maladie (id, symptome, diagnostic, debut_prise, fin_prise) VALUES 
(10, 'Douleurs lombaires, difficultés à uriner', 'Prostate élargie', date'2024-10-01', date'2024-10-10');

-- Insertion dans la table consultation
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(1, 1, 1, 1);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(2, 2, 2, 2);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(3, 3, 3, 3);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(4, 4, 4, 4);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(5, 5, 5, 5);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(6, 6, 6, 6);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(7, 7, 7, 7);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(8, 8, 8, 8);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(9, 9, 9, 9);
INSERT INTO consultation (id, id_medecin, id_patient, id_maladie) VALUES 
(10, 10, 10, 10);
