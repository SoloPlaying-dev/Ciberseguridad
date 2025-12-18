-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS universidad2;
USE universidad2;

-- Tabla de departamentos (entidad principal)
CREATE TABLE Departamento (
    DepartamentoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Tabla de estudiantes con relación a departamento
CREATE TABLE Estudiante (
    EstudianteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartamentoID INT NOT NULL,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID)
) ENGINE=InnoDB;

-- Tabla de profesores con relación a departamento
CREATE TABLE Profesor (
    ProfesorID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartamentoID INT NOT NULL,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID)
) ENGINE=InnoDB;

-- Tabla de cursos con relación a departamento
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL CHECK (Creditos BETWEEN 1 AND 6),
    DepartamentoID INT NOT NULL,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID)
) ENGINE=InnoDB;

-- Tabla de clases (instancias específicas de cursos)
CREATE TABLE Clase (
    ClaseID INT PRIMARY KEY AUTO_INCREMENT,
    CursoID INT NOT NULL,
    ProfesorID INT NOT NULL,
    Año INT NOT NULL,
    Semestre VARCHAR(20) NOT NULL,
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    FOREIGN KEY (ProfesorID) REFERENCES Profesor(ProfesorID),
    UNIQUE KEY (CursoID, ProfesorID, Año, Semestre)
) ENGINE=InnoDB;

-- Tabla de inscripciones (relación N:M entre estudiantes y clases)
CREATE TABLE Inscripcion (
    InscripcionID INT PRIMARY KEY AUTO_INCREMENT,
    EstudianteID INT NOT NULL,
    ClaseID INT NOT NULL,
    FechaInscripcion DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiante(EstudianteID),
    FOREIGN KEY (ClaseID) REFERENCES Clase(ClaseID),
    UNIQUE KEY (EstudianteID, ClaseID) -- Evita inscripciones duplicadas
) ENGINE=InnoDB;

-- Tabla de calificaciones
CREATE TABLE Calificacion (
    CalificacionID INT PRIMARY KEY AUTO_INCREMENT,
    InscripcionID INT NOT NULL,
    Nota DECIMAL(4,2) NOT NULL CHECK (Nota BETWEEN 0 AND 10),
    FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (InscripcionID) REFERENCES Inscripcion(InscripcionID)
) ENGINE=InnoDB;


-- Insertar Departamentos
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (1, 'Ingeniería');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (2, 'Matemáticas');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (3, 'Historia');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (4, 'Biología');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (5, 'Filosofía');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (6, 'Economía');

