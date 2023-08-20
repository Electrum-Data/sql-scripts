use master;
GO

DROP DATABASE IF EXISTS PlantsDB;
GO

CREATE DATABASE PlantsDB;
GO
USE PlantsDB;
GO

CREATE TABLE Zones (
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Name VARCHAR(30) NOT NULL DEFAULT 'New Zone',
    RuntimeHours INT NOT NULL DEFAULT 0,
    RuntimeMinutes INT NOT NULL DEFAULT 0,
    RuntimesPerWeek INT NOT NULL DEFAULT 1
)

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

drop table plants

INSERT Zones (Name, RuntimeHours, RuntimeMinutes, RuntimesPerWeek) VALUES ('Zone 1 - Back Yard Trees', 2, 30, 2);
INSERT Zones (Name, RuntimeHours, RuntimeMinutes, RuntimesPerWeek) VALUES ('Zone 2 - Back Yard Shrubs', 0, 25, 7);
INSERT Zones (Name, RuntimeHours, RuntimeMinutes, RuntimesPerWeek) VALUES ('Zone 3 - Front Yard Trees', 2, 30, 2);
INSERT Zones (Name, RuntimeHours, RuntimeMinutes, RuntimesPerWeek) VALUES ('Zone 4 - Front Yard Shrubs', 0, 25, 7);
GO

INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Peach', 75.0, 2, 3, 5.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Plum', 75.0, 1, 3, 5.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Almond', 75.0, 1, 3, 5.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Cherry', 75.0, 1, 3, 5.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Nectarine', 75.0, 1, 3, 5.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Fig', 45.0, 2, 3, 3.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Citrus', 45.0, 5, 3, 3.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Apple', 45.0, 3, 3, 3.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Pomegranate', 30.0, 1, 3, 2.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Pine - Small', 20.0, 10, 2, 2.0, 1);
INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) VALUES (1, 'Red Oak', 30.0, 2, 3, 2.0, 1);
GO

