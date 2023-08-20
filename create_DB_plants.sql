use master;
GO

DROP DATABASE IF EXISTS PlantsDB;
GO

CREATE DATABASE PlantsDB;
GO
USE PlantsDB;
GO

-- CREATE ZONES TABLE
CREATE TABLE Zones (
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Name VARCHAR(30) NOT NULL DEFAULT 'New Zone',
    RuntimeHours INT NOT NULL DEFAULT 0,
    RuntimeMinutes INT NOT NULL DEFAULT 0,
    RuntimesPerWeek INT NOT NULL DEFAULT 1
)

-- INSERT ZONES
INSERT Zones (Name, RuntimeHours, RuntimeMinutes, RuntimesPerWeek) VALUES ('Zone 1 - Back Yard Trees', 2, 30, 2);
INSERT Zones (Name, RuntimeHours, RuntimeMinutes, RuntimesPerWeek) VALUES ('Zone 2 - Back Yard Shrubs', 0, 25, 7);
INSERT Zones (Name, RuntimeHours, RuntimeMinutes, RuntimesPerWeek) VALUES ('Zone 3 - Front Yard Trees', 2, 30, 2);
INSERT Zones (Name, RuntimeHours, RuntimeMinutes, RuntimesPerWeek) VALUES ('Zone 4 - Front Yard Shrubs', 0, 25, 7);
GO

-- CREATE PLANTS TABLE
CREATE TABLE Plants (
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    -- PlantType 1 = Trees; 0 = Shrubs
    PlantType BIT NOT NULL DEFAULT 1,
    Name VARCHAR(30) NOT NULL,
    GalsPerWeek FLOAT NOT NULL,
    Quantity INT NOT NULL,
    EmittersPerPlant INT NOT NULL DEFAULT 1,
    EmitterGPH FLOAT NOT NULL,
    ZoneId INT NOT NULL REFERENCES Zones(Id)
);
GO

-- drop table plants

-- Insert plants for Zone 1 - Back Yard Trees
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Peach', 75, 2, 3, 5, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Plum', 75, 1, 3, 5, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Almond', 75, 1, 3, 5, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Cherry', 75, 1, 3, 5, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Nectarine', 75, 1, 3, 5, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Fig', 45, 2, 3, 3, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Citrus', 45, 5, 3, 3, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Apple', 45, 3, 3, 3, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Pomegranate', 30, 1, 3, 2, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Pine - Small', 20, 10, 2, 2, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Red Oak', 30, 2, 3, 2, 1);
GO

-- Insert plants for Zone 2 - Back Yard Shrubs
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Pineapple Guava', 12, 5, 2, 2, 2);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Goji Berry', 6, 4, 1, 2, 2);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Rosemary', 3, 2, 1, 1, 2);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Gardenia', 12, 2, 1, 4, 2);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Hibiscus', 6, 1, 1, 2, 2);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Rose', 6, 1, 1, 2, 2);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Texas Sage', 6, 1, 1, 2, 2);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Lantana', 6, 2, 1, 2, 2);
GO

-- Insert plants for Zone 3 - Front Yard Trees
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Pine - Large', 20, 6, 2, 2, 3);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Landscape Trees', 30, 4, 3, 2, 3);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Fig', 45, 3, 3, 3, 3);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Pomegranate', 30, 2, 3, 2, 3);
GO

-- Insert plants for Zone 4 - Front Yard Shrubs
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Boxwood', 6, 9, 1, 2, 4);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Rose', 6, 3, 1, 2, 4);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Lantana', 6, 1, 1, 2, 4);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Berries - Raised Bed', 12, 1, 4, 1, 4);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Mexican Petunia', 3, 2, 1, 1, 4);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Grape', 6, 3, 1, 2, 4);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Pink Lady', 6, 1, 1, 2, 4);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Golden Euonymus', 6, 2, 1, 2, 4);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Yellow Bell', 6, 2, 1, 2, 4);
GO