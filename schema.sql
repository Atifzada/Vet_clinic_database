/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE
    animals(
        id INT PRIMARY KEY,
        name VARCHAR(250),
        date_of_birth DATE,
        escape_attempts INT,
        neutered BOOLEAN,
        weight_kg DECIMAL
    );

-- Adding a column species of type string to your animals

    ALTER TABLE animals
ADD species  varchar(250);

-- Create a table named owners as per requirment:
CREATE TABLE
    owners(
        id serial PRIMARY KEY,
        full_name VARCHAR(250),
        age INT
    );

-- Create a table named species as per requirment:

CREATE TABLE
    species(
        id serial PRIMARY KEY,
        name VARCHAR(250)  
    );

-- Modify animals table as per requirments:

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id),
ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- Create a table named vets as per the requirments:

CREATE TABLE 
vets(
    id serial PRIMARY KEY,
    name VARCHAR(250),
    age INT,
    date_of_graduation DATE
); 

-- Create a "join table" called specializations to handle this relationship.

CREATE TABLE 
specializations(
  vet_id INT REFERENCES vets (id),
  species_id INTEGER REFERENCES species (id),
  PRIMARY KEY (vet_id, species_id)
);

-- Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.

CREATE TABLE 
visits(
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    visit_date DATE,
    PRIMARY KEY (animal_id, vet_id,visit_date)
);