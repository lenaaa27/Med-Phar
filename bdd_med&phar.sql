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

CREATE TRIGGER check_sexe_contraception
BEFORE INSERT ON Patient
FOR EACH ROW
BEGIN
    IF (NEW.sexe = 'M' AND NEW.contraception != 'none') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La contraception doit être "none" pour les patients masculins';
	END IF;
END;
/

-- Créer le déclencheur
CREATE TRIGGER check_activites_values
BEFORE INSERT ON Patient
FOR EACH ROW
BEGIN
    IF (NEW.activite_metier < 0 OR NEW.activite_metier > 5 OR 
        NEW.risque_metier < 0 OR NEW.risque_metier > 5 OR 
        NEW.activite_quotidienne < 0 OR NEW.activite_quotidienne > 5) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Les valeurs des colonnes activite_metier, risque_metier et activite_quotidienne doivent être comprises entre 0 et 5';
    END IF;
END;
/
-- Créer le déclencheur

CREATE TRIGGER check_date_fin
BEFORE INSERT ON Maladie
FOR EACH ROW
BEGIN
    IF NEW.fin_prise < NEW.debut_prise THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La date de fin ne peut pas être antérieure à la date de début';
    END IF;
END;
/
