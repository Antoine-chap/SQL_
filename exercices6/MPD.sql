CREATE TABLE `Guide ` (
  `id_guide` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  `prenom` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `tel` VARCHAR(15) NOT NULL
);

CREATE TABLE `Hebergement` (
  `id_transport` INT PRIMARY KEY AUTO_INCREMENT,
  `etablissements` VARCHAR(50) NOT NULL,
  `categorie` VARCHAR(50) NOT NULL,
  `prix_heberg` DECIMAL(8,2) NOT NULL CHECK (prix_hebergement >= 0),
  `id_guide` INT NOT NULL,
  FOREIGN KEY (id_guide) REFERENCES Guide(id_guide)
  );

CREATE TABLE `Transport` (
  `id_transport` INT PRIMARY KEY AUTO_INCREMENT,
  `type de transport` VARCHAR(50) NOT NULL,
  `compagnie` VARCHAR(50) NOT NULL,
  `place_dispo` INT NOT NULL,
  `prix_transport` DECIMAL(8,2) NOT NULL CHECK (prix_transport >= 0)
);

CREATE TABLE `Voyage` (
  `id_voyage` INT PRIMARY KEY AUTO_INCREMENT,
  `pays` VARCHAR(50) NOT NULL,
  `ville` VARCHAR(50) NOT NULL,
  `place` INT NOT NULL,
  `prix_destination` DECIMAL(8,2) NOT NULL CHECK (prix_destination >= 0),
  `id_hebergement` INT NOT NULL,
   FOREIGN KEY (id_hebergement) REFERENCES Voyage(id_voyage)
);

CREATE TABLE `Paiement` (
  `id_paiement` INT PRIMARY KEY AUTO_INCREMENT,
  `type_paiement` VARCHAR(50) NOT NULL CHECK (type_paiement IN ('Carte', 'Virement', 'Espèces')),
  `montant_payer` DECIMAL(8,2) NOT NULL CHECK (montant_payer >= 0),
  `date_paiement` DATE DEFAULT CURRENT_DATE,
  `id_reservation` INT NOT NULL,
   FOREIGN KEY (id_reservation) REFERENCES Paiement(id_paiement)
);

CREATE TABLE `Client` (
  `id_client` INT PRIMARY KEY AUTO_INCREMENT,
  `telephone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `nom` VARCHAR(50) NOT NULL,
  `prenom` VARCHAR(50) NOT NULL
);

CREATE TABLE `Reservation` (
  `id_reservation` INT PRIMARY KEY AUTO_INCREMENT,
  `status` VARCHAR(50) DEFAULT 'En attente',
  `date_de_reservation` DATE DEFAULT CURRENT_DATE,
  `prix_reservation` DECIMAL(8,2) NOT NULL CHECK (prix_reservation >= 0),
  `id_client` INT NOT NULL,
  `id_voyage` INT NOT NULL,
  FOREIGN KEY (id_client) REFERENCES Client(id_client),
  FOREIGN KEY (id_voyage) REFERENCES Voyage(id_voyage)
);

CREATE TABLE `Voyage_transport` (
  `id_voyage` INT NOT NULL,
  `id_transport` INT NOT NULL,
  PRIMARY KEY (`id_voyage`, `id_transport`),
  FOREIGN KEY (id_voyage) REFERENCES Transport(id_transport),
  FOREIGN KEY (id_transport) REFERENCES Voyage(id_voyage)
);