-- Insertar Estudiantes
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (1, 'Casemiro', 'Manrique', '1994-11-02', 'pferreras@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (2, 'Che', 'Tovar', '2001-08-11', 'ireneperello@pont.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (3, 'Epifanio', 'Pou', '2002-12-27', 'sanchopio@duarte.es', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (4, 'Pepito', 'Campoy', '2004-09-12', 'castillofrancisco-javier@villar-hervas.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (5, 'Santiago', 'España', '2002-02-03', 'roman05@ferrandez.es', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (6, 'Encarnacion', 'Alsina', '2004-04-11', 'apina@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (7, 'Nacho', 'Mariño', '2000-03-06', 'jsuarez@saldana.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (8, 'Lupe', 'Villar', '2001-11-23', 'tomasmanzano@yahoo.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (9, 'Iker', 'Piñol', '1995-03-02', 'ciprianocepeda@casas-galvan.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (10, 'Anna', 'Blanes', '1997-09-01', 'jorgetome@azcona.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (11, 'José', 'Pérez', '1999-10-01', 'yaiza77@abellan-sanmartin.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (12, 'Lorena', 'Torrecilla', '2004-06-28', 'angulojulian@yahoo.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (13, 'Reyna', 'Bustamante', '2006-08-04', 'angelinodavila@hotmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (14, 'Violeta', 'Arranz', '2004-03-10', 'kcastellanos@rey.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (15, 'Espiridión', 'Reguera', '2006-01-05', 'hasensio@hotmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (16, 'Ariadna', 'Iriarte', '1998-02-20', 'dionisiaalfonso@llado-moraleda.es', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (17, 'Ascensión', 'Llopis', '1999-09-29', 'manupalacios@gmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (18, 'Aroa', 'Cabañas', '2000-10-15', 'poncioquero@gmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (19, 'Albano', 'Pereira', '1995-01-06', 'mmascaro@sierra-dominguez.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (20, 'Emelina', 'Morell', '1999-10-24', 'rosseve@cardona-carpio.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (21, 'Consuelo', 'Pujol', '1998-01-22', 'rcalzada@gmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (22, 'Griselda', 'Sancho', '1998-06-07', 'ezequielvinas@hotmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (23, 'Amaro', 'Aramburu', '1997-08-22', 'alcantaracasemiro@llanos-isern.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (24, 'Carmina', 'Pina', '2001-11-12', 'ainoa23@gmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (25, 'Leocadio', 'Acedo', '1995-01-08', 'mateo16@jimenez.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (26, 'Leoncio', 'Acosta', '1998-03-01', 'paredesimelda@ocana.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (27, 'Ángel', 'Herranz', '2003-06-29', 'ascensionjaume@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (28, 'Mateo', 'Vélez', '1996-12-22', 'rverdugo@gmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (29, 'Carina', 'Artigas', '2005-03-16', 'monica23@yahoo.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (30, 'Eutropio', 'Mayo', '2000-02-04', 'ycamino@alarcon.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (31, 'Amando', 'Lerma', '1994-07-13', 'mauriciosevilla@gmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (32, 'Sosimo', 'Luna', '2002-04-18', 'jcollado@yahoo.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (33, 'Pánfilo', 'Tovar', '1996-03-16', 'pineirorodrigo@gomila.net', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (34, 'Moisés', 'Rivas', '1999-06-26', 'hsaenz@yahoo.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (35, 'Eligio', 'Oliver', '1999-06-28', 'torrentshernando@mateu.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (36, 'Adolfo', 'Rebollo', '1999-07-20', 'aristides30@pou.org', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (37, 'Rico', 'Cabo', '1995-10-12', 'anabelcarbo@gmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (38, 'Adelardo', 'Galindo', '1998-10-03', 'gibertgodofredo@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (39, 'Nuria', 'Arnaiz', '2005-04-10', 'socorro51@hotmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (40, 'Celestino', 'Sarmiento', '1995-02-04', 'moreno01@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (41, 'Mar', 'Almazán', '1996-04-30', 'olivaressaturnina@llobet.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (42, 'Débora', 'Higueras', '2007-03-18', 'canascalixto@hotmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (43, 'Eustaquio', 'Goicoechea', '2000-02-06', 'cruz05@campo.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (44, 'Gertrudis', 'Blanch', '2001-07-05', 'ruysanjuan@nicolau.es', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (45, 'Eugenio', 'Casals', '1997-04-14', 'garcesmohamed@robles.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (46, 'Pacífica', 'Feijoo', '2005-02-22', 'snicolas@gmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (47, 'Fabio', 'Núñez', '2000-10-01', 'ruanocelia@yahoo.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (48, 'Teo', 'Bayón', '2005-01-17', 'javiblazquez@landa.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (49, 'Rosario', 'Llabrés', '1998-08-07', 'montserratana-sofia@garcia.es', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (50, 'Fernando', 'Gomis', '2005-10-05', 'ymontesinos@carreno.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (51, 'Valero', 'Gaya', '2004-01-02', 'eustaquio86@rodrigo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (52, 'Yago', 'Vaquero', '2004-12-04', 'octaviaalmeida@arranz.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (53, 'Plinio', 'Marín', '1997-04-29', 'zfrutos@montalban-anguita.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (54, 'Jorge', 'Rocamora', '2001-04-17', 'xibarra@quintana.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (55, 'Perlita', 'Santana', '1997-12-11', 'tsimo@gmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (56, 'Brunilda', 'Naranjo', '2003-01-17', 'javiera23@olmo.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (57, 'Agapito', 'Batlle', '2000-07-12', 'pedro32@diez.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (58, 'Amancio', 'Yáñez', '2005-09-26', 'quintanamatias@carbonell.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (59, 'Evita', 'Leon', '2006-12-06', 'eligiaarenas@palacio.es', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (60, 'Imelda', 'Guillen', '1998-02-05', 'cornejoeva-maria@gmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (61, 'Sara', 'Redondo', '1995-09-24', 'qabad@arco.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (62, 'Vicente', 'Conde', '1999-11-21', 'macario01@hotmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (63, 'Trinidad', 'Castell', '1998-04-06', 'salvadorfidel@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (64, 'Rosalía', 'Cañizares', '2005-12-27', 'adelanavarrete@prieto-andreu.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (65, 'Fabián', 'Pino', '2004-11-08', 'natanaelmesa@hotmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (66, 'Marcelino', 'González', '2001-06-30', 'amanciocabo@gmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (67, 'Luisina', 'Méndez', '2006-09-02', 'hcanales@mateo.net', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (68, 'Rosalía', 'Abril', '1995-02-19', 'garridomaria-angeles@gmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (69, 'Cesar', 'Gárate', '1998-03-08', 'nilotamayo@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (70, 'Mariana', 'Fuster', '1996-04-08', 'torremarcial@hotmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (71, 'Ariel', 'Olivera', '1994-12-22', 'perlamarti@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (72, 'Felipe', 'Cañizares', '1997-11-30', 'luz63@hotmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (73, 'Luciana', 'Mayoral', '1998-10-06', 'durannarciso@hotmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (74, 'Desiderio', 'Sastre', '1996-12-24', 'isernnadia@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (75, 'Carolina', 'Chamorro', '2006-06-25', 'nievesespinosa@sole-leon.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (76, 'Evaristo', 'Barragán', '2003-10-22', 'german20@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (77, 'Leyre', 'Estevez', '1996-12-29', 'jcriado@gmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (78, 'Carmelita', 'Sebastián', '2002-10-28', 'iglesianoe@torrijos.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (79, 'Calisto', 'Cuesta', '2007-04-22', 'sosimodelgado@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (80, 'Dionisia', 'Lobo', '2002-04-19', 'gquiros@gmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (81, 'Dolores', 'Gallego', '2000-02-29', 'hilario82@pera.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (82, 'Alondra', 'Ochoa', '1997-06-12', 'nverdejo@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (83, 'Aroa', 'Ferrera', '2003-05-09', 'fnicolas@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (84, 'José', 'Goicoechea', '2003-12-12', 'zmesa@vives.es', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (85, 'María Teresa', 'Amaya', '1997-05-04', 'carlos85@luz.org', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (86, 'Isidora', 'Campoy', '1997-08-25', 'ritaroman@lujan.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (87, 'Oriana', 'Lobo', '1999-06-27', 'cifuentesanacleto@gil.org', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (88, 'Jose', 'Vidal', '2004-11-02', 'leonor27@gmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (89, 'Luna', 'Reig', '2005-10-01', 'sreal@alcazar.es', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (90, 'Onofre', 'Bru', '2007-03-06', 'jovitaguerra@borrego.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (91, 'Rolando', 'Valenciano', '2000-01-11', 'eligio44@vendrell.es', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (92, 'Lourdes', 'Donaire', '2000-10-05', 'miriamaviles@carrillo-salom.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (93, 'Maura', 'Escobar', '2000-02-22', 'vinacristian@crespi-corbacho.org', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (94, 'Gil', 'Montalbán', '2003-03-19', 'amorgilabert@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (95, 'Edelmiro', 'Cabeza', '2005-07-01', 'vicente66@quiroga.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (96, 'Raquel', 'Carbonell', '2005-11-21', 'sexposito@gmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (97, 'Lorenzo', 'Laguna', '1997-03-28', 'molinerflorentino@dalmau-sevilla.org', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (98, 'Natividad', 'Morera', '2005-08-08', 'sofia45@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (99, 'Felix', 'Taboada', '2006-07-26', 'ysegura@valbuena.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (100, 'Alma', 'Abascal', '2000-02-09', 'nogueraeutimio@benavente.es', 1);

-- Insertar Profesores
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (1, 'David', 'Pedraza', 'jennifer05@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (2, 'Fernanda', 'Morán', 'zsaenz@hotmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (3, 'Dominga', 'Cueto', 'tarmas@hotmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (4, 'Emiliana', 'Pedrero', 'bernardita35@gmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (5, 'Asdrubal', 'Guillén', 'nadia62@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (6, 'Nicolasa', 'Guerra', 'mariano35@sanjuan-paniagua.net', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (7, 'Azucena', 'Ferrán', 'curro95@hotmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (8, 'Víctor', 'Soriano', 'araceli64@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (9, 'Damián', 'Tamayo', 'baltasarsala@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (10, 'Albina', 'Múgica', 'josepmorcillo@vara-gallego.es', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (11, 'Elvira', 'Gelabert', 'herrerainocencio@barbero-salas.net', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (12, 'Pánfilo', 'Elorza', 'german89@amat.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (13, 'Donato', 'Tello', 'abelpoza@vall.es', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (14, 'Nazario', 'Ibarra', 'avilapastora@maldonado.org', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (15, 'Chelo', 'Haro', 'fabramacario@hotmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (16, 'Leonardo', 'Villalba', 'aadadia@hotmail.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (17, 'Elisa', 'Cerro', 'xcid@gmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (18, 'Roque', 'Checa', 'leocadia68@santamaria.es', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (19, 'Cleto', 'Aller', 'maria-luisacorominas@ribera.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (20, 'Baltasar', 'Badía', 'samuplanas@colom.org', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (21, 'Ana', 'Fuertes', 'arrietaamaya@serrano.es', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (22, 'Chelo', 'Prado', 'damian06@gmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (23, 'Belén', 'Guzmán', 'rodavalentina@mateo.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (24, 'Angelita', 'Paredes', 'rgibert@elias.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (25, 'Jerónimo', 'Valls', 'wmoreno@olmedo.net', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (26, 'Odalys', 'Cuevas', 'marcoberenguer@vargas.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (27, 'Ángeles', 'Egea', 'fabricioespejo@hotmail.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (28, 'Esmeralda', 'Martínez', 'lucho35@marino.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (29, 'Tristán', 'Calderón', 'kmoya@boada-vilanova.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (30, 'Clemente', 'Chico', 'yparejo@avila-camps.es', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (31, 'Mónica', 'Morante', 'loretopaniagua@yahoo.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (32, 'Heliodoro', 'Marin', 'eusebiocardenas@real.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (33, 'Agapito', 'Dávila', 'lduarte@gmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (34, 'Severiano', 'Vallejo', 'casasesther@gmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (35, 'Narcisa', 'Calvet', 'albina39@hotmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (36, 'Ariel', 'Prat', 'mamigo@lasa.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (37, 'Vilma', 'Fuentes', 'javi35@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (38, 'Esteban', 'Ledesma', 'ycampoy@gmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (39, 'Saturnina', 'Moliner', 'narevalo@coronado-bueno.org', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (40, 'Ruperta', 'Porras', 'octaviolamas@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (41, 'Cayetano', 'Salamanca', 'xnogues@gmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (42, 'Arturo', 'Río', 'custodio23@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (43, 'Herminio', 'Baró', 'amalia61@calzada-macias.es', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (44, 'Eva María', 'Coronado', 'quintanadesiderio@perera.es', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (45, 'Alejo', 'Barba', 'cleon@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (46, 'Teresita', 'Lledó', 'esainz@corral.es', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (47, 'Joaquina', 'Belda', 'piedad22@yahoo.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (48, 'Eutropio', 'Rebollo', 'hrebollo@hotmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (49, 'Anna', 'Barbero', 'xcanellas@marques.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (50, 'Angelita', 'Valero', 'francisco-javier78@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (51, 'Cecilio', 'Martinez', 'maria-del-carmenolivares@hotmail.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (52, 'Glauco', 'Hernandez', 'upinol@linares.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (53, 'Bonifacio', 'Sosa', 'vilaplanaluis@jordan-tello.net', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (54, 'Maribel', 'Juárez', 'carmelo52@oliva.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (55, 'Begoña', 'Soler', 'eadan@mata.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (56, 'Feliciano', 'Llobet', 'adrianserra@hotmail.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (57, 'Encarnacion', 'Valle', 'palmaamando@pardo-briones.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (58, 'Juan Pablo', 'Galiano', 'carlos85@perez.net', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (59, 'José Ángel', 'Villegas', 'irosado@montesinos.net', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (60, 'Isabela', 'Expósito', 'desparza@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (61, 'José', 'Carrasco', 'lucenamodesto@beltran.es', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (62, 'Diana', 'Martorell', 'korozco@lluch.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (63, 'Isidro', 'Valdés', 'julie01@hotmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (64, 'Nando', 'Fuente', 'iglesiasimon@hotmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (65, 'Máxima', 'Vazquez', 'mgras@hotmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (66, 'Filomena', 'Pla', 'halfaro@morante.es', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (67, 'Victorino', 'Gras', 'bbenet@quintanilla.es', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (68, 'Ángeles', 'Oliva', 'ngarcia@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (69, 'Verónica', 'Arellano', 'josue82@cespedes.net', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (70, 'Rosario', 'Cruz', 'fbosch@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (71, 'Hilda', 'Andres', 'juan-luispolo@yahoo.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (72, 'Eusebio', 'Cuadrado', 'galvanluz@jorda.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (73, 'Joaquina', 'Cazorla', 'vicentemorata@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (74, 'Ruth', 'Camps', 'miguelgaspar@hotmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (75, 'Reinaldo', 'Águila', 'camaramarita@hotmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (76, 'Calisto', 'Delgado', 'eugenioalemany@gmail.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (77, 'Ezequiel', 'Villar', 'cnadal@gallo-palma.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (78, 'Jimena', 'Román', 'cvillalba@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (79, 'Teodosio', 'Blanes', 'edmundo05@cuenca-alba.org', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (80, 'Gilberto', 'Carreras', 'ingrid94@falco.net', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (81, 'Rogelio', 'Iriarte', 'uginer@frutos-revilla.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (82, 'Alba', 'Noriega', 'diegodelia@sainz-berrocal.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (83, 'Ildefonso', 'Lasa', 'isidoracervera@aguado-carpio.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (84, 'Irene', 'Pozo', 'xavier55@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (85, 'Berta', 'Arnau', 'mfranch@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (86, 'Santos', 'Almagro', 'pizarrofito@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (87, 'Augusto', 'Coll', 'valentin51@gmail.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (88, 'Esther', 'Castellanos', 'lunamariano@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (89, 'Adelardo', 'Santana', 'estevedorita@hotmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (90, 'Palmira', 'Morales', 'elenahervas@salmeron-sales.es', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (91, 'Edelmiro', 'Bernat', 'bienvenidaferrer@yahoo.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (92, 'Cintia', 'Caballero', 'gracielacorral@gmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (93, 'Cirino', 'Herrero', 'rverdugo@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (94, 'Fabricio', 'Pereira', 'rayazaira@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (95, 'Onofre', 'Godoy', 'anibalsantana@crespo-ayllon.org', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (96, 'Eusebia', 'Murcia', 'heriberto54@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (97, 'Candelas', 'Duarte', 'olgamontes@gmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (98, 'Angélica', 'Fuente', 'vpujadas@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (99, 'Octavio', 'Leon', 'tomedaniela@roldan.net', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (100, 'Anselma', 'Cuevas', 'rochabenigna@ugarte.com', 5);

-- Insertar Cursos
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (1, 'Curso Minus 1', 5, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (2, 'Curso Voluptas 2', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (3, 'Curso Qui 3', 5, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (4, 'Curso Omnis 4', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (5, 'Curso Cum 5', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (6, 'Curso Harum 6', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (7, 'Curso Quisquam 7', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (8, 'Curso Vel 8', 1, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (9, 'Curso Distinctio 9', 4, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (10, 'Curso Expedita 10', 4, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (11, 'Curso Illum 11', 2, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (12, 'Curso Tenetur 12', 3, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (13, 'Curso Quis 13', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (14, 'Curso Est 14', 5, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (15, 'Curso Corrupti 15', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (16, 'Curso Magnam 16', 5, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (17, 'Curso Temporibus 17', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (18, 'Curso Mollitia 18', 4, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (19, 'Curso Minima 19', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (20, 'Curso Architecto 20', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (21, 'Curso Maiores 21', 5, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (22, 'Curso Eveniet 22', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (23, 'Curso Aliquid 23', 4, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (24, 'Curso Omnis 24', 5, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (25, 'Curso Id 25', 4, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (26, 'Curso Voluptas 26', 4, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (27, 'Curso Ipsum 27', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (28, 'Curso Reiciendis 28', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (29, 'Curso Aut 29', 3, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (30, 'Curso Sit 30', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (31, 'Curso Cumque 31', 5, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (32, 'Curso Inventore 32', 2, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (33, 'Curso Veniam 33', 4, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (34, 'Curso Veritatis 34', 2, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (35, 'Curso Aliquam 35', 1, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (36, 'Curso A 36', 5, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (37, 'Curso Dolore 37', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (38, 'Curso Vel 38', 4, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (39, 'Curso Excepturi 39', 2, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (40, 'Curso Velit 40', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (41, 'Curso Numquam 41', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (42, 'Curso Aperiam 42', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (43, 'Curso Incidunt 43', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (44, 'Curso Saepe 44', 1, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (45, 'Curso Neque 45', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (46, 'Curso Aut 46', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (47, 'Curso Eos 47', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (48, 'Curso Labore 48', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (49, 'Curso Dolor 49', 4, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (50, 'Curso Non 50', 1, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (51, 'Curso Molestias 51', 4, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (52, 'Curso Inventore 52', 3, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (53, 'Curso Eveniet 53', 2, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (54, 'Curso Debitis 54', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (55, 'Curso Assumenda 55', 4, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (56, 'Curso Unde 56', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (57, 'Curso Blanditiis 57', 3, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (58, 'Curso Pariatur 58', 2, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (59, 'Curso Nihil 59', 4, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (60, 'Curso Vero 60', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (61, 'Curso Laboriosam 61', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (62, 'Curso Dignissimos 62', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (63, 'Curso Cum 63', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (64, 'Curso Qui 64', 5, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (65, 'Curso Error 65', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (66, 'Curso Quo 66', 4, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (67, 'Curso Minus 67', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (68, 'Curso Esse 68', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (69, 'Curso Totam 69', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (70, 'Curso Debitis 70', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (71, 'Curso Autem 71', 5, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (72, 'Curso Ea 72', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (73, 'Curso Voluptatibus 73', 4, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (74, 'Curso Molestiae 74', 1, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (75, 'Curso Suscipit 75', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (76, 'Curso Alias 76', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (77, 'Curso Voluptate 77', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (78, 'Curso Adipisci 78', 5, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (79, 'Curso Beatae 79', 4, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (80, 'Curso Saepe 80', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (81, 'Curso Error 81', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (82, 'Curso Laboriosam 82', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (83, 'Curso Totam 83', 2, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (84, 'Curso Assumenda 84', 2, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (85, 'Curso Cupiditate 85', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (86, 'Curso Voluptates 86', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (87, 'Curso Eligendi 87', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (88, 'Curso Aliquid 88', 3, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (89, 'Curso Repudiandae 89', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (90, 'Curso Reiciendis 90', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (91, 'Curso Dolor 91', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (92, 'Curso Tempora 92', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (93, 'Curso Debitis 93', 4, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (94, 'Curso Eos 94', 3, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (95, 'Curso Deserunt 95', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (96, 'Curso Error 96', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (97, 'Curso Quia 97', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (98, 'Curso At 98', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (99, 'Curso Rem 99', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (100, 'Curso Sed 100', 4, 4);

-- Insertar Clases
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (1, 83, 49, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (2, 11, 99, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (3, 98, 70, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (4, 32, 84, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (5, 4, 57, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (6, 12, 44, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (7, 13, 47, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (8, 24, 57, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (9, 89, 15, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (10, 74, 40, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (11, 71, 35, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (12, 6, 58, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (13, 36, 51, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (14, 30, 96, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (15, 88, 40, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (16, 74, 30, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (17, 92, 62, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (18, 34, 88, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (19, 9, 100, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (20, 95, 65, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (21, 66, 38, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (22, 20, 22, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (23, 20, 84, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (24, 16, 13, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (25, 72, 62, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (26, 48, 36, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (27, 6, 59, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (28, 50, 56, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (29, 50, 13, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (30, 48, 52, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (31, 99, 62, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (32, 73, 63, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (33, 79, 44, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (34, 55, 83, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (35, 62, 77, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (36, 88, 8, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (37, 50, 32, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (38, 67, 46, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (39, 93, 59, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (40, 76, 28, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (41, 42, 17, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (42, 72, 67, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (43, 76, 72, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (44, 63, 99, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (45, 93, 31, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (46, 71, 12, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (47, 87, 3, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (48, 38, 76, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (49, 54, 83, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (50, 10, 96, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (51, 53, 96, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (52, 68, 93, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (53, 16, 80, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (54, 19, 91, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (55, 25, 48, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (56, 85, 72, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (57, 55, 92, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (58, 81, 38, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (59, 96, 53, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (60, 62, 73, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (61, 10, 42, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (62, 67, 86, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (63, 49, 29, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (64, 92, 87, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (65, 23, 36, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (66, 1, 19, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (67, 18, 10, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (68, 57, 92, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (69, 4, 72, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (70, 75, 47, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (71, 84, 61, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (72, 75, 66, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (73, 22, 39, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (74, 53, 95, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (75, 78, 62, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (76, 73, 35, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (77, 96, 52, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (78, 29, 16, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (79, 60, 45, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (80, 79, 46, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (81, 79, 8, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (82, 63, 79, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (83, 32, 26, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (84, 77, 94, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (85, 90, 43, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (86, 63, 34, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (87, 88, 58, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (88, 21, 75, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (89, 68, 96, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (90, 23, 82, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (91, 25, 78, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (92, 40, 23, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (93, 74, 22, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (94, 62, 86, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (95, 19, 93, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (96, 43, 57, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (97, 67, 99, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (98, 7, 38, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (99, 66, 77, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (100, 85, 32, 2024, 'Otoño');

-- Insertar Inscripciones
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (1, 45, 20, '2024-04-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (2, 48, 9, '2024-07-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (3, 41, 28, '2024-11-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (4, 51, 86, '2025-03-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (5, 30, 31, '2024-10-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (6, 2, 22, '2024-05-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (7, 12, 70, '2025-01-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (8, 17, 67, '2025-03-18');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (9, 63, 16, '2024-05-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (10, 46, 57, '2024-05-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (11, 23, 55, '2025-04-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (12, 61, 53, '2024-08-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (13, 46, 82, '2024-07-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (14, 98, 40, '2024-05-05');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (15, 57, 78, '2025-01-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (16, 96, 89, '2024-07-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (17, 75, 79, '2024-08-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (18, 32, 100, '2024-12-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (19, 41, 49, '2024-12-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (20, 86, 70, '2024-06-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (21, 87, 31, '2024-09-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (22, 50, 53, '2025-01-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (23, 50, 58, '2025-04-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (24, 5, 76, '2024-07-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (25, 83, 80, '2025-04-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (26, 50, 34, '2024-06-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (27, 26, 62, '2024-12-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (28, 94, 11, '2025-02-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (29, 79, 74, '2025-03-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (30, 35, 35, '2025-02-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (31, 17, 65, '2025-01-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (32, 27, 31, '2024-10-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (33, 98, 3, '2024-11-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (34, 46, 39, '2024-05-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (35, 84, 11, '2024-06-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (36, 88, 93, '2024-10-20');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (37, 42, 56, '2024-08-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (38, 82, 25, '2024-09-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (39, 70, 19, '2024-08-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (40, 19, 54, '2025-02-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (41, 97, 66, '2024-06-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (42, 78, 42, '2025-03-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (43, 53, 48, '2024-11-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (44, 14, 79, '2024-05-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (45, 11, 95, '2024-09-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (46, 25, 12, '2025-04-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (47, 100, 31, '2024-08-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (48, 52, 48, '2025-01-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (49, 23, 86, '2024-11-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (50, 30, 84, '2024-09-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (51, 19, 47, '2025-01-18');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (52, 47, 64, '2024-11-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (53, 54, 38, '2025-01-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (54, 28, 61, '2024-12-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (55, 13, 50, '2024-09-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (56, 37, 18, '2024-06-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (57, 81, 26, '2024-05-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (58, 35, 60, '2024-12-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (59, 81, 48, '2024-08-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (60, 7, 41, '2025-02-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (61, 84, 18, '2025-03-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (62, 43, 51, '2024-06-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (63, 97, 92, '2025-02-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (64, 67, 28, '2024-08-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (65, 44, 50, '2024-08-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (66, 63, 27, '2024-12-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (67, 84, 86, '2024-08-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (68, 54, 26, '2024-07-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (69, 26, 77, '2024-07-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (70, 73, 95, '2025-01-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (71, 71, 48, '2025-01-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (72, 10, 17, '2024-12-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (73, 21, 44, '2024-07-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (74, 81, 27, '2024-04-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (75, 56, 95, '2024-05-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (76, 36, 37, '2024-11-13');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (77, 94, 37, '2024-10-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (78, 84, 3, '2024-09-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (79, 89, 20, '2024-05-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (80, 53, 97, '2024-10-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (81, 49, 24, '2024-05-13');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (82, 31, 10, '2025-04-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (83, 77, 67, '2024-10-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (84, 11, 41, '2025-02-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (85, 85, 24, '2025-03-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (86, 19, 45, '2025-02-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (87, 64, 64, '2025-03-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (88, 40, 97, '2024-11-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (89, 60, 34, '2024-10-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (90, 64, 39, '2024-07-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (91, 25, 77, '2024-10-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (92, 30, 4, '2024-09-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (93, 65, 78, '2024-09-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (94, 86, 96, '2024-12-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (95, 31, 42, '2024-11-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (96, 46, 42, '2024-11-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (97, 82, 35, '2025-03-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (98, 48, 9, '2024-12-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (99, 47, 7, '2024-07-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (100, 30, 61, '2024-11-16');

-- Insertar Calificaciones
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (1, 1, 64.2);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (2, 2, 73.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (3, 3, 69.16);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (4, 4, 78.37);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (5, 5, 76.96);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (6, 6, 71.71);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (7, 7, 68.25);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (8, 8, 97.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (9, 9, 94.78);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (10, 10, 60.24);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (11, 11, 76.41);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (12, 12, 75.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (13, 13, 86.44);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (14, 14, 94.13);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (15, 15, 92.15);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (16, 16, 96.35);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (17, 17, 89.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (18, 18, 99.55);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (19, 19, 67.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (20, 20, 66.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (21, 21, 83.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (22, 22, 86.69);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (23, 23, 99.43);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (24, 24, 79.9);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (25, 25, 66.72);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (26, 26, 60.09);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (27, 27, 99.07);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (28, 28, 80.39);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (29, 29, 67.1);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (30, 30, 79.35);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (31, 31, 92.12);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (32, 32, 62.45);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (33, 33, 70.3);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (34, 34, 67.23);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (35, 35, 61.38);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (36, 36, 65.29);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (37, 37, 92.85);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (38, 38, 60.06);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (39, 39, 63.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (40, 40, 74.26);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (41, 41, 90.3);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (42, 42, 91.39);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (43, 43, 72.58);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (44, 44, 93.69);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (45, 45, 92.76);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (46, 46, 74.6);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (47, 47, 78.85);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (48, 48, 71.73);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (49, 49, 68.47);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (50, 50, 95.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (51, 51, 99.95);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (52, 52, 73.6);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (53, 53, 78.32);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (54, 54, 78.22);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (55, 55, 74.36);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (56, 56, 85.92);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (57, 57, 88.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (58, 58, 72.68);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (59, 59, 99.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (60, 60, 88.27);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (61, 61, 89.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (62, 62, 60.74);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (63, 63, 87.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (64, 64, 75.22);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (65, 65, 67.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (66, 66, 91.39);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (67, 67, 87.53);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (68, 68, 71.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (69, 69, 72.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (70, 70, 82.47);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (71, 71, 89.47);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (72, 72, 76.77);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (73, 73, 79.81);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (74, 74, 90.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (75, 75, 69.17);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (76, 76, 86.01);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (77, 77, 92.4);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (78, 78, 95.39);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (79, 79, 84.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (80, 80, 73.01);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (81, 81, 92.48);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (82, 82, 67.96);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (83, 83, 72.43);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (84, 84, 60.58);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (85, 85, 99.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (86, 86, 84.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (87, 87, 67.69);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (88, 88, 93.27);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (89, 89, 83.7);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (90, 90, 62.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (91, 91, 67.68);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (92, 92, 82.57);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (93, 93, 73.45);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (94, 94, 73.89);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (95, 95, 90.83);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (96, 96, 68.51);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (97, 97, 70.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (98, 98, 63.06);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (99, 99, 82.72);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (100, 100, 94.6);

-- INSERTANDO MAS REGISTRO EN LAS DIFERENTES TABLAS 
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (101, 'Departamento 101');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (102, 'Departamento 102');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (103, 'Departamento 103');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (104, 'Departamento 104');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (105, 'Departamento 105');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (106, 'Departamento 106');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (107, 'Departamento 107');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (108, 'Departamento 108');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (109, 'Departamento 109');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (110, 'Departamento 110');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (111, 'Departamento 111');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (112, 'Departamento 112');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (113, 'Departamento 113');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (114, 'Departamento 114');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (115, 'Departamento 115');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (116, 'Departamento 116');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (117, 'Departamento 117');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (118, 'Departamento 118');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (119, 'Departamento 119');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (120, 'Departamento 120');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (121, 'Departamento 121');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (122, 'Departamento 122');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (123, 'Departamento 123');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (124, 'Departamento 124');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (125, 'Departamento 125');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (126, 'Departamento 126');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (127, 'Departamento 127');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (128, 'Departamento 128');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (129, 'Departamento 129');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (130, 'Departamento 130');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (131, 'Departamento 131');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (132, 'Departamento 132');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (133, 'Departamento 133');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (134, 'Departamento 134');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (135, 'Departamento 135');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (136, 'Departamento 136');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (137, 'Departamento 137');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (138, 'Departamento 138');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (139, 'Departamento 139');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (140, 'Departamento 140');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (141, 'Departamento 141');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (142, 'Departamento 142');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (143, 'Departamento 143');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (144, 'Departamento 144');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (145, 'Departamento 145');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (146, 'Departamento 146');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (147, 'Departamento 147');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (148, 'Departamento 148');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (149, 'Departamento 149');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (150, 'Departamento 150');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (151, 'Departamento 151');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (152, 'Departamento 152');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (153, 'Departamento 153');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (154, 'Departamento 154');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (155, 'Departamento 155');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (156, 'Departamento 156');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (157, 'Departamento 157');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (158, 'Departamento 158');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (159, 'Departamento 159');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (160, 'Departamento 160');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (161, 'Departamento 161');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (162, 'Departamento 162');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (163, 'Departamento 163');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (164, 'Departamento 164');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (165, 'Departamento 165');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (166, 'Departamento 166');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (167, 'Departamento 167');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (168, 'Departamento 168');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (169, 'Departamento 169');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (170, 'Departamento 170');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (171, 'Departamento 171');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (172, 'Departamento 172');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (173, 'Departamento 173');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (174, 'Departamento 174');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (175, 'Departamento 175');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (176, 'Departamento 176');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (177, 'Departamento 177');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (178, 'Departamento 178');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (179, 'Departamento 179');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (180, 'Departamento 180');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (181, 'Departamento 181');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (182, 'Departamento 182');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (183, 'Departamento 183');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (184, 'Departamento 184');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (185, 'Departamento 185');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (186, 'Departamento 186');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (187, 'Departamento 187');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (188, 'Departamento 188');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (189, 'Departamento 189');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (190, 'Departamento 190');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (191, 'Departamento 191');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (192, 'Departamento 192');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (193, 'Departamento 193');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (194, 'Departamento 194');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (195, 'Departamento 195');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (196, 'Departamento 196');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (197, 'Departamento 197');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (198, 'Departamento 198');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (199, 'Departamento 199');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (200, 'Departamento 200');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (201, 'Departamento 201');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (202, 'Departamento 202');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (203, 'Departamento 203');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (204, 'Departamento 204');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (205, 'Departamento 205');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (206, 'Departamento 206');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (207, 'Departamento 207');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (208, 'Departamento 208');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (209, 'Departamento 209');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (210, 'Departamento 210');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (211, 'Departamento 211');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (212, 'Departamento 212');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (213, 'Departamento 213');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (214, 'Departamento 214');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (215, 'Departamento 215');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (216, 'Departamento 216');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (217, 'Departamento 217');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (218, 'Departamento 218');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (219, 'Departamento 219');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (220, 'Departamento 220');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (221, 'Departamento 221');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (222, 'Departamento 222');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (223, 'Departamento 223');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (224, 'Departamento 224');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (225, 'Departamento 225');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (226, 'Departamento 226');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (227, 'Departamento 227');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (228, 'Departamento 228');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (229, 'Departamento 229');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (230, 'Departamento 230');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (231, 'Departamento 231');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (232, 'Departamento 232');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (233, 'Departamento 233');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (234, 'Departamento 234');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (235, 'Departamento 235');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (236, 'Departamento 236');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (237, 'Departamento 237');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (238, 'Departamento 238');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (239, 'Departamento 239');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (240, 'Departamento 240');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (241, 'Departamento 241');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (242, 'Departamento 242');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (243, 'Departamento 243');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (244, 'Departamento 244');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (245, 'Departamento 245');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (246, 'Departamento 246');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (247, 'Departamento 247');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (248, 'Departamento 248');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (249, 'Departamento 249');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (250, 'Departamento 250');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (251, 'Departamento 251');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (252, 'Departamento 252');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (253, 'Departamento 253');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (254, 'Departamento 254');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (255, 'Departamento 255');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (256, 'Departamento 256');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (257, 'Departamento 257');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (258, 'Departamento 258');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (259, 'Departamento 259');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (260, 'Departamento 260');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (261, 'Departamento 261');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (262, 'Departamento 262');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (263, 'Departamento 263');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (264, 'Departamento 264');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (265, 'Departamento 265');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (266, 'Departamento 266');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (267, 'Departamento 267');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (268, 'Departamento 268');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (269, 'Departamento 269');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (270, 'Departamento 270');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (271, 'Departamento 271');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (272, 'Departamento 272');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (273, 'Departamento 273');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (274, 'Departamento 274');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (275, 'Departamento 275');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (276, 'Departamento 276');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (277, 'Departamento 277');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (278, 'Departamento 278');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (279, 'Departamento 279');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (280, 'Departamento 280');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (281, 'Departamento 281');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (282, 'Departamento 282');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (283, 'Departamento 283');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (284, 'Departamento 284');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (285, 'Departamento 285');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (286, 'Departamento 286');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (287, 'Departamento 287');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (288, 'Departamento 288');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (289, 'Departamento 289');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (290, 'Departamento 290');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (291, 'Departamento 291');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (292, 'Departamento 292');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (293, 'Departamento 293');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (294, 'Departamento 294');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (295, 'Departamento 295');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (296, 'Departamento 296');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (297, 'Departamento 297');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (298, 'Departamento 298');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (299, 'Departamento 299');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (300, 'Departamento 300');
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (101, 'Gabriel', 'Leal', '2000-12-21', 257);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (102, 'Marcelino', 'Téllez', '2001-11-09', 183);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (103, 'Berta', 'Trujillo', '1994-09-16', 206);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (104, 'Alex', 'Palacio', '1997-06-13', 147);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (105, 'Alondra', 'Amores', '2000-06-24', 87);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (106, 'Lorenzo', 'Robledo', '1995-02-19', 292);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (107, 'Genoveva', 'Calvo', '1996-04-09', 255);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (108, 'Glauco', 'Vicente', '2000-12-04', 36);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (109, 'Ángela', 'Arjona', '2000-08-09', 77);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (110, 'Hilda', 'Saez', '2002-12-20', 131);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (111, 'Óscar', 'Almazán', '2001-12-30', 104);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (112, 'Ezequiel', 'Pou', '2004-09-23', 195);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (113, 'Violeta', 'Romero', '2006-12-13', 52);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (114, 'Maristela', 'Quirós', '2000-07-09', 44);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (115, 'Adoración', 'Tudela', '2004-06-22', 51);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (116, 'Claudia', 'Marcos', '2006-09-15', 128);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (117, 'Melania', 'Catalá', '1998-05-23', 160);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (118, 'Samanta', 'Calleja', '2002-04-07', 64);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (119, 'Abril', 'Ros', '1997-05-04', 283);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (120, 'Genoveva', 'Ramón', '1998-07-15', 228);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (121, 'Melisa', 'Vicens', '1999-01-15', 95);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (122, 'Luis', 'Carranza', '1998-04-24', 86);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (123, 'Lara', 'Palau', '1997-11-05', 210);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (124, 'Saturnino', 'Mateos', '1999-08-16', 277);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (125, 'Juan Luis', 'Terrón', '1998-03-08', 155);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (126, 'Dafne', 'Zurita', '2004-09-16', 97);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (127, 'Aurora', 'Mulet', '2000-07-28', 204);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (128, 'Íngrid', 'Salmerón', '1998-08-03', 236);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (129, 'Marcial', 'Olmedo', '2000-10-29', 93);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (130, 'Crescencia', 'Boada', '1996-11-22', 8);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (131, 'Arturo', 'Campos', '2005-04-15', 185);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (132, 'Rómulo', 'Martín', '2002-12-05', 73);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (133, 'Bibiana', 'Castelló', '2003-09-10', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (134, 'Lucio', 'Marí', '1995-12-08', 44);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (135, 'Juan José', 'Torrens', '1996-01-09', 149);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (136, 'Jacobo', 'Gallardo', '2003-05-21', 230);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (137, 'Gabino', 'Sans', '2001-10-20', 213);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (138, 'Charo', 'Ortuño', '2003-03-10', 153);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (139, 'Cleto', 'Antúnez', '2000-11-28', 150);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (140, 'Priscila', 'Salazar', '2006-01-29', 201);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (141, 'Aura', 'Delgado', '1996-08-14', 203);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (142, 'Mamen', 'Tur', '1994-05-30', 46);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (143, 'Bartolomé', 'Castilla', '1996-04-19', 163);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (144, 'Alexandra', 'Sainz', '2006-06-10', 275);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (145, 'Fortunata', 'Peláez', '2004-01-11', 51);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (146, 'Abril', 'Canals', '2003-10-29', 241);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (147, 'Gabriel', 'Galván', '2002-07-11', 133);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (148, 'Aurelio', 'Macias', '2005-01-08', 121);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (149, 'Eusebio', 'Ochoa', '2000-08-11', 88);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (150, 'Leire', 'Palomar', '2002-12-04', 22);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (151, 'Olga', 'Río', '2003-05-28', 28);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (152, 'Fidela', 'Catalá', '1996-06-27', 13);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (153, 'Montserrat', 'Mateo', '2000-06-19', 217);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (154, 'Dan', 'Dominguez', '2004-01-19', 233);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (155, 'Ramiro', 'Uría', '1996-02-24', 151);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (156, 'Maristela', 'Rivas', '2006-12-17', 155);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (157, 'África', 'Amat', '2000-12-18', 40);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (158, 'Jose', 'Raya', '2004-04-17', 151);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (159, 'Ruperto', 'Bayona', '2004-12-16', 53);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (160, 'Damián', 'Chamorro', '1998-11-06', 203);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (161, 'Aarón', 'Roma', '1996-09-23', 116);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (162, 'Rolando', 'Álvaro', '2002-10-04', 140);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (163, 'Aitana', 'Carrión', '2000-09-26', 195);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (164, 'Espiridión', 'Márquez', '1998-12-27', 19);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (165, 'Nadia', 'Alemán', '1994-08-02', 217);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (166, 'Aura', 'Ayllón', '2002-02-12', 123);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (167, 'Lola', 'Alba', '1994-06-18', 74);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (168, 'Florencia', 'Bayón', '1995-10-06', 52);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (169, 'Inés', 'Oliveras', '1994-04-25', 43);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (170, 'Alba', 'Manrique', '1997-03-19', 36);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (171, 'Mayte', 'Amigó', '1999-05-07', 119);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (172, 'Félix', 'Valentín', '1998-10-08', 273);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (173, 'Conrado', 'Monreal', '1998-04-23', 247);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (174, 'Flavio', 'Calderón', '1995-12-17', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (175, 'Domitila', 'Galan', '2000-07-28', 129);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (176, 'Leonardo', 'Gallo', '2000-01-08', 20);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (177, 'Anastasia', 'Royo', '1997-12-17', 244);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (178, 'Jose', 'Doménech', '2000-03-08', 212);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (179, 'José Ángel', 'Maestre', '1999-08-18', 44);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (180, 'Marta', 'Tamayo', '2005-10-20', 61);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (181, 'Candela', 'Polo', '2000-07-01', 44);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (182, 'Jovita', 'Escudero', '1995-04-30', 268);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (183, 'Jessica', 'Almansa', '2004-06-23', 215);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (184, 'Lorenza', 'Amigó', '2001-10-25', 54);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (185, 'Rubén', 'Díez', '1999-03-16', 56);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (186, 'Encarnacion', 'Lumbreras', '2001-08-06', 230);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (187, 'Malena', 'Cerdán', '2007-02-03', 18);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (188, 'Mar', 'Balaguer', '1999-04-04', 280);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (189, 'Rodolfo', 'Parra', '2001-01-02', 132);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (190, 'Berta', 'Almazán', '1996-04-07', 156);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (191, 'Edelmiro', 'Pomares', '1999-06-15', 236);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (192, 'José Ángel', 'Arnau', '2007-03-31', 16);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (193, 'Jesús', 'Alonso', '1996-03-24', 149);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (194, 'Salud', 'Gonzalez', '2004-08-12', 82);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (195, 'Gonzalo', 'Puerta', '2006-11-13', 65);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (196, 'Elpidio', 'Cabañas', '1994-07-09', 252);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (197, 'Jose Francisco', 'Sarabia', '2004-12-14', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (198, 'Eustaquio', 'Priego', '1998-11-16', 234);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (199, 'Luna', 'Vara', '2005-01-01', 227);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (200, 'Ceferino', 'Asenjo', '1999-10-17', 33);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (201, 'Rosa', 'Iriarte', '1996-07-23', 97);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (202, 'Benigna', 'Valcárcel', '2006-07-11', 209);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (203, 'Bartolomé', 'Benítez', '2004-12-08', 108);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (204, 'Olga', 'Sastre', '1994-10-12', 214);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (205, 'Rafaela', 'Agudo', '2004-05-01', 72);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (206, 'Amalia', 'Morata', '1994-05-21', 157);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (207, 'Guiomar', 'Leiva', '1999-07-31', 55);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (208, 'Casemiro', 'Velasco', '1996-03-07', 177);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (209, 'América', 'Fiol', '2005-07-09', 138);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (210, 'Zoraida', 'Serna', '2003-07-23', 91);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (211, 'Alberto', 'Araujo', '2003-01-12', 231);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (212, 'Octavio', 'Camino', '2001-10-23', 158);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (213, 'Moreno', 'Vicens', '2000-09-08', 45);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (214, 'Jose Antonio', 'Rivero', '2006-03-01', 144);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (215, 'Leonardo', 'Mínguez', '2005-12-18', 192);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (216, 'Pánfilo', 'Trillo', '2004-11-06', 238);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (217, 'Leyre', 'Cantero', '1996-07-11', 144);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (218, 'Pelayo', 'Guzman', '1995-10-18', 213);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (219, 'Rodolfo', 'Campos', '1999-09-12', 107);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (220, 'Amparo', 'Saura', '2007-02-12', 192);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (221, 'Isaura', 'Guijarro', '2000-04-23', 286);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (222, 'Hernando', 'Oller', '2003-02-01', 103);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (223, 'Jose Carlos', 'Fernandez', '1998-04-25', 223);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (224, 'Chus', 'Valentín', '2001-05-20', 221);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (225, 'Juan Bautista', 'Noriega', '1997-05-11', 131);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (226, 'Concha', 'Montoya', '2002-03-16', 77);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (227, 'Cosme', 'Alcántara', '1997-11-25', 65);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (228, 'Alejandro', 'Alegria', '1998-06-22', 197);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (229, 'Felipa', 'Larrea', '2005-09-17', 130);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (230, 'Gonzalo', 'Merino', '1995-12-07', 38);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (231, 'Rómulo', 'Ferrera', '1998-01-24', 271);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (232, 'Rogelio', 'Manjón', '1996-10-15', 13);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (233, 'Rafael', 'Larrea', '1995-08-21', 266);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (234, 'Óscar', 'Oller', '1998-08-30', 133);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (235, 'Juanito', 'Redondo', '1999-06-17', 291);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (236, 'Marisol', 'Larrañaga', '2005-05-07', 191);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (237, 'Ainoa', 'Saldaña', '2004-03-10', 293);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (238, 'Lilia', 'Cuevas', '2005-05-26', 191);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (239, 'Juliana', 'Salcedo', '2001-02-19', 60);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (240, 'Encarnita', 'Pavón', '1996-03-27', 40);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (241, 'Herberto', 'Requena', '2001-01-24', 216);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (242, 'Amado', 'Garmendia', '1996-01-01', 49);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (243, 'Gabriel', 'Frías', '2004-09-01', 136);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (244, 'Andrés Felipe', 'Juárez', '2002-07-20', 252);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (245, 'Agustín', 'Bellido', '1998-04-21', 273);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (246, 'Dora', 'Rovira', '2005-05-12', 57);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (247, 'Concha', 'Barral', '2006-02-23', 84);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (248, 'Adriana', 'Guitart', '1998-12-13', 67);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (249, 'Fernando', 'Sainz', '2004-08-31', 94);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (250, 'Luciano', 'Rovira', '2005-10-13', 254);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (251, 'Mateo', 'Ordóñez', '1999-09-21', 297);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (252, 'Alejandra', 'Ortiz', '2005-03-23', 60);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (253, 'Dionisio', 'Yuste', '2001-07-13', 58);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (254, 'Leocadia', 'Mir', '1999-05-18', 225);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (255, 'Nicanor', 'Tenorio', '1998-03-12', 135);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (256, 'Rosa', 'Rebollo', '1995-10-19', 13);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (257, 'María Del Carmen', 'Perales', '2006-04-04', 58);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (258, 'Victorino', 'Bejarano', '2001-12-22', 95);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (259, 'Manuel', 'Aller', '2001-12-14', 124);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (260, 'Patricio', 'Galán', '2007-01-10', 113);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (261, 'Moreno', 'Gelabert', '1997-10-10', 38);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (262, 'Calisto', 'Romero', '1999-10-01', 215);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (263, 'Emilio', 'Arellano', '2003-05-24', 33);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (264, 'Marco', 'Barrera', '2001-10-09', 140);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (265, 'Che', 'Morillo', '1997-07-31', 117);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (266, 'Abril', 'Garriga', '2004-03-20', 78);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (267, 'Melania', 'Espinosa', '1995-12-22', 50);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (268, 'Jenny', 'Madrid', '2006-08-19', 188);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (269, 'Adora', 'Valero', '2001-09-09', 291);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (270, 'Cecilio', 'Varela', '1999-02-08', 231);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (271, 'Javiera', 'Núñez', '2001-07-25', 238);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (272, 'Matilde', 'Castell', '1995-02-20', 70);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (273, 'Feliciana', 'Casal', '1998-02-05', 144);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (274, 'Humberto', 'Medina', '2004-10-12', 141);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (275, 'Jordán', 'Sanz', '2001-08-16', 57);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (276, 'Emigdio', 'Bermudez', '1995-07-01', 177);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (277, 'Basilio', 'Rozas', '2002-11-04', 279);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (278, 'Azucena', 'Pellicer', '1997-01-04', 44);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (279, 'María Jesús', 'Villar', '2003-02-24', 100);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (280, 'Chita', 'Vigil', '2007-03-30', 239);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (281, 'Tecla', 'Jiménez', '1994-07-07', 125);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (282, 'Cesar', 'Jódar', '1998-11-21', 270);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (283, 'Maximiano', 'Rubio', '1999-12-12', 184);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (284, 'Candelas', 'Gonzalez', '1996-01-24', 41);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (285, 'Mariana', 'Alemán', '1998-04-24', 8);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (286, 'Primitivo', 'Olmo', '2005-03-04', 286);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (287, 'Marcio', 'Aguado', '1997-01-15', 220);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (288, 'Íñigo', 'Mariscal', '2004-09-21', 150);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (289, 'Natividad', 'Amo', '2005-09-18', 132);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (290, 'Luis Miguel', 'Miralles', '2003-01-29', 43);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (291, 'Quirino', 'Cerezo', '1996-11-25', 161);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (292, 'Elvira', 'Manzanares', '1996-04-01', 273);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (293, 'Zacarías', 'Lorenzo', '2003-07-06', 73);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (294, 'Vanesa', 'Iñiguez', '2006-01-10', 163);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (295, 'Teo', 'Fábregas', '2000-04-09', 86);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (296, 'Herminia', 'Bonilla', '2000-11-07', 196);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (297, 'José Antonio', 'Landa', '1997-11-11', 247);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (298, 'Toribio', 'Ripoll', '2001-12-20', 185);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (299, 'Sonia', 'Villegas', '1998-09-23', 36);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, DepartamentoID) VALUES (300, 'Ángeles', 'Gallart', '1997-07-15', 12);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (101, 'Amanda', 'Merino', 182);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (102, 'Carina', 'Pagès', 153);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (103, 'Ernesto', 'Niño', 239);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (104, 'Modesto', 'Rivero', 99);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (105, 'Inmaculada', 'Izquierdo', 146);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (106, 'Mateo', 'Morcillo', 65);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (107, 'Carmen', 'Cañas', 12);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (108, 'Irene', 'Peña', 124);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (109, 'Nieves', 'Redondo', 184);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (110, 'Evaristo', 'Cornejo', 103);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (111, 'Pancho', 'Vilalta', 143);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (112, 'Amado', 'Rueda', 93);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (113, 'Sandalio', 'Losada', 154);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (114, 'Genoveva', 'Menéndez', 212);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (115, 'Marcelo', 'Cortés', 226);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (116, 'Hermenegildo', 'Coello', 246);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (117, 'Pío', 'Garcés', 273);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (118, 'Febe', 'León', 166);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (119, 'Bautista', 'Lozano', 84);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (120, 'Ismael', 'Vendrell', 218);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (121, 'Jordana', 'Mur', 130);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (122, 'Silvestre', 'Velasco', 268);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (123, 'Elisa', 'Calatayud', 279);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (124, 'Maximiliano', 'Atienza', 82);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (125, 'Íñigo', 'Recio', 115);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (126, 'Jacinta', 'Diaz', 107);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (127, 'Brunilda', 'Arjona', 42);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (128, 'Aitana', 'Ayuso', 19);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (129, 'Sosimo', 'Peralta', 91);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (130, 'Moisés', 'Borrás', 201);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (131, 'Adalberto', 'Sosa', 37);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (132, 'Rosa María', 'Carlos', 186);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (133, 'Isaías', 'Morcillo', 102);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (134, 'Yolanda', 'Agustí', 195);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (135, 'Brígida', 'Morera', 184);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (136, 'Dorita', 'Carrión', 108);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (137, 'Ruth', 'Landa', 75);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (138, 'Segismundo', 'Quintanilla', 244);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (139, 'Morena', 'Sotelo', 286);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (140, 'Clementina', 'Aznar', 295);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (141, 'Roberta', 'Escamilla', 47);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (142, 'Aitor', 'Porras', 141);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (143, 'Leonardo', 'Silva', 180);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (144, 'Nadia', 'Acosta', 268);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (145, 'María Carmen', 'Paniagua', 131);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (146, 'Aurora', 'Bauzà', 248);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (147, 'Heriberto', 'Zabaleta', 284);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (148, 'Anunciación', 'Chico', 92);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (149, 'Sancho', 'Alvarez', 74);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (150, 'Wilfredo', 'Company', 184);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (151, 'Pili', 'Nicolás', 10);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (152, 'Francisco Javier', 'Valero', 122);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (153, 'Marina', 'Cazorla', 174);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (154, 'Juan Manuel', 'Egea', 84);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (155, 'Danilo', 'Giménez', 121);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (156, 'Herberto', 'Fuertes', 192);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (157, 'Macaria', 'Goñi', 110);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (158, 'Ileana', 'Guillen', 277);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (159, 'Nadia', 'Casanovas', 208);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (160, 'Carolina', 'Montesinos', 165);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (161, 'Venceslás', 'Cerro', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (162, 'Roberta', 'Quirós', 84);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (163, 'Trinidad', 'Pinto', 262);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (164, 'Sara', 'Gámez', 95);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (165, 'Paco', 'Pizarro', 224);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (166, 'Pía', 'Rubio', 138);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (167, 'Efraín', 'Francisco', 298);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (168, 'Alfonso', 'Casanovas', 101);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (169, 'Agustín', 'Carranza', 93);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (170, 'Ruperto', 'Pi', 84);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (171, 'Ricardo', 'Villaverde', 270);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (172, 'Mireia', 'Agustí', 291);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (173, 'Ernesto', 'Gimeno', 65);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (174, 'Lupe', 'Real', 68);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (175, 'Íngrid', 'Juliá', 54);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (176, 'Pepita', 'Gonzalez', 280);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (177, 'Francisco', 'Ferrera', 29);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (178, 'Plinio', 'Morales', 246);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (179, 'Eli', 'Falcón', 289);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (180, 'Alondra', 'Bautista', 132);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (181, 'Reyes', 'Almeida', 209);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (182, 'Rodolfo', 'Cortes', 160);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (183, 'Elena', 'Nadal', 144);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (184, 'Roberto', 'Bastida', 195);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (185, 'Angelino', 'Donaire', 120);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (186, 'Heraclio', 'Alberto', 241);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (187, 'Amanda', 'Múñiz', 78);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (188, 'Jafet', 'Cuervo', 119);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (189, 'Victoria', 'Guardiola', 186);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (190, 'Josefa', 'Ropero', 277);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (191, 'Sosimo', 'Torrents', 168);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (192, 'Amor', 'Marin', 300);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (193, 'Marina', 'Francisco', 195);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (194, 'Luna', 'Prats', 187);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (195, 'Perla', 'Jimenez', 227);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (196, 'Amador', 'Lumbreras', 23);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (197, 'Cecilio', 'Ochoa', 209);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (198, 'Visitación', 'Pacheco', 85);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (199, 'Melania', 'Tovar', 270);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (200, 'Celestina', 'Pedrero', 196);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (201, 'Socorro', 'España', 138);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (202, 'Mohamed', 'Macias', 116);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (203, 'Águeda', 'Arregui', 133);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (204, 'Aroa', 'Cobos', 111);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (205, 'Emilio', 'Juárez', 20);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (206, 'Maristela', 'Ramírez', 286);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (207, 'Dolores', 'Company', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (208, 'Curro', 'Ramos', 80);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (209, 'Humberto', 'Cañete', 283);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (210, 'Olalla', 'Bilbao', 208);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (211, 'Matilde', 'Giner', 60);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (212, 'Carlito', 'Ramírez', 151);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (213, 'Reyes', 'Rosa', 9);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (214, 'Andrés Felipe', 'Salamanca', 159);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (215, 'Leonel', 'Marin', 47);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (216, 'Bonifacio', 'Casares', 58);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (217, 'Hector', 'Pera', 89);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (218, 'Amor', 'Torrecilla', 90);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (219, 'Abraham', 'Vives', 263);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (220, 'Francisco Javier', 'Caballero', 248);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (221, 'Nadia', 'Barral', 138);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (222, 'Lucila', 'Folch', 268);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (223, 'Raúl', 'Larrañaga', 172);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (224, 'Ibán', 'Balaguer', 69);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (225, 'Trinidad', 'Diez', 171);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (226, 'Nieves', 'Campillo', 136);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (227, 'Ileana', 'Bejarano', 251);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (228, 'Natanael', 'Andrés', 8);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (229, 'Elodia', 'Miranda', 143);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (230, 'Octavio', 'Donaire', 216);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (231, 'Eutimio', 'Sevillano', 225);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (232, 'Narciso', 'Verdú', 35);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (233, 'Adalberto', 'Martorell', 254);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (234, 'Dionisio', 'Hoz', 259);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (235, 'Yaiza', 'Pizarro', 84);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (236, 'Rosaura', 'Rozas', 146);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (237, 'Concha', 'Roldan', 30);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (238, 'Benita', 'Redondo', 182);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (239, 'Ernesto', 'Salas', 107);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (240, 'Cirino', 'Zorrilla', 76);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (241, 'Nereida', 'Ibáñez', 167);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (242, 'Amelia', 'Gil', 100);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (243, 'Esther', 'Carnero', 163);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (244, 'Melania', 'Domingo', 170);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (245, 'Bernardo', 'Segarra', 200);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (246, 'Segismundo', 'Ferrán', 57);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (247, 'José Manuel', 'Vendrell', 256);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (248, 'Juan Bautista', 'Madrigal', 114);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (249, 'José Mari', 'Villa', 264);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (250, 'Carmelita', 'Marquez', 224);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (251, 'Nilda', 'Hernández', 255);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (252, 'Caridad', 'Sanchez', 118);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (253, 'Nacio', 'Hernando', 282);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (254, 'Humberto', 'Portillo', 131);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (255, 'Martirio', 'Bilbao', 115);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (256, 'Glauco', 'Taboada', 137);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (257, 'Albino', 'Beltrán', 128);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (258, 'Leocadia', 'Contreras', 113);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (259, 'Tania', 'Barberá', 228);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (260, 'Dionisia', 'Ros', 270);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (261, 'Nerea', 'Martínez', 133);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (262, 'Tadeo', 'Perea', 259);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (263, 'Martirio', 'López', 177);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (264, 'Lola', 'Paredes', 140);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (265, 'Toño', 'Guillen', 64);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (266, 'Cristina', 'Romeu', 47);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (267, 'Héctor', 'Murillo', 158);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (268, 'Ariel', 'Vives', 228);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (269, 'Maristela', 'Sedano', 238);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (270, 'Ruben', 'Garay', 55);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (271, 'Albert', 'Ballester', 244);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (272, 'Fausto', 'Urrutia', 67);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (273, 'Ramiro', 'Taboada', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (274, 'Melania', 'Castells', 202);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (275, 'Haydée', 'Pozuelo', 111);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (276, 'Lino', 'Luz', 15);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (277, 'Clementina', 'Ibáñez', 43);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (278, 'Hilda', 'Berenguer', 51);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (279, 'Marcela', 'Macias', 102);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (280, 'Rocío', 'Osorio', 119);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (281, 'Aitana', 'Cerezo', 66);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (282, 'Isidoro', 'Mur', 232);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (283, 'Edelmira', 'Páez', 292);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (284, 'Mamen', 'Olivé', 278);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (285, 'Lupita', 'Garcia', 64);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (286, 'Gertrudis', 'Villalobos', 154);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (287, 'Adelia', 'Mateo', 119);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (288, 'Primitiva', 'Torrents', 109);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (289, 'Abigaíl', 'Cal', 193);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (290, 'Nacio', 'Cabo', 223);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (291, 'Ramona', 'Mayoral', 42);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (292, 'Marina', 'Bauzà', 120);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (293, 'Ricarda', 'Artigas', 152);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (294, 'Marcia', 'Ortiz', 60);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (295, 'Teresa', 'Pallarès', 92);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (296, 'Fortunata', 'Nadal', 202);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (297, 'Silvio', 'Gras', 152);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (298, 'Norberto', 'Barrios', 188);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (299, 'Rosa', 'Sanmartín', 269);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, DepartamentoID) VALUES (300, 'Sofía', 'Ordóñez', 77);
INSERT INTO Curso (CursoID, Nombre) VALUES (101, 'Curso 101');
INSERT INTO Curso (CursoID, Nombre) VALUES (102, 'Curso 102');
INSERT INTO Curso (CursoID, Nombre) VALUES (103, 'Curso 103');
INSERT INTO Curso (CursoID, Nombre) VALUES (104, 'Curso 104');
INSERT INTO Curso (CursoID, Nombre) VALUES (105, 'Curso 105');
INSERT INTO Curso (CursoID, Nombre) VALUES (106, 'Curso 106');
INSERT INTO Curso (CursoID, Nombre) VALUES (107, 'Curso 107');
INSERT INTO Curso (CursoID, Nombre) VALUES (108, 'Curso 108');
INSERT INTO Curso (CursoID, Nombre) VALUES (109, 'Curso 109');
INSERT INTO Curso (CursoID, Nombre) VALUES (110, 'Curso 110');
INSERT INTO Curso (CursoID, Nombre) VALUES (111, 'Curso 111');
INSERT INTO Curso (CursoID, Nombre) VALUES (112, 'Curso 112');
INSERT INTO Curso (CursoID, Nombre) VALUES (113, 'Curso 113');
INSERT INTO Curso (CursoID, Nombre) VALUES (114, 'Curso 114');
INSERT INTO Curso (CursoID, Nombre) VALUES (115, 'Curso 115');
INSERT INTO Curso (CursoID, Nombre) VALUES (116, 'Curso 116');
INSERT INTO Curso (CursoID, Nombre) VALUES (117, 'Curso 117');
INSERT INTO Curso (CursoID, Nombre) VALUES (118, 'Curso 118');
INSERT INTO Curso (CursoID, Nombre) VALUES (119, 'Curso 119');
INSERT INTO Curso (CursoID, Nombre) VALUES (120, 'Curso 120');
INSERT INTO Curso (CursoID, Nombre) VALUES (121, 'Curso 121');
INSERT INTO Curso (CursoID, Nombre) VALUES (122, 'Curso 122');
INSERT INTO Curso (CursoID, Nombre) VALUES (123, 'Curso 123');
INSERT INTO Curso (CursoID, Nombre) VALUES (124, 'Curso 124');
INSERT INTO Curso (CursoID, Nombre) VALUES (125, 'Curso 125');
INSERT INTO Curso (CursoID, Nombre) VALUES (126, 'Curso 126');
INSERT INTO Curso (CursoID, Nombre) VALUES (127, 'Curso 127');
INSERT INTO Curso (CursoID, Nombre) VALUES (128, 'Curso 128');
INSERT INTO Curso (CursoID, Nombre) VALUES (129, 'Curso 129');
INSERT INTO Curso (CursoID, Nombre) VALUES (130, 'Curso 130');
INSERT INTO Curso (CursoID, Nombre) VALUES (131, 'Curso 131');
INSERT INTO Curso (CursoID, Nombre) VALUES (132, 'Curso 132');
INSERT INTO Curso (CursoID, Nombre) VALUES (133, 'Curso 133');
INSERT INTO Curso (CursoID, Nombre) VALUES (134, 'Curso 134');
INSERT INTO Curso (CursoID, Nombre) VALUES (135, 'Curso 135');
INSERT INTO Curso (CursoID, Nombre) VALUES (136, 'Curso 136');
INSERT INTO Curso (CursoID, Nombre) VALUES (137, 'Curso 137');
INSERT INTO Curso (CursoID, Nombre) VALUES (138, 'Curso 138');
INSERT INTO Curso (CursoID, Nombre) VALUES (139, 'Curso 139');
INSERT INTO Curso (CursoID, Nombre) VALUES (140, 'Curso 140');
INSERT INTO Curso (CursoID, Nombre) VALUES (141, 'Curso 141');
INSERT INTO Curso (CursoID, Nombre) VALUES (142, 'Curso 142');
INSERT INTO Curso (CursoID, Nombre) VALUES (143, 'Curso 143');
INSERT INTO Curso (CursoID, Nombre) VALUES (144, 'Curso 144');
INSERT INTO Curso (CursoID, Nombre) VALUES (145, 'Curso 145');
INSERT INTO Curso (CursoID, Nombre) VALUES (146, 'Curso 146');
INSERT INTO Curso (CursoID, Nombre) VALUES (147, 'Curso 147');
INSERT INTO Curso (CursoID, Nombre) VALUES (148, 'Curso 148');
INSERT INTO Curso (CursoID, Nombre) VALUES (149, 'Curso 149');
INSERT INTO Curso (CursoID, Nombre) VALUES (150, 'Curso 150');
INSERT INTO Curso (CursoID, Nombre) VALUES (151, 'Curso 151');
INSERT INTO Curso (CursoID, Nombre) VALUES (152, 'Curso 152');
INSERT INTO Curso (CursoID, Nombre) VALUES (153, 'Curso 153');
INSERT INTO Curso (CursoID, Nombre) VALUES (154, 'Curso 154');
INSERT INTO Curso (CursoID, Nombre) VALUES (155, 'Curso 155');
INSERT INTO Curso (CursoID, Nombre) VALUES (156, 'Curso 156');
INSERT INTO Curso (CursoID, Nombre) VALUES (157, 'Curso 157');
INSERT INTO Curso (CursoID, Nombre) VALUES (158, 'Curso 158');
INSERT INTO Curso (CursoID, Nombre) VALUES (159, 'Curso 159');
INSERT INTO Curso (CursoID, Nombre) VALUES (160, 'Curso 160');
INSERT INTO Curso (CursoID, Nombre) VALUES (161, 'Curso 161');
INSERT INTO Curso (CursoID, Nombre) VALUES (162, 'Curso 162');
INSERT INTO Curso (CursoID, Nombre) VALUES (163, 'Curso 163');
INSERT INTO Curso (CursoID, Nombre) VALUES (164, 'Curso 164');
INSERT INTO Curso (CursoID, Nombre) VALUES (165, 'Curso 165');
INSERT INTO Curso (CursoID, Nombre) VALUES (166, 'Curso 166');
INSERT INTO Curso (CursoID, Nombre) VALUES (167, 'Curso 167');
INSERT INTO Curso (CursoID, Nombre) VALUES (168, 'Curso 168');
INSERT INTO Curso (CursoID, Nombre) VALUES (169, 'Curso 169');
INSERT INTO Curso (CursoID, Nombre) VALUES (170, 'Curso 170');
INSERT INTO Curso (CursoID, Nombre) VALUES (171, 'Curso 171');
INSERT INTO Curso (CursoID, Nombre) VALUES (172, 'Curso 172');
INSERT INTO Curso (CursoID, Nombre) VALUES (173, 'Curso 173');
INSERT INTO Curso (CursoID, Nombre) VALUES (174, 'Curso 174');
INSERT INTO Curso (CursoID, Nombre) VALUES (175, 'Curso 175');
INSERT INTO Curso (CursoID, Nombre) VALUES (176, 'Curso 176');
INSERT INTO Curso (CursoID, Nombre) VALUES (177, 'Curso 177');
INSERT INTO Curso (CursoID, Nombre) VALUES (178, 'Curso 178');
INSERT INTO Curso (CursoID, Nombre) VALUES (179, 'Curso 179');
INSERT INTO Curso (CursoID, Nombre) VALUES (180, 'Curso 180');
INSERT INTO Curso (CursoID, Nombre) VALUES (181, 'Curso 181');
INSERT INTO Curso (CursoID, Nombre) VALUES (182, 'Curso 182');
INSERT INTO Curso (CursoID, Nombre) VALUES (183, 'Curso 183');
INSERT INTO Curso (CursoID, Nombre) VALUES (184, 'Curso 184');
INSERT INTO Curso (CursoID, Nombre) VALUES (185, 'Curso 185');
INSERT INTO Curso (CursoID, Nombre) VALUES (186, 'Curso 186');
INSERT INTO Curso (CursoID, Nombre) VALUES (187, 'Curso 187');
INSERT INTO Curso (CursoID, Nombre) VALUES (188, 'Curso 188');
INSERT INTO Curso (CursoID, Nombre) VALUES (189, 'Curso 189');
INSERT INTO Curso (CursoID, Nombre) VALUES (190, 'Curso 190');
INSERT INTO Curso (CursoID, Nombre) VALUES (191, 'Curso 191');
INSERT INTO Curso (CursoID, Nombre) VALUES (192, 'Curso 192');
INSERT INTO Curso (CursoID, Nombre) VALUES (193, 'Curso 193');
INSERT INTO Curso (CursoID, Nombre) VALUES (194, 'Curso 194');
INSERT INTO Curso (CursoID, Nombre) VALUES (195, 'Curso 195');
INSERT INTO Curso (CursoID, Nombre) VALUES (196, 'Curso 196');
INSERT INTO Curso (CursoID, Nombre) VALUES (197, 'Curso 197');
INSERT INTO Curso (CursoID, Nombre) VALUES (198, 'Curso 198');
INSERT INTO Curso (CursoID, Nombre) VALUES (199, 'Curso 199');
INSERT INTO Curso (CursoID, Nombre) VALUES (200, 'Curso 200');
INSERT INTO Curso (CursoID, Nombre) VALUES (201, 'Curso 201');
INSERT INTO Curso (CursoID, Nombre) VALUES (202, 'Curso 202');
INSERT INTO Curso (CursoID, Nombre) VALUES (203, 'Curso 203');
INSERT INTO Curso (CursoID, Nombre) VALUES (204, 'Curso 204');
INSERT INTO Curso (CursoID, Nombre) VALUES (205, 'Curso 205');
INSERT INTO Curso (CursoID, Nombre) VALUES (206, 'Curso 206');
INSERT INTO Curso (CursoID, Nombre) VALUES (207, 'Curso 207');
INSERT INTO Curso (CursoID, Nombre) VALUES (208, 'Curso 208');
INSERT INTO Curso (CursoID, Nombre) VALUES (209, 'Curso 209');
INSERT INTO Curso (CursoID, Nombre) VALUES (210, 'Curso 210');
INSERT INTO Curso (CursoID, Nombre) VALUES (211, 'Curso 211');
INSERT INTO Curso (CursoID, Nombre) VALUES (212, 'Curso 212');
INSERT INTO Curso (CursoID, Nombre) VALUES (213, 'Curso 213');
INSERT INTO Curso (CursoID, Nombre) VALUES (214, 'Curso 214');
INSERT INTO Curso (CursoID, Nombre) VALUES (215, 'Curso 215');
INSERT INTO Curso (CursoID, Nombre) VALUES (216, 'Curso 216');
INSERT INTO Curso (CursoID, Nombre) VALUES (217, 'Curso 217');
INSERT INTO Curso (CursoID, Nombre) VALUES (218, 'Curso 218');
INSERT INTO Curso (CursoID, Nombre) VALUES (219, 'Curso 219');
INSERT INTO Curso (CursoID, Nombre) VALUES (220, 'Curso 220');
INSERT INTO Curso (CursoID, Nombre) VALUES (221, 'Curso 221');
INSERT INTO Curso (CursoID, Nombre) VALUES (222, 'Curso 222');
INSERT INTO Curso (CursoID, Nombre) VALUES (223, 'Curso 223');
INSERT INTO Curso (CursoID, Nombre) VALUES (224, 'Curso 224');
INSERT INTO Curso (CursoID, Nombre) VALUES (225, 'Curso 225');
INSERT INTO Curso (CursoID, Nombre) VALUES (226, 'Curso 226');
INSERT INTO Curso (CursoID, Nombre) VALUES (227, 'Curso 227');
INSERT INTO Curso (CursoID, Nombre) VALUES (228, 'Curso 228');
INSERT INTO Curso (CursoID, Nombre) VALUES (229, 'Curso 229');
INSERT INTO Curso (CursoID, Nombre) VALUES (230, 'Curso 230');
INSERT INTO Curso (CursoID, Nombre) VALUES (231, 'Curso 231');
INSERT INTO Curso (CursoID, Nombre) VALUES (232, 'Curso 232');
INSERT INTO Curso (CursoID, Nombre) VALUES (233, 'Curso 233');
INSERT INTO Curso (CursoID, Nombre) VALUES (234, 'Curso 234');
INSERT INTO Curso (CursoID, Nombre) VALUES (235, 'Curso 235');
INSERT INTO Curso (CursoID, Nombre) VALUES (236, 'Curso 236');
INSERT INTO Curso (CursoID, Nombre) VALUES (237, 'Curso 237');
INSERT INTO Curso (CursoID, Nombre) VALUES (238, 'Curso 238');
INSERT INTO Curso (CursoID, Nombre) VALUES (239, 'Curso 239');
INSERT INTO Curso (CursoID, Nombre) VALUES (240, 'Curso 240');
INSERT INTO Curso (CursoID, Nombre) VALUES (241, 'Curso 241');
INSERT INTO Curso (CursoID, Nombre) VALUES (242, 'Curso 242');
INSERT INTO Curso (CursoID, Nombre) VALUES (243, 'Curso 243');
INSERT INTO Curso (CursoID, Nombre) VALUES (244, 'Curso 244');
INSERT INTO Curso (CursoID, Nombre) VALUES (245, 'Curso 245');
INSERT INTO Curso (CursoID, Nombre) VALUES (246, 'Curso 246');
INSERT INTO Curso (CursoID, Nombre) VALUES (247, 'Curso 247');
INSERT INTO Curso (CursoID, Nombre) VALUES (248, 'Curso 248');
INSERT INTO Curso (CursoID, Nombre) VALUES (249, 'Curso 249');
INSERT INTO Curso (CursoID, Nombre) VALUES (250, 'Curso 250');
INSERT INTO Curso (CursoID, Nombre) VALUES (251, 'Curso 251');
INSERT INTO Curso (CursoID, Nombre) VALUES (252, 'Curso 252');
INSERT INTO Curso (CursoID, Nombre) VALUES (253, 'Curso 253');
INSERT INTO Curso (CursoID, Nombre) VALUES (254, 'Curso 254');
INSERT INTO Curso (CursoID, Nombre) VALUES (255, 'Curso 255');
INSERT INTO Curso (CursoID, Nombre) VALUES (256, 'Curso 256');
INSERT INTO Curso (CursoID, Nombre) VALUES (257, 'Curso 257');
INSERT INTO Curso (CursoID, Nombre) VALUES (258, 'Curso 258');
INSERT INTO Curso (CursoID, Nombre) VALUES (259, 'Curso 259');
INSERT INTO Curso (CursoID, Nombre) VALUES (260, 'Curso 260');
INSERT INTO Curso (CursoID, Nombre) VALUES (261, 'Curso 261');
INSERT INTO Curso (CursoID, Nombre) VALUES (262, 'Curso 262');
INSERT INTO Curso (CursoID, Nombre) VALUES (263, 'Curso 263');
INSERT INTO Curso (CursoID, Nombre) VALUES (264, 'Curso 264');
INSERT INTO Curso (CursoID, Nombre) VALUES (265, 'Curso 265');
INSERT INTO Curso (CursoID, Nombre) VALUES (266, 'Curso 266');
INSERT INTO Curso (CursoID, Nombre) VALUES (267, 'Curso 267');
INSERT INTO Curso (CursoID, Nombre) VALUES (268, 'Curso 268');
INSERT INTO Curso (CursoID, Nombre) VALUES (269, 'Curso 269');
INSERT INTO Curso (CursoID, Nombre) VALUES (270, 'Curso 270');
INSERT INTO Curso (CursoID, Nombre) VALUES (271, 'Curso 271');
INSERT INTO Curso (CursoID, Nombre) VALUES (272, 'Curso 272');
INSERT INTO Curso (CursoID, Nombre) VALUES (273, 'Curso 273');
INSERT INTO Curso (CursoID, Nombre) VALUES (274, 'Curso 274');
INSERT INTO Curso (CursoID, Nombre) VALUES (275, 'Curso 275');
INSERT INTO Curso (CursoID, Nombre) VALUES (276, 'Curso 276');
INSERT INTO Curso (CursoID, Nombre) VALUES (277, 'Curso 277');
INSERT INTO Curso (CursoID, Nombre) VALUES (278, 'Curso 278');
INSERT INTO Curso (CursoID, Nombre) VALUES (279, 'Curso 279');
INSERT INTO Curso (CursoID, Nombre) VALUES (280, 'Curso 280');
INSERT INTO Curso (CursoID, Nombre) VALUES (281, 'Curso 281');
INSERT INTO Curso (CursoID, Nombre) VALUES (282, 'Curso 282');
INSERT INTO Curso (CursoID, Nombre) VALUES (283, 'Curso 283');
INSERT INTO Curso (CursoID, Nombre) VALUES (284, 'Curso 284');
INSERT INTO Curso (CursoID, Nombre) VALUES (285, 'Curso 285');
INSERT INTO Curso (CursoID, Nombre) VALUES (286, 'Curso 286');
INSERT INTO Curso (CursoID, Nombre) VALUES (287, 'Curso 287');
INSERT INTO Curso (CursoID, Nombre) VALUES (288, 'Curso 288');
INSERT INTO Curso (CursoID, Nombre) VALUES (289, 'Curso 289');
INSERT INTO Curso (CursoID, Nombre) VALUES (290, 'Curso 290');
INSERT INTO Curso (CursoID, Nombre) VALUES (291, 'Curso 291');
INSERT INTO Curso (CursoID, Nombre) VALUES (292, 'Curso 292');
INSERT INTO Curso (CursoID, Nombre) VALUES (293, 'Curso 293');
INSERT INTO Curso (CursoID, Nombre) VALUES (294, 'Curso 294');
INSERT INTO Curso (CursoID, Nombre) VALUES (295, 'Curso 295');
INSERT INTO Curso (CursoID, Nombre) VALUES (296, 'Curso 296');
INSERT INTO Curso (CursoID, Nombre) VALUES (297, 'Curso 297');
INSERT INTO Curso (CursoID, Nombre) VALUES (298, 'Curso 298');
INSERT INTO Curso (CursoID, Nombre) VALUES (299, 'Curso 299');
INSERT INTO Curso (CursoID, Nombre) VALUES (300, 'Curso 300');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (101, 9, 119);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (102, 178, 139);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (103, 259, 192);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (104, 177, 23);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (105, 260, 111);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (106, 120, 212);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (107, 115, 130);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (108, 153, 56);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (109, 258, 125);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (110, 73, 153);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (111, 82, 285);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (112, 283, 206);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (113, 257, 243);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (114, 149, 162);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (115, 16, 183);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (116, 165, 256);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (117, 164, 80);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (118, 208, 51);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (119, 6, 206);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (120, 167, 282);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (121, 4, 83);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (122, 113, 271);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (123, 59, 16);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (124, 14, 135);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (125, 264, 293);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (126, 274, 243);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (127, 140, 240);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (128, 118, 299);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (129, 35, 74);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (130, 270, 297);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (131, 89, 161);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (132, 227, 146);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (133, 62, 55);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (134, 193, 163);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (135, 20, 60);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (136, 143, 260);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (137, 162, 265);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (138, 131, 133);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (139, 97, 33);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (140, 291, 177);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (141, 271, 150);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (142, 121, 64);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (143, 128, 294);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (144, 39, 67);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (145, 22, 64);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (146, 270, 77);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (147, 272, 38);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (148, 185, 134);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (149, 137, 245);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (150, 121, 295);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (151, 242, 205);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (152, 189, 85);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (153, 36, 25);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (154, 211, 48);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (155, 30, 242);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (156, 228, 225);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (157, 23, 288);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (158, 168, 186);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (159, 91, 288);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (160, 53, 158);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (161, 66, 60);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (162, 262, 220);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (163, 263, 248);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (164, 85, 193);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (165, 33, 151);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (166, 279, 165);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (167, 15, 28);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (168, 30, 288);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (169, 209, 270);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (170, 230, 218);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (171, 37, 81);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (172, 12, 132);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (173, 138, 255);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (174, 221, 133);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (175, 188, 8);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (176, 86, 129);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (177, 259, 58);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (178, 194, 206);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (179, 129, 232);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (180, 11, 42);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (181, 163, 292);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (182, 147, 126);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (183, 172, 70);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (184, 43, 41);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (185, 65, 247);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (186, 294, 165);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (187, 216, 105);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (188, 102, 127);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (189, 268, 26);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (190, 228, 175);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (191, 260, 137);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (192, 138, 95);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (193, 132, 194);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (194, 230, 44);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (195, 82, 244);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (196, 233, 284);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (197, 40, 169);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (198, 124, 20);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (199, 79, 71);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (200, 270, 201);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (201, 35, 175);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (202, 10, 192);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (203, 92, 148);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (204, 233, 133);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (205, 237, 171);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (206, 235, 228);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (207, 77, 63);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (208, 96, 23);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (209, 35, 284);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (210, 65, 184);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (211, 72, 251);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (212, 195, 226);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (213, 282, 109);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (214, 261, 157);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (215, 285, 203);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (216, 103, 268);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (217, 235, 108);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (218, 264, 31);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (219, 51, 83);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (220, 120, 220);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (221, 278, 173);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (222, 98, 269);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (223, 26, 134);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (224, 204, 22);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (225, 64, 106);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (226, 259, 117);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (227, 292, 139);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (228, 270, 58);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (229, 194, 295);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (230, 39, 106);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (231, 132, 16);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (232, 193, 268);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (233, 121, 23);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (234, 94, 160);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (235, 240, 268);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (236, 15, 143);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (237, 201, 124);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (238, 111, 41);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (239, 221, 267);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (240, 246, 120);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (241, 268, 96);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (242, 281, 54);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (243, 204, 51);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (244, 89, 47);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (245, 27, 1);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (246, 57, 298);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (247, 193, 94);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (248, 183, 38);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (249, 276, 17);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (250, 255, 122);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (251, 200, 266);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (252, 156, 12);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (253, 255, 283);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (254, 286, 249);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (255, 257, 123);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (256, 16, 129);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (257, 257, 21);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (258, 88, 210);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (259, 281, 221);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (260, 48, 107);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (261, 99, 165);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (262, 244, 186);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (263, 17, 266);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (264, 64, 234);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (265, 14, 110);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (266, 21, 183);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (267, 125, 129);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (268, 175, 15);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (269, 88, 157);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (270, 214, 73);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (271, 63, 85);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (272, 260, 179);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (273, 234, 47);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (274, 265, 145);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (275, 138, 89);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (276, 201, 267);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (277, 72, 61);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (278, 209, 117);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (279, 173, 131);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (280, 91, 155);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (281, 157, 47);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (282, 87, 199);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (283, 251, 202);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (284, 201, 122);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (285, 8, 134);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (286, 260, 64);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (287, 102, 214);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (288, 250, 254);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (289, 33, 54);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (290, 223, 161);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (291, 276, 219);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (292, 110, 132);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (293, 136, 266);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (294, 133, 279);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (295, 261, 60);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (296, 236, 150);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (297, 80, 114);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (298, 182, 187);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (299, 234, 165);
INSERT INTO Clase (ClaseID, CursoID, ProfesorID) VALUES (300, 221, 266);
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (101, 132, 267, '2023-07-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (102, 146, 139, '2024-02-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (103, 63, 295, '2025-01-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (104, 9, 169, '2024-08-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (105, 192, 215, '2024-07-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (106, 235, 37, '2024-06-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (107, 32, 40, '2023-05-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (108, 139, 88, '2023-11-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (109, 145, 66, '2024-06-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (110, 163, 101, '2023-12-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (111, 147, 34, '2024-10-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (112, 21, 32, '2023-06-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (113, 168, 51, '2023-09-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (114, 112, 258, '2023-10-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (115, 274, 33, '2023-08-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (116, 52, 50, '2023-08-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (117, 117, 19, '2023-06-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (118, 95, 272, '2023-06-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (119, 12, 271, '2024-10-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (120, 72, 93, '2023-11-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (121, 74, 170, '2025-02-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (122, 250, 158, '2023-09-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (123, 152, 116, '2023-10-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (124, 40, 285, '2024-04-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (125, 157, 16, '2023-10-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (126, 42, 228, '2024-03-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (127, 54, 257, '2023-11-05');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (128, 67, 92, '2023-08-05');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (129, 50, 297, '2024-03-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (130, 173, 170, '2023-06-20');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (131, 205, 44, '2024-11-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (132, 189, 183, '2024-01-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (133, 159, 63, '2024-08-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (134, 116, 252, '2023-12-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (135, 292, 108, '2024-12-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (136, 228, 161, '2024-06-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (137, 51, 291, '2024-05-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (138, 185, 195, '2023-06-05');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (139, 253, 187, '2023-08-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (140, 19, 175, '2025-03-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (141, 1, 236, '2023-10-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (142, 115, 265, '2024-05-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (143, 25, 142, '2024-07-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (144, 11, 25, '2025-02-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (145, 201, 85, '2023-10-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (146, 103, 3, '2024-02-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (147, 55, 207, '2024-12-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (148, 284, 242, '2024-03-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (149, 5, 5, '2024-06-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (150, 198, 291, '2023-06-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (151, 230, 249, '2024-11-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (152, 160, 213, '2024-08-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (153, 176, 105, '2023-12-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (154, 83, 187, '2023-05-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (155, 204, 202, '2023-08-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (156, 204, 277, '2025-03-18');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (157, 291, 260, '2024-01-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (158, 297, 90, '2024-02-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (159, 248, 211, '2023-05-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (160, 128, 95, '2023-09-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (161, 182, 37, '2024-05-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (162, 238, 12, '2023-05-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (163, 173, 299, '2024-03-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (164, 280, 151, '2023-05-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (165, 41, 12, '2023-08-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (166, 125, 71, '2024-08-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (167, 226, 130, '2024-04-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (168, 288, 275, '2025-04-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (169, 297, 227, '2024-01-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (170, 246, 195, '2023-06-05');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (171, 270, 147, '2024-01-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (172, 280, 60, '2023-09-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (173, 267, 86, '2023-12-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (174, 39, 89, '2025-02-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (175, 48, 61, '2024-12-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (176, 97, 277, '2025-03-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (177, 134, 188, '2024-08-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (178, 268, 175, '2024-09-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (179, 115, 63, '2024-05-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (180, 6, 52, '2024-01-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (181, 60, 258, '2025-03-18');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (182, 251, 54, '2023-05-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (183, 262, 92, '2025-03-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (184, 123, 203, '2024-12-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (185, 291, 225, '2025-04-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (186, 150, 129, '2024-08-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (187, 172, 247, '2024-05-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (188, 96, 199, '2024-03-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (189, 113, 5, '2024-01-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (190, 58, 275, '2025-04-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (191, 225, 280, '2024-10-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (192, 17, 77, '2023-09-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (193, 26, 179, '2024-09-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (194, 81, 228, '2023-10-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (195, 22, 5, '2024-07-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (196, 244, 90, '2025-04-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (197, 146, 193, '2023-06-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (198, 35, 143, '2024-04-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (199, 240, 65, '2024-01-20');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (200, 219, 140, '2023-10-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (201, 125, 24, '2024-07-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (202, 278, 21, '2023-05-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (203, 44, 39, '2023-07-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (204, 236, 106, '2024-08-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (205, 88, 93, '2023-09-13');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (206, 136, 260, '2023-12-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (207, 170, 291, '2023-05-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (208, 175, 149, '2023-12-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (209, 294, 167, '2024-04-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (210, 67, 132, '2024-08-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (211, 58, 195, '2024-05-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (212, 143, 38, '2023-12-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (213, 165, 248, '2025-01-05');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (214, 170, 104, '2023-12-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (215, 94, 30, '2024-09-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (216, 95, 238, '2023-08-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (217, 277, 227, '2023-07-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (218, 98, 193, '2024-11-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (219, 179, 63, '2025-01-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (220, 103, 167, '2024-06-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (221, 78, 252, '2023-09-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (222, 167, 174, '2023-09-13');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (223, 118, 148, '2024-04-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (224, 204, 234, '2024-10-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (225, 109, 150, '2024-09-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (226, 100, 86, '2023-05-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (227, 172, 44, '2024-05-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (228, 270, 91, '2024-10-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (229, 137, 168, '2023-12-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (230, 36, 25, '2024-07-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (231, 219, 109, '2024-05-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (232, 142, 70, '2023-09-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (233, 232, 149, '2023-07-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (234, 75, 139, '2024-06-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (235, 33, 286, '2024-07-13');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (236, 288, 58, '2024-08-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (237, 122, 133, '2024-04-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (238, 89, 55, '2024-02-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (239, 204, 285, '2023-05-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (240, 123, 288, '2023-09-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (241, 276, 15, '2025-02-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (242, 117, 103, '2023-07-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (243, 235, 240, '2024-02-20');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (244, 5, 76, '2023-07-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (245, 136, 300, '2024-08-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (246, 35, 3, '2023-12-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (247, 35, 40, '2024-01-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (248, 231, 118, '2024-01-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (249, 166, 77, '2024-12-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (250, 125, 158, '2023-09-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (251, 291, 296, '2023-09-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (252, 56, 126, '2024-11-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (253, 192, 155, '2025-01-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (254, 159, 229, '2023-12-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (255, 43, 58, '2023-07-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (256, 8, 299, '2025-02-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (257, 76, 226, '2023-05-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (258, 244, 197, '2025-01-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (259, 150, 195, '2024-05-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (260, 86, 51, '2024-12-13');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (261, 85, 273, '2024-07-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (262, 165, 43, '2024-03-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (263, 234, 267, '2023-08-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (264, 17, 168, '2024-09-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (265, 263, 102, '2024-10-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (266, 191, 234, '2023-09-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (267, 115, 184, '2023-06-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (268, 224, 242, '2024-11-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (269, 190, 126, '2025-01-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (270, 66, 179, '2024-02-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (271, 109, 206, '2023-12-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (272, 19, 24, '2024-09-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (273, 259, 206, '2025-02-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (274, 182, 298, '2024-02-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (275, 213, 250, '2024-05-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (276, 234, 245, '2023-07-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (277, 232, 32, '2025-03-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (278, 81, 157, '2024-02-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (279, 192, 258, '2024-10-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (280, 25, 188, '2023-08-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (281, 53, 7, '2024-09-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (282, 286, 13, '2024-06-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (283, 11, 188, '2024-06-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (284, 187, 244, '2023-05-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (285, 17, 273, '2024-09-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (286, 47, 246, '2024-06-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (287, 92, 45, '2024-01-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (288, 189, 290, '2023-12-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (289, 82, 188, '2025-01-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (290, 5, 18, '2025-03-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (291, 113, 25, '2024-06-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (292, 248, 213, '2024-08-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (293, 33, 137, '2023-07-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (294, 144, 111, '2024-01-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (295, 174, 33, '2024-12-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (296, 74, 60, '2024-06-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (297, 68, 145, '2024-03-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (298, 133, 13, '2024-12-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (299, 218, 146, '2024-01-05');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (300, 208, 89, '2024-09-09');
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (101, 24, 96.11);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (102, 106, 78.78);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (103, 98, 71.72);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (104, 291, 72.91);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (105, 16, 82.27);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (106, 92, 78.25);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (107, 157, 89.48);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (108, 232, 93.02);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (109, 58, 95.51);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (110, 17, 96.8);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (111, 71, 72.33);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (112, 135, 92.29);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (113, 2, 90.18);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (114, 19, 70.66);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (115, 198, 66.96);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (116, 21, 83.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (117, 138, 60.03);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (118, 28, 66.73);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (119, 135, 85.3);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (120, 76, 68.57);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (121, 17, 64.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (122, 238, 88.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (123, 17, 80.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (124, 273, 86.53);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (125, 86, 70.83);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (126, 122, 69.36);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (127, 282, 92.64);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (128, 188, 98.97);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (129, 184, 76.2);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (130, 227, 60.21);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (131, 141, 97.26);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (132, 111, 94.63);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (133, 271, 80.3);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (134, 215, 92.04);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (135, 110, 69.91);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (136, 157, 62.59);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (137, 172, 60.28);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (138, 227, 95.78);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (139, 143, 70.94);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (140, 153, 69.43);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (141, 221, 75.81);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (142, 64, 60.42);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (143, 14, 97.5);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (144, 242, 71.86);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (145, 158, 75.29);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (146, 106, 82.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (147, 35, 66.37);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (148, 156, 93.63);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (149, 88, 74.0);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (150, 290, 88.47);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (151, 115, 77.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (152, 127, 62.56);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (153, 115, 64.42);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (154, 87, 71.77);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (155, 279, 90.71);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (156, 107, 71.99);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (157, 215, 69.47);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (158, 136, 73.33);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (159, 200, 95.32);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (160, 186, 96.57);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (161, 271, 70.98);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (162, 57, 71.15);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (163, 247, 90.53);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (164, 270, 60.15);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (165, 117, 96.94);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (166, 163, 68.24);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (167, 267, 62.41);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (168, 147, 78.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (169, 136, 78.71);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (170, 47, 63.11);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (171, 141, 99.12);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (172, 120, 92.21);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (173, 291, 73.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (174, 7, 72.34);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (175, 36, 77.0);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (176, 65, 89.53);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (177, 122, 84.26);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (178, 181, 98.99);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (179, 135, 90.44);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (180, 227, 80.62);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (181, 190, 78.41);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (182, 254, 76.36);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (183, 211, 62.41);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (184, 181, 91.23);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (185, 165, 91.85);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (186, 91, 94.11);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (187, 209, 69.79);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (188, 177, 98.73);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (189, 65, 91.04);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (190, 23, 88.18);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (191, 116, 86.83);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (192, 50, 99.38);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (193, 293, 83.26);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (194, 298, 99.12);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (195, 19, 89.28);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (196, 37, 71.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (197, 147, 96.95);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (198, 96, 80.15);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (199, 165, 87.71);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (200, 194, 98.85);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (201, 212, 67.34);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (202, 295, 71.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (203, 70, 63.28);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (204, 67, 93.3);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (205, 240, 93.2);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (206, 54, 97.14);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (207, 63, 67.77);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (208, 69, 70.68);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (209, 88, 67.78);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (210, 200, 78.17);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (211, 60, 96.07);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (212, 43, 90.66);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (213, 151, 83.7);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (214, 297, 69.65);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (215, 92, 83.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (216, 19, 96.27);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (217, 96, 62.26);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (218, 198, 70.71);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (219, 208, 93.8);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (220, 125, 92.55);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (221, 40, 94.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (222, 120, 78.16);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (223, 235, 68.96);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (224, 169, 65.89);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (225, 214, 84.79);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (226, 70, 83.34);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (227, 18, 71.58);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (228, 61, 87.3);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (229, 178, 74.55);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (230, 125, 60.09);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (231, 113, 87.5);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (232, 135, 64.62);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (233, 53, 92.01);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (234, 151, 85.74);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (235, 74, 92.87);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (236, 224, 67.69);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (237, 142, 88.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (238, 40, 60.26);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (239, 62, 78.99);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (240, 239, 83.73);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (241, 256, 63.21);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (242, 113, 89.29);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (243, 99, 80.83);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (244, 168, 93.02);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (245, 156, 97.65);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (246, 271, 79.17);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (247, 171, 63.4);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (248, 1, 80.27);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (249, 52, 64.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (250, 15, 91.0);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (251, 212, 90.66);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (252, 125, 79.83);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (253, 277, 82.06);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (254, 71, 61.58);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (255, 292, 70.76);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (256, 58, 89.4);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (257, 242, 66.03);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (258, 76, 89.62);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (259, 270, 62.59);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (260, 258, 73.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (261, 21, 75.36);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (262, 62, 76.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (263, 242, 68.27);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (264, 84, 89.64);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (265, 191, 77.55);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (266, 119, 86.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (267, 166, 90.87);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (268, 3, 65.75);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (269, 204, 93.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (270, 224, 70.22);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (271, 195, 63.79);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (272, 103, 79.13);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (273, 211, 71.89);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (274, 132, 73.69);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (275, 231, 65.14);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (276, 96, 81.93);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (277, 159, 69.74);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (278, 228, 99.59);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (279, 150, 66.6);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (280, 233, 91.26);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (281, 91, 68.59);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (282, 259, 99.45);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (283, 118, 64.73);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (284, 13, 94.28);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (285, 255, 95.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (286, 54, 78.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (287, 26, 95.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (288, 16, 62.84);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (289, 134, 62.0);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (290, 174, 94.5);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (291, 139, 65.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (292, 56, 98.44);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (293, 63, 77.28);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (294, 29, 82.55);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (295, 256, 70.29);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (296, 223, 75.7);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (297, 1, 88.66);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (298, 18, 91.48);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (299, 220, 74.93);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (300, 81, 84.64);


-- 1. 🔍 Seleccionar todos los estudiantes
SELECT * FROM Estudiante;
-- 2. 🔍 Listar solo los nombres y apellidos
SELECT Nombre, Apellido FROM Estudiante;
-- 3. 🔍 Filtrar estudiantes de un departamento
SELECT * FROM Estudiante
WHERE DepartamentoID = 1;
-- 4. 🔍 Ordenar estudiantes por fecha de nacimiento (más viejos primero)
SELECT * FROM Estudiante
ORDER BY FechaNacimiento ASC;
-- 5. 🔍 Contar cuántos estudiantes hay
SELECT COUNT(*) AS TotalEstudiantes FROM Estudiante;
-- 6. 🔍 Buscar estudiantes con apellido 'García'
SELECT * FROM Estudiante
WHERE Apellido = 'García';
-- 7. 🔍 Buscar por patrón (nombres que empiezan con 'A')
SELECT * FROM Estudiante
WHERE Nombre LIKE 'A%';

-- 8. 🔗 Join: Mostrar nombre del estudiante y el nombre del departamento
SELECT E.Nombre, E.Apellido, D.Nombre AS Departamento
FROM Estudiante E
JOIN Departamento D ON E.DepartamentoID = D.DepartamentoID;

-- 9. 📊 Promedio de calificaciones por estudiante
SELECT E.Nombre, E.Apellido, AVG(C.Nota) AS Promedio
FROM Calificacion C
JOIN Inscripcion I ON C.InscripcionID = I.InscripcionID
JOIN Estudiante E ON I.EstudianteID = E.EstudianteID
GROUP BY E.EstudianteID;

-- 10. 📊 Cantidad de estudiantes por departamento
SELECT D.Nombre AS Departamento, COUNT(E.EstudianteID) AS TotalEstudiantes
FROM Estudiante E
JOIN Departamento D ON E.DepartamentoID = D.DepartamentoID
GROUP BY D.Nombre;
-- 11. 📊 Cursos impartidos por cada profesor

SELECT P.Nombre, P.Apellido, COUNT(DISTINCT C.ClaseID) AS TotalClases
FROM Profesor P
JOIN Clase C ON P.ProfesorID = C.ProfesorID
GROUP BY P.ProfesorID;

--  12. 🕵️‍♂️ Estudiantes con promedio mayor a 90
SELECT E.Nombre, E.Apellido, AVG(C.Nota) AS Promedio
FROM Estudiante E
JOIN Inscripcion I ON E.EstudianteID = I.EstudianteID
JOIN Calificacion C ON I.InscripcionID = C.InscripcionID
GROUP BY E.EstudianteID
HAVING AVG(C.Nota) > 90;

-- Top 5 estudiantes con mejores promedios


SELECT E.Nombre, E.Apellido, AVG(C.Nota) AS Promedio
FROM Estudiante E
JOIN Inscripcion I ON E.EstudianteID = I.EstudianteID
JOIN Calificacion C ON I.InscripcionID = C.InscripcionID
GROUP BY E.EstudianteID
ORDER BY Promedio DESC
LIMIT 5;



-- Scrip para general datos
USE universidad2;

-- Deshabilitar verificaciones temporales para mejor rendimiento
SET FOREIGN_KEY_CHECKS = 0;
SET UNIQUE_CHECKS = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

-- 1. Departamentos (10 departamentos realistas)
INSERT INTO Departamento (Nombre) VALUES
('Ciencias de la Computación'),
('Matemáticas'),
('Física'),
('Química'),
('Literatura'),
('Historia'),
('Economía'),
('Biología'),
('Ingeniería Civil'),
('Psicología');

-- 2. Procedimiento para insertar 500 estudiantes
DELIMITER $$
CREATE PROCEDURE InsertarEstudiantes()
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < 500 DO
        INSERT INTO Estudiante (Nombre, Apellido, FechaNacimiento, Email, DepartamentoID)
        VALUES (
            CONCAT('Estudiante', i+1),
            CONCAT('Apellido', FLOOR(RAND()*100)),
            DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*30 + 18) YEAR),
            CONCAT('estudiante', i+1, '@universidad.com'),
            FLOOR(RAND()*10) + 1
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL InsertarEstudiantes();
DROP PROCEDURE InsertarEstudiantes;

-- 3. Procedimiento para insertar 500 profesores
DELIMITER $$
CREATE PROCEDURE InsertarProfesores()
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < 500 DO
        INSERT INTO Profesor (Nombre, Apellido, Email, DepartamentoID)
        VALUES (
            CONCAT('Profesor', i+1),
            CONCAT('Apellido', FLOOR(RAND()*100)),
            CONCAT('profesor', i+1, '@universidad.com'),
            FLOOR(RAND()*10) + 1
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL InsertarProfesores();
DROP PROCEDURE InsertarProfesores;

-- 4. Procedimiento para insertar 500 cursos
DELIMITER $$
CREATE PROCEDURE InsertarCursos()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE departamentos INT;
    SELECT COUNT(*) INTO departamentos FROM Departamento;
    
    WHILE i < 500 DO
        INSERT INTO Curso (Nombre, Creditos, DepartamentoID)
        VALUES (
            CONCAT(
                ELT(FLOOR(RAND()*10)+1, 
                    'Introducción a ', 
                    'Avanzado ', 
                    'Fundamentos de ', 
                    'Teoría de ', 
                    'Laboratorio de ', 
                    'Seminario de ', 
                    'Taller de ', 
                    'Historia de ', 
                    'Aplicaciones de ', 
                    'Métodos Numéricos en '
                ),
                ELT(FLOOR(RAND()*10)+1, 
                'Programación', 'Matemáticas', 'Física', 'Química', 
                'Literatura', 'Economía', 'Biología', 'Ingeniería', 
                'Psicología', 'Historia'
            ),
            FLOOR(RAND()*6) + 1,
            FLOOR(RAND()*departamentos) + 1
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL InsertarCursos();
DROP PROCEDURE InsertarCursos;

-- 5. Procedimiento para insertar 500 clases
DELIMITER $$
CREATE PROCEDURE InsertarClases()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE max_cursos INT;
    DECLARE max_profesores INT;
    
    SELECT COUNT(*) INTO max_cursos FROM Curso;
    SELECT COUNT(*) INTO max_profesores FROM Profesor;
    
    WHILE i < 500 DO
        INSERT INTO Clase (CursoID, ProfesorID, Año, Semestre)
        VALUES (
            FLOOR(RAND()*max_cursos) + 1,
            FLOOR(RAND()*max_profesores) + 1,
            2020 + FLOOR(RAND()*4),
            ELT(FLOOR(RAND()*2)+1, 'Primavera', 'Otoño')
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL InsertarClases();
DROP PROCEDURE InsertarClases;

-- 6. Procedimiento para insertar 500 inscripciones
DELIMITER $$
CREATE PROCEDURE InsertarInscripciones()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE max_estudiantes INT;
    DECLARE max_clases INT;
    
    SELECT COUNT(*) INTO max_estudiantes FROM Estudiante;
    SELECT COUNT(*) INTO max_clases FROM Clase;
    
    WHILE i < 500 DO
        INSERT INTO Inscripcion (EstudianteID, ClaseID, FechaInscripcion)
        VALUES (
            FLOOR(RAND()*max_estudiantes) + 1,
            FLOOR(RAND()*max_clases) + 1,
            DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*365) DAY)
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL InsertarInscripciones();
DROP PROCEDURE InsertarInscripciones;

-- 7. Procedimiento para insertar 500 calificaciones
DELIMITER $$
CREATE PROCEDURE InsertarCalificaciones()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE max_inscripciones INT;
    SELECT COUNT(*) INTO max_inscripciones FROM Inscripcion;
    
    WHILE i < 500 DO
        INSERT INTO Calificacion (InscripcionID, Nota)
        VALUES (
            FLOOR(RAND()*max_inscripciones) + 1,
            ROUND(RAND()*10, 2)
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL InsertarCalificaciones();
DROP PROCEDURE InsertarCalificaciones;

-- Restaurar configuraciones
SET FOREIGN_KEY_CHECKS = 1;
SET UNIQUE_CHECKS = 1;

SELECT CONCAT(
    'SELECT * FROM ',
    TABLE_NAME,
    ' LIMIT 10;'
) AS Consultas
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'universidad';


SELECT * FROM departamento LIMIT 10;
SHOW TABLES;


-- Estudiantes con su departamento
SELECT e.Nombre, e.Apellido, d.Nombre AS Departamento
FROM Estudiante e
INNER JOIN Departamento d ON e.DepartamentoID = d.DepartamentoID
LIMIT 10;

-- Todos los estudiantes y sus inscripciones (si existen)
SELECT e.EstudianteID, e.Nombre, i.InscripcionID, i.FechaInscripcion
FROM Estudiante e
LEFT JOIN Inscripcion i ON e.EstudianteID = i.EstudianteID
LIMIT 10;

-- Departamentos que no tienen cursos asociados
SELECT d.Nombre AS Departamento, c.CursoID
FROM Curso c
RIGHT JOIN Departamento d ON c.DepartamentoID = d.DepartamentoID
WHERE c.CursoID IS NULL;


-- Combinar estudiantes y profesores (todos los registros)
SELECT Nombre, Apellido, 'Estudiante' AS Tipo FROM Estudiante
UNION ALL
SELECT Nombre, Apellido, 'Profesor' AS Tipo FROM Profesor
LIMIT 15;
DESCRIBE Departamento;