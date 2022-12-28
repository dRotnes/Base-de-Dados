DROP schema if exists nba;
Create schema nba;
use nba;

Create table Jogadores(
    id int auto_increment not null,
    nome varchar(255),
    posicao varchar(3),
    altura varchar(10),
    peso varchar(10),
    idade int,
    camisa int,
    dataNasc varchar(10),
    idTeam int,
    primary key (id)
);

Create table Teams(
    id int auto_increment not null,
    nome varchar(255),
    cidade varchar(255),
    abreviacao varchar(3),
    n_vitorias int,
    n_derrotas int,
    idTecnico int, 
    idEstadio int, 
    primary key (id)
);

Create table Tecnicos(
    id int auto_increment not null,
    nome varchar(255),
    dataNasc varchar(10),
    tempInicio varchar(9),
    anosTime int,
    nacionalidade varchar(255),
    idTeam int, 
    primary key (id)
);

Create table Jogos(
    id int auto_increment not null,
    dataHora datetime,
    pontosCasa int,
    pontosVisitante int,
    idEstadio int,
    idTeamCasa int,
    idTeamFora int,
    primary key (id)
);

Create table Estadios(
    id int auto_increment not null,
    nome varchar(255),
    localidade varchar(255),
    primary key (id)
);

ALTER TABLE Jogadores
ADD Foreign key (idTeam) references Teams(id);

ALTER TABLE Teams
ADD Foreign key (idTecnico) references Tecnicos(id);

ALTER TABLE Teams
ADD Foreign key (idEstadio) references Estadios(id);

ALTER TABLE Tecnicos
ADD Foreign key (idTeam) references Teams(id);

ALTER TABLE Jogos
ADD Foreign key (idEstadio) references Estadios(id);

ALTER TABLE Jogos
ADD Foreign key (idTeamCasa) references Teams(id);

ALTER TABLE Jogos
ADD Foreign key (idTeamFora) references Teams(id);


-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nba-stadiums-19-12.csv'
-- INTO TABLE Estadios
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nba-coaches-19-12.csv'
-- INTO TABLE Tecnicos
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nba-players-19-12.csv'
-- INTO TABLE Jogadores
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nba-teams-19-12.csv'
-- INTO TABLE Teams
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nba-games-19-12.csv'
-- INTO TABLE Jogos
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (id, @dataHora, pontosCasa, pontosVisitante, idEstadio, idTeamCasa, idTeamFora)
-- set
-- dataHora = str_to_date(@dataHora, '%d/%m/%Y %H:%i');

