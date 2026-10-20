INSERT INTO Supplier
    (supplier_id, name, street, street_number, floor, door, city, postcode, country, phone, fax, tax_id)
VALUES
    (1, 'Distribucions Visuals', 'Carrer Major', '12', '1', 'A', 'Barcelona', '08001', 'Spain', '+34 930 111 101', '+34 930 111 102', 'B12345678'),
    (2, 'Ulleres del Nord', 'Avinguda del Port', '45', NULL, NULL, 'Girona', '17001', 'Spain', '+34 972 222 201', NULL, 'B23456789'),
    (3, 'Optica Internacional', 'Carrer Nou', '8', '2', 'B', 'Tarragona', '43001', 'Spain', '+34 977 333 301', '+34 977 333 302', 'B34567890'),
    (4, 'Montures Mediterranies', 'Rambla Nova', '103', '3', 'C', 'Lleida', '25001', 'Spain', '+34 973 444 401', NULL, 'B45678901'),
    (5, 'Visio Global', 'Carrer de la Industria', '27', 'Ground floor', NULL, 'Badalona', '08912', 'Spain', '+34 933 555 501', '+34 933 555 502', 'B56789012');


INSERT INTO Brand (brand_id, name, supplier_id)
VALUES
    (1, 'Claravista', 1),
    (2, 'Montseny', 1),
    (3, 'Solmar', 1),
    (4, 'Nordic Vision', 2),
    (5, 'Fjord', 2),
    (6, 'Llevant', 3),
    (7, 'Mediterrania', 3),
    (8, 'Tramuntana', 4),
    (9, 'Eixample', 4),
    (10, 'Urban Look', 5);


INSERT INTO Glasses
    (glasses_id, brand_id, frame_type, frame_colour,
     lens_1_prescription, lens_1_colour, lens_2_prescription, lens_2_colour, price)
VALUES
    (1,  1,  'acetate', 'Black',          -1.50, 'Clear',       -1.75, 'Clear',       89.90),
    (2,  1,  'metal',   'Gold',           -2.00, 'Clear',       -2.00, 'Clear',      119.50),
    (3,  2,  'rimless', 'Grey',            0.00, 'Clear',        0.00, 'Clear',      145.00),
    (4,  2,  'acetate', 'Red',            -0.75, 'Light blue',  -1.00, 'Light blue',  99.95),
    (5,  3,  'metal',   'Navy blue',      -3.00, 'Smoked',      -2.50, 'Smoked',     132.00),
    (6,  3,  'acetate', 'Tortoiseshell',   1.25, 'Clear',        1.50, 'Clear',      109.90),
    (7,  4,  'metal',   'Silver',         -1.00, 'Clear',       -1.25, 'Clear',      125.00),
    (8,  4,  'acetate', 'Green',          -2.25, 'Clear',       -2.00, 'Clear',      115.00),
    (9,  5,  'rimless', 'Black',           0.00, 'Smoked',       0.00, 'Smoked',     159.90),
    (10, 5,  'metal',   'Bronze',         -4.00, 'Clear',       -3.50, 'Clear',      149.00),
    (11, 6,  'acetate', 'Blue',            0.50, 'Clear',        0.75, 'Clear',       94.50),
    (12, 6,  'metal',   'Black',          -1.50, 'Clear',       -1.50, 'Clear',      128.00),
    (13, 7,  'rimless', 'Clear',           0.00, 'Green',        0.00, 'Green',      169.00),
    (14, 7,  'acetate', 'Pink',            2.00, 'Clear',        1.75, 'Clear',      112.00),
    (15, 8,  'metal',   'Grey',           -2.75, 'Clear',       -3.00, 'Clear',      139.90),
    (16, 8,  'acetate', 'Brown',           1.00, 'Clear',        1.25, 'Clear',      104.00),
    (17, 9,  'rimless', 'Silver',          0.00, 'Smoked',       0.00, 'Smoked',     155.00),
    (18, 9,  'acetate', 'Black',          -0.50, 'Clear',       -0.75, 'Clear',       98.00),
    (19, 10, 'metal',   'Gold',            3.00, 'Clear',        2.75, 'Clear',      142.00),
    (20, 10, 'acetate', 'Navy blue',      -1.25, 'Clear',       -1.00, 'Clear',      108.50);


-- Customers without an initial referrer.
INSERT INTO Customer
    (customer_id, referrer_customer_id, name, postal_address, phone, email, registration_date)
