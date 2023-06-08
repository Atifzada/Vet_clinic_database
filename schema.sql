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