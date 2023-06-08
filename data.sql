INSERT INTO
    animals (
        id,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES (
        1,
        'Agumon',
        '2020-02-03',
        0,
        true,
        10.23
    ), (
        2,
        'Gabumon',
        '2018-11-15',
        2,
        true,
        8.00
    ), (
        3,
        'Pikachu',
        '2021-01-07',
        1,
        false,
        15.04
    ), (
        4,
        'Devimon',
        '2017-05-12',
        5,
        true,
        11.00
    );
    INSERT INTO
    animals (
        id,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )  
    VALUES(
        5,
        'Charmander',
        '2020-02-08',
        0,
        false,
        -11.00
    ),   (
        6,
        'Plantmon',
        '2021-11-15',
        2,
        true,
        -5.70
    ), (
        7,
        'Squirtle',
        '1993-04-02',
        3,
        false,
        -12.13
    ), (
        8,
        'Angemon',
        '2005-06-12',
        1,
        true,
        -45.00
    ),  (
        9,
        'Boarmon',
        '2005-06-07',
        7,
        true,
        20.40
    ),  (
        10,
        'Blossom',
        '1998-10-13',
        3,
        true,
        17.00
    ),  (
        11,
        'Ditto',
        '2022-05-14',
        4,
        true,
        22.00
    )
    ;

-- Insert the following data into the owners table:
-- Sam Smith 34 years old.
-- Jennifer Orwell 19 years old.
-- Bob 45 years old.
-- Melody Pond 77 years old.
-- Dean Winchester 14 years old.
-- Jodie Whittaker 38 years old.
INSERT INTO
    owners (
        full_name,
        age
    )
VALUES (
    'Sam Smith',
    34 
), (
    'Jennifer Orwell',
    19  
), (
    'Bob',
    45  
), (
    'Melody Pond',
    77  
), (
    'Dean Winchester',
    14  
), (
    'Jodie Whittaker',
    38  
);

-- Inserting data into the species table
INSERT INTO species
    (name)
VALUES
    ('Pokemon'),
    ('Digimon');

-- Update the species_id based on animal n
UPDATE animals
SET species_id = (
  CASE
    WHEN name LIKE '%mon' THEN (SELECT id
FROM species
WHERE name = 'Digimon')
    ELSE (SELECT id
FROM species
WHERE name = 'Pokemon')
  END
);

-- Update the owner_id based on owner's name
-- Sam Smith owns Agumon.
-- Jennifer Orwell owns Gabumon and Pikachu.
-- Bob owns Devimon and Plantmon.
-- Melody Pond owns Charmander, Squirtle, and Blossom.
-- Dean Winchester owns Angemon and Boarmon

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');


-- Insert the following data for vets:
-- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
-- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
-- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
-- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.

INSERT INTO
vets(
    name,
    age,
    date_of_graduation
)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

-- Insert the following data for specialties:
-- Vet William Tatcher is specialized in Pokemon.
-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
-- Vet Jack Harkness is specialized in Digimon.

INSERT INTO 
specializations(
  vet_id,
  species_id
)

VALUES 
((SELECT id FROM vets WHERE name = 'William Tatcher'),
(SELECT id FROM species WHERE name = 'Pokemon')
),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
(SELECT id FROM species WHERE name = 'Digimon')
),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
(SELECT id FROM species WHERE name = 'Pokemon')
),
((SELECT id FROM vets WHERE name = 'Jack Harkness'),
(SELECT id FROM species WHERE name = 'Digimon')
);

-- Insert the data for visits

Insert INTO
visits(
    animal_id,
    vet_id,
    visit_date
)

VALUES 
(
-- Agumon visited William Tatcher on May 24th, 2020.
((SELECT id from animals WHERE name = 'Agumon'),
(SELECT id from vets WHERE name = 'William Tatcher'),
DATE '2020-05-24'),

-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
((SELECT id from animals WHERE name = 'Agumon'),
(SELECT id from vets WHERE name = 'Stephanie Mendez'),
DATE '2020-07-22'),

-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
((SELECT id from animals WHERE name = 'Gabumon'),
(SELECT id from vets WHERE name = 'Jack Harkness'),
DATE '2021-02-02'),

-- Pikachu visited Maisy Smith on Jan 5th, 2020.
((SELECT id from animals WHERE name = 'Pikachu'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2020-01-05'),

-- Pikachu visited Maisy Smith on Mar 8th, 2020.
((SELECT id from animals WHERE name = 'Pikachu'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2020-03-08'),

-- Pikachu visited Maisy Smith on May 14th, 2020.
((SELECT id from animals WHERE name = 'Pikachu'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2020-05-14'),

-- Devimon visited Stephanie Mendez on May 4th, 2021.
((SELECT id from animals WHERE name = 'Devimon'),
(SELECT id from vets WHERE name = 'Stephanie Mendez'),
DATE '2021-05-04'),

-- Charmander visited Jack Harkness on Feb 24th, 2021.
((SELECT id from animals WHERE name = 'Charmander'),
(SELECT id from vets WHERE name = 'Jack Harkness'),
DATE '2021-02-24'),

-- Plantmon visited Maisy Smith on Dec 21st, 2019.
((SELECT id from animals WHERE name = 'Plantmon'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2019-12-21'),

-- Plantmon visited William Tatcher on Aug 10th, 2020.
((SELECT id from animals WHERE name = 'Plantmon'),
(SELECT id from vets WHERE name = 'William Tatcher'),
DATE '2020-08-10'),

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
((SELECT id from animals WHERE name = 'Plantmon'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2021-04-17'),

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
((SELECT id from animals WHERE name = 'Squirtle'),
(SELECT id from vets WHERE name = 'Stephanie Mendez'),
DATE '2019-09-29'),

-- Angemon visited Jack Harkness on Oct 3rd, 2020.
((SELECT id from animals WHERE name = 'Agumon'),
(SELECT id from vets WHERE name = 'Jack Harkness'),
DATE '2020-10-03'),

-- Angemon visited Jack Harkness on Nov 4th, 2020.
((SELECT id from animals WHERE name = 'Agumon'),
(SELECT id from vets WHERE name = 'Jack Harkness'),
DATE '2020-11-04'),

-- Boarmon visited Maisy Smith on Jan 24th, 2019.
((SELECT id from animals WHERE name = 'Boarmon'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2019-01-24'),

-- Boarmon visited Maisy Smith on May 15th, 2019.
((SELECT id from animals WHERE name = 'Boarmon'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2019-05-15'),

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
((SELECT id from animals WHERE name = 'Boarmon'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2020-02-27'),

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
((SELECT id from animals WHERE name = 'Boarmon'),
(SELECT id from vets WHERE name = 'Maisy Smith'),
DATE '2020-08-03'),

-- Blossom visited Stephanie Mendez on May 24th, 2020.
((SELECT id from animals WHERE name = 'Boarmon'),
(SELECT id from vets WHERE name = 'Stephanie Mendez'),
DATE '2020-05-24'),

-- Blossom visited William Tatcher on Jan 11th, 2021.
((SELECT id from animals WHERE name = 'Boarmon'),
(SELECT id from vets WHERE name = 'William Tatcher'),
DATE '2021-01-11')
);