VALUES
    (1,  NULL, 'Marta Soler',     'Carrer de la Pau 10, Barcelona',          '+34 600 100 001', 'marta.soler@example.com',     '2025-01-10'),
    (2,  NULL, 'Pau Ferrer',      'Carrer del Bosc 22, Barcelona',           '+34 600 100 002', 'pau.ferrer@example.com',      '2025-02-14'),
    (3,  NULL, 'Laia Costa',      'Avinguda del Mar 5, Girona',              '+34 600 100 003', 'laia.costa@example.com',      '2025-03-02'),
    (4,  NULL, 'Arnau Vidal',     'Carrer Nou 31, Tarragona',                '+34 600 100 004', 'arnau.vidal@example.com',     '2025-04-18'),
    (5,  NULL, 'Nuria Roca',      'Plaça Vella 7, Girona',                   '+34 600 100 005', 'nuria.roca@example.com',      '2025-05-21'),
    (6,  NULL, 'Marc Puig',       'Carrer del Sol 19, Lleida',               '+34 600 100 006', 'marc.puig@example.com',       '2025-06-12'),
    (7,  NULL, 'Clara Martí',     'Carrer Major 44, Barcelona',              '+34 600 100 007', 'clara.marti@example.com',     '2025-07-09'),
    (8,  NULL, 'Biel Riera',      'Avinguda Catalunya 18, Badalona',         '+34 600 100 008', 'biel.riera@example.com',      '2025-08-03'),
    (9,  NULL, 'Aina Soler',      'Carrer de la Font 3, Girona',             '+34 600 100 009', 'aina.soler@example.com',      '2025-08-28'),
    (10, NULL, 'Jan Navarro',     'Carrer del Mar 52, Tarragona',            '+34 600 100 010', 'jan.navarro@example.com',     '2025-09-15'),
    (11, NULL, 'Eva Casas',       'Rambla Nova 8, Lleida',                   '+34 600 100 011', 'eva.casas@example.com',       '2025-10-07'),
    (12, NULL, 'Pol Serra',       'Carrer de la Riera 14, Badalona',         '+34 600 100 012', 'pol.serra@example.com',       '2025-10-29'),
    (13, NULL, 'Iris Vidal',      'Carrer del Pont 6, Barcelona',            '+34 600 100 013', 'iris.vidal@example.com',      '2025-11-11'),
    (14, NULL, 'Oriol Font',      'Avinguda del Parc 25, Girona',            '+34 600 100 014', 'oriol.font@example.com',      '2025-11-25'),
    (15, NULL, 'Judit Pons',      'Carrer de l Esglesia 9, Tarragona',       '+34 600 100 015', 'judit.pons@example.com',      '2025-12-04'),
    (16, NULL, 'Eric Soler',      'Carrer del Pi 17, Lleida',                '+34 600 100 016', 'eric.soler@example.com',       '2026-01-16'),
    (17, NULL, 'Noa Ferrer',      'Carrer de la Marina 11, Badalona',        '+34 600 100 017', 'noa.ferrer@example.com',      '2026-02-08'),
    (18, NULL, 'Guillem Costa',   'Plaça Catalunya 2, Barcelona',            '+34 600 100 018', 'guillem.costa@example.com',   '2026-02-22'),
    (19, NULL, 'Marina Roca',     'Carrer de les Flors 30, Girona',           '+34 600 100 019', 'marina.roca@example.com',     '2026-03-10'),
    (20, NULL, 'Adria Puig',      'Avinguda del Riu 16, Tarragona',          '+34 600 100 020', 'adria.puig@example.com',      '2026-03-27');

-- Referral relationships between registered customers.
UPDATE Customer SET referrer_customer_id = 1 WHERE customer_id IN (2, 3, 6, 9);
UPDATE Customer SET referrer_customer_id = 2 WHERE customer_id IN (4, 7, 10);
UPDATE Customer SET referrer_customer_id = 3 WHERE customer_id IN (5, 8, 11, 12);
UPDATE Customer SET referrer_customer_id = 7 WHERE customer_id IN (13, 14);
UPDATE Customer SET referrer_customer_id = 10 WHERE customer_id IN (15, 16);
UPDATE Customer SET referrer_customer_id = 18 WHERE customer_id IN (19, 20);


INSERT INTO Employee (employee_id, name)
VALUES
    (1, 'Joan Pons'),
    (2, 'Clara Martí'),
    (3, 'Biel Riera'),
    (4, 'Nora Soler'),
    (5, 'Pere Costa'),
    (6, 'Anna Vidal');


