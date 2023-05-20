CREATE TABLE Users (
    Id SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(50) NOT NULL,
    HomeAddress VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Role VARCHAR(20) DEFAULT 'nasabah',
    Active BOOLEAN DEFAULT TRUE,
    BirthDate DATE NOT NULL,
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModifiedOn TIMESTAMP,
    DeletedOn TIMESTAMP
);

ALTER TABLE Users
ADD CONSTRAINT CHK_Role CHECK (Role IN ('nasabah', 'staff', 'finance', 'it_dev', 'it_devops', 'audit', 'account_manager', 'human_capital', 'brand', 'procurement', 'user', 'none'));

CREATE TABLE UserDocs (
    Id INT PRIMARY KEY,
    UserId INT REFERENCES Users(Id),
    NIK VARCHAR(50),
    KKNumber VARCHAR(50),
    NPWPNumber VARCHAR(50),
    InputDate TIMESTAMP,
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DeletedOn TIMESTAMP,
    ModifiedOn TIMESTAMP,
    ConfirmedDate TIMESTAMP,
    Confirmed BOOLEAN,
    ConfirmedById INT REFERENCES Users(Id),
    KKLink VARCHAR(200),
    NIKLink VARCHAR(200),
    NPWPLink VARCHAR(200)
);

CREATE TABLE BranchOutlet (
    Id INT PRIMARY KEY,
    BranchOutletName VARCHAR(100) NOT NULL,
    BranchOutletAddress VARCHAR(200) NOT NULL,
    BranchOutletPhone VARCHAR(20) NOT NULL,
    BranchOutletNumber INT UNIQUE,
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DeletedOn TIMESTAMP,
    ModifiedOn TIMESTAMP,
    Active BOOLEAN
);

CREATE TABLE BranchOutlet_Users (
    Id INT PRIMARY KEY,
    BranchOutletId INT REFERENCES BranchOutlet(Id),
    UsersId INT REFERENCES Users(Id)
);

INSERT INTO Users (Id, FirstName, LastName, Email, HomeAddress, PhoneNumber, BirthDate)
VALUES
    (1, 'Ahmad', 'Sudirman', 'ahmad@gmail.com', 'Jl.Pegangsaan No.32, Jakarta', '0812345678', '1990-01-01'),
    (2, 'Budi', 'Kurniawan', 'budi@yahoo.com', 'Gang Kopo Kav 58 C, Bandung', '0823456789', '1992-05-15'),
    (3, 'Citra', 'Wijaya', 'citra@gmail.com', 'Jl.Manyar Kertajaya No.56, Surabaya', '0834567890', '1988-09-20'),
    (4, 'Dewi', 'Putri', 'dewi@hotmail.com', 'Jl.Sukoharjo No.103-109B, Yogyakarta', '0845678901', '1995-03-10'),
    (5, 'Eko', 'Santoso', 'eko@gmail.com', 'Komp Polri, Kav 23V, Semarang', '0856789012', '1993-11-25');
