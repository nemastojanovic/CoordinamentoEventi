create database progettoEventi;
use progettoEventi; 

-- Struttura della tabella `utente`
CREATE TABLE `utente` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `accesso` enum('Amministratore','Ente') DEFAULT NULL,
  `password` binary(64) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Struttura della tabella `luogo`
CREATE TABLE `luogo` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CAP` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  'registrato' boolean DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Struttura della tabella `evento`
CREATE TABLE `evento` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `titolo`varchar(20) NOT NULL,
  `tipo`varchar(20) NOT NULL,
  `orarioInizio`datetime NOT NULL,
  `orarioFine`datetime,
  `osservazioni`varchar(50),
  `id_luogo` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


  -- Le foreign key
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_evento_utente` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_evento_luogo` FOREIGN KEY (`id_luogo`) REFERENCES `luogo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;