INSERT INTO Sale (sale_id, customer_id, sale_date)
VALUES
    (1,  1,  '2026-01-05'),
    (2,  2,  '2026-01-12'),
    (3,  3,  '2026-01-19'),
    (4,  4,  '2026-01-25'),
    (5,  5,  '2026-02-02'),
    (6,  6,  '2026-02-08'),
    (7,  7,  '2026-02-14'),
    (8,  8,  '2026-02-20'),
    (9,  9,  '2026-02-26'),
    (10, 10, '2026-03-03'),
    (11, 1,  '2026-03-09'),
    (12, 1,  '2026-03-15'),
    (13, 1, '2026-03-21'),
    (14, 1, '2026-03-27'),
    (15, 13, '2026-04-02'),
    (16, 14, '2026-04-08'),
    (17, 15, '2026-04-14'),
    (18, 1, '2026-04-20'),
    (19, 18, '2026-04-26'),
    (20, 20, '2026-05-02'),
    (21, 2,  '2026-05-08'),
    (22, 5,  '2026-05-14'),
    (23, 7,  '2026-05-20'),
    (24, 10, '2026-05-26'),
    (25, 17, '2026-06-01');


INSERT INTO SaleLine
    (sale_line_id, sale_id, glasses_id, employee_id, quantity, unit_price_eur)
VALUES
    (1,  1,  1, 1, 1,  89.90),
    (2,  1,  3, 2, 1, 145.00),
    (3,  2,  2, 2, 1, 119.50),
    (4,  2,  6, 1, 1, 109.90),
    (5,  3,  5, 3, 1, 132.00),
    (6,  4,  4, 4, 1,  99.95),
    (7,  4,  8, 4, 1, 115.00),
    (8,  5,  7, 5, 1, 125.00),
    (9,  6,  9, 1, 1, 159.90),
    (10, 6, 10, 2, 1, 149.00),
    (11, 7, 11, 3, 1,  94.50),
    (12, 7, 12, 3, 1, 128.00),
    (13, 8, 13, 6, 1, 169.00),
    (14, 9, 14, 2, 1, 112.00),
    (15, 9, 18, 1, 1,  98.00),
    (16, 10, 15, 4, 1, 139.90),
    (17, 11, 1, 5, 2,  89.90),
    (18, 12, 16, 6, 1, 104.00),
    (19, 12, 17, 6, 1, 155.00),
    (20, 13, 19, 1, 1, 142.00),
    (21, 14, 20, 2, 1, 108.50),
    (22, 14, 3, 2, 1, 145.00),
    (23, 15, 2, 3, 1, 119.50),
    (24, 16, 5, 4, 1, 132.00),
    (25, 17, 6, 5, 1, 109.90),
    (26, 18, 8, 6, 1, 115.00),
    (27, 18, 9, 6, 1, 159.90),
    (28, 19, 10, 1, 1, 149.00),
    (29, 19, 11, 2, 1,  94.50),
    (30, 20, 12, 3, 1, 128.00),
    (31, 20, 13, 4, 1, 169.00),
    (32, 21, 14, 5, 1, 112.00),
    (33, 21, 15, 5, 1, 139.90),
    (34, 22, 16, 6, 1, 104.00),
    (35, 23, 17, 1, 1, 155.00),
    (36, 23, 18, 1, 1,  98.00),
    (37, 24, 19, 2, 1, 142.00),
    (38, 24, 20, 3, 1, 108.50),
    (39, 25, 1, 4, 1,  89.90),
    (40, 25, 4, 4, 1,  99.95);


-- QUERIES
-- Llista el total de factures d'un client/a en un període determinat.
select count(*) as total_invoices
from Sale
where customer_id = 1
  and sale_date >= '2026-03-01'
  and sale_date <= '2026-03-31';


-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
select distinct employee.name as employee, brand.name as model
from SaleLine as sale_line
    join Employee as employee on employee.employee_id = sale_line.employee_id
    join Sale as sale on sale.sale_id = sale_line.sale_id
    join Glasses as glasses on glasses.glasses_id = sale_line.glasses_id
    join Brand as brand on brand.brand_id = glasses.brand_id
where sale.sale_date >= '2026-01-01'
  and sale.sale_date < '2027-01-01'
  and employee.name = 'Anna Vidal'
order by employee.name, brand.name asc;


-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
select distinct supplier.supplier_id, supplier.name as supplier
from Supplier as supplier
    join Brand as brand on brand.supplier_id = supplier.supplier_id
    join Glasses as glasses on glasses.brand_id = brand.brand_id
    join SaleLine as sale_line on sale_line.glasses_id = glasses.glasses_id
    join Sale as sale on sale.sale_id = sale_line.sale_id
order by supplier.name asc;
