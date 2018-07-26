CREATE TABLE `AutorFicha` (
	`codigoAutor` INT NOT NULL AUTO_INCREMENT,
	`nombreAutor` varchar(30) NOT NULL,
	PRIMARY KEY (`codigoAutor`)
);

CREATE TABLE `Libro` (
	`codigoLibro` INT NOT NULL AUTO_INCREMENT,
	`titulo` varchar(100) NOT NULL,
	`ISBN` FLOAT NOT NULL,
	`editorial` varchar(20) NOT NULL UNIQUE,
	`numeroPaginas` INT NOT NULL,
	PRIMARY KEY (`codigoLibro`)
);

CREATE TABLE `Ejemplar` (
	`codigoEjemplar` INT NOT NULL AUTO_INCREMENT,
	`localizacion` varchar(30) NOT NULL,
	`codigoLibro` INT NOT NULL,
	PRIMARY KEY (`codigoEjemplar`)
);

CREATE TABLE `Usuario` (
	`codigoUsuario` INT NOT NULL,
	`nombre` varchar(30) NOT NULL,
	`direccion` varchar(30) NOT NULL,
	`telefono` INT NOT NULL,
	PRIMARY KEY (`codigoUsuario`)
);

CREATE TABLE `AutorFicha_Libro` (
	`codigoAutorFicha_AutorLibro` INT NOT NULL AUTO_INCREMENT,
	`codigoAutor` INT NOT NULL UNIQUE,
	`codigoLibro` INT NOT NULL,
	PRIMARY KEY (`codigoAutorFicha_AutorLibro`)
);

CREATE TABLE `Prestamo` (
	`codigoPrestamo` INT NOT NULL AUTO_INCREMENT,
	`codigoUsuario` INT NOT NULL,
	`fechaDevolucion` DATETIME NOT NULL,
	`fechaPrestamo` DATETIME NOT NULL,
	PRIMARY KEY (`codigoPrestamo`)
);

CREATE TABLE `Ejemplar_Prestamo` (
	`codigoEjemplar_Prestamo` INT NOT NULL AUTO_INCREMENT,
	`codigoEjemplar` INT NOT NULL,
	`codigoPrestamo` INT NOT NULL,
	PRIMARY KEY (`codigoEjemplar_Prestamo`)
);

ALTER TABLE `Ejemplar` ADD CONSTRAINT `Ejemplar_fk0` FOREIGN KEY (`codigoLibro`) REFERENCES `Libro`(`codigoLibro`);

ALTER TABLE `AutorFicha_Libro` ADD CONSTRAINT `AutorFicha_Libro_fk0` FOREIGN KEY (`codigoAutor`) REFERENCES `AutorFicha`(`codigoAutor`);

ALTER TABLE `AutorFicha_Libro` ADD CONSTRAINT `AutorFicha_Libro_fk1` FOREIGN KEY (`codigoLibro`) REFERENCES `Libro`(`codigoLibro`);

ALTER TABLE `Prestamo` ADD CONSTRAINT `Prestamo_fk0` FOREIGN KEY (`codigoUsuario`) REFERENCES `Usuario`(`codigoUsuario`);

ALTER TABLE `Ejemplar_Prestamo` ADD CONSTRAINT `Ejemplar_Prestamo_fk0` FOREIGN KEY (`codigoEjemplar`) REFERENCES `Ejemplar`(`codigoEjemplar`);

ALTER TABLE `Ejemplar_Prestamo` ADD CONSTRAINT `Ejemplar_Prestamo_fk1` FOREIGN KEY (`codigoPrestamo`) REFERENCES `Prestamo`(`codigoPrestamo`);

