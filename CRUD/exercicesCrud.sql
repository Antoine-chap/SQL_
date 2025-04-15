--Récupérer la liste des voyages avec leurs détails (prix, hébergement, transport).

SELECT pays,ville,prix_destination,etablissements,prix_hebergement,type_transport,prix_transport FROM voyage
INNER JOIN hebergement ON voyage.id_hebergement = hebergement.id_hebergement
INNER JOIN voyage_transport ON voyage.id_voyage = voyage_transport.id_voyage
INNER JOIN transport ON transport.id_transport = voyage_transport.id_transport

--Afficher les réservations d'un client avec le statut du paiement.

SELECT nom,prenom,date_de_reservation,status FROM reservation
INNER JOIN client ON reservation.id_client = client.id_client

--Lister les moyens de transport disponibles pour une destination donnée.

SELECT pays,ville,type_transport FROM voyage
INNER JOIN voyage_transport ON voyage.id_voyage = voyage_transport.id_voyage
INNER JOIN transport ON transport.id_transport = voyage_transport.id_transport


--Consulter les informations d'une entreprise et ses services associés.

SELECT compagnie,type_transport FROM transport

--Modifier les informations d'un client (nom, prénom, etc.).

UPDATE client
SET nom = "lasap",
    prenom = "manu",
    email = "manu.lasap@example.com",
    telephone = "0475 123 456"
WHERE Id_client = 1;

--Mettre à jour le statut d'une réservation (confirmée, annulée, en attente).

UPDATE resevation
SET status = "en attente",
WHERE Id_reservation = 1;

--Changer les détails d'un voyage (prix, nombre de places disponibles).

UPDATE voyage
SET pays = "Russie",
	 ville = "Moscou",
	 place = "200",
	 prix_destination = "2500.00"
WHERE Id_voyage = 1;

--Supprimer une réservation (avec gestion des contraintes de suppression en cascade si nécessaire).

ALTER TABLE reservation
        DROP FOREIGN KEY `reservation_ibfk_1`;
        
ALTER TABLE reservation 
        DROP FOREIGN KEY `reservation_ibfk_2`;

ALTER TABLE reservation
        ADD CONSTRAINT bob
        FOREIGN KEY (id_client) REFERENCES Client(id_client)
        ON DELETE CASCADE;
        
ALTER TABLE reservation
        ADD CONSTRAINT bob1
        FOREIGN KEY (id_voyage) REFERENCES Voyage(id_voyage)
        ON DELETE CASCADE;

        
--Effacer un mode de paiement non utilisé.
--Retirez un transport qui n'est plus disponible.