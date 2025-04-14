-- Insertions des données
-- 1. Guide
INSERT INTO Guide (nom, prenom, email, tel) VALUES
('Dupont', 'Jean', 'jean.dupont@gmail.com', '0612345678'),
('Martin', 'Sophie', 'sophie.martin@gmail.com', '0623456789'),
('Leroy', 'Michel', 'michel.leroy@gmail.com', '0634567890'),
('Garcia', 'Marie', 'marie.garcia@gmail.com', '0645678901'),
('Bernard', 'Pierre', 'pierre.bernard@gmail.com', '0656789012');

-- 2. Hebergement
INSERT INTO Hebergement (etablissements, categorie, prix_hebergement, id_guide) VALUES
('Hôtel Paradis', '5 étoiles', 250.00, 1),
('Villa Ocean', 'Villa', 350.00, 2),
('Résidence Les Pins', '4 étoiles', 180.00, 3),
('Hôtel du Port', '3 étoiles', 120.00, 4),
('Camping Les Dunes', 'Camping', 50.00, 5),
('Gîte Rural', 'Gîte', 95.00, 1),
('Auberge Montagne', 'Auberge', 75.00, 2);

-- 3. Transport
INSERT INTO Transport (type_transport, compagnie, place_dispo, prix_transport) VALUES
('Avion', 'Air France', 200, 350.00),
('Train', 'SNCF', 150, 120.00),
('Bus', 'FlixBus', 50, 45.00),
('Bateau', 'MSC Croisières', 500, 400.00),
('Avion', 'EasyJet', 180, 180.00),
('Train', 'Eurostar', 120, 150.00),
('Bus', 'Eurolines', 45, 40.00);

-- 4. Voyage
INSERT INTO Voyage (pays, ville, place, prix_destination, id_hebergement) VALUES
('France', 'Paris', 30, 450.00, 1),
('Espagne', 'Barcelone', 25, 380.00, 2),
('Italie', 'Rome', 20, 420.00, 3),
('Grèce', 'Athènes', 15, 390.00, 4),
('Portugal', 'Lisbonne', 18, 360.00, 5),
('Maroc', 'Marrakech', 22, 310.00, 6),
('Suisse', 'Genève', 12, 480.00, 7);

-- 5. Client
INSERT INTO Client (telephone, email, nom, prenom) VALUES
('0712345678', 'thomas.durand@gmail.com', 'Durand', 'Thomas'),
('0723456789', 'julie.petit@gmail.com', 'Petit', 'Julie'),
('0734567890', 'antoine.moreau@gmail.com', 'Moreau', 'Antoine'),
('0745678901', 'celine.dubois@gmail.com', 'Dubois', 'Céline'),
('0756789012', 'laurent.richard@gmail.com', 'Richard', 'Laurent'),
('0767890123', 'sophie.bertrand@gmail.com', 'Bertrand', 'Sophie'),
('0778901234', 'marc.simon@gmail.com', 'Simon', 'Marc');

-- 6. Reservation
INSERT INTO Reservation (status, date_de_reservation, prix_reservation, id_client, id_voyage) VALUES
('Confirmée', '2025-03-12', 1200.00, 1, 1),
('En attente', '2025-03-14', 950.00, 2, 2),
('Confirmée', '2025-03-15', 1100.00, 3, 3),
('Annulée', '2025-03-10', 980.00, 4, 4),
('Confirmée', '2025-03-18', 850.00, 5, 5),
('En attente', '2025-03-20', 780.00, 6, 6),
('Confirmée', '2025-03-22', 1300.00, 7, 7);

-- 7. Paiement
INSERT INTO Paiement (type_paiement, montant_payer, date_paiement, id_reservation) VALUES
('Carte', 1200.00, '2025-03-13', 1),
('Virement', 950.00, '2025-03-15', 2),
('Carte', 1100.00, '2025-03-16', 3),
('Espèces', 490.00, '2025-03-11', 4), -- Acompte sur réservation annulée
('Carte', 850.00, '2025-03-19', 5),
('Virement', 390.00, '2025-03-21', 6), -- Acompte (50%)
('Carte', 1300.00, '2025-03-23', 7);

-- 8. Voyage_transport
INSERT INTO Voyage_transport (id_voyage, id_transport) VALUES
(1, 1), -- Paris en avion Air France
(1, 2), -- Paris en train SNCF (option alternative)
(2, 5), -- Barcelone en avion EasyJet
(3, 1), -- Rome en avion Air France
(4, 4), -- Athènes en bateau
(5, 5), -- Lisbonne en avion EasyJet
(6, 7), -- Marrakech en bus Eurolines
(7, 6); -- Genève en train Eurostar