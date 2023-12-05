create database LEARNING_MANAGEMENT_SYSTEMS;
show databases;
use LEARNING_MANAGEMENT_SYSTEMS;
CREATE TABLE UserDetails (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20),
    verified BOOLEAN NOT NULL DEFAULT FALSE,
    creator_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    creator_user INT
);
show tables;

-- Hired Candidates
CREATE TABLE HiredCandidate (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    EmailId VARCHAR(255) NOT NULL,
    HiredCity VARCHAR(100),
    Degree VARCHAR(100),
    HiredDate DATE,
    MobileNumber VARCHAR(20),
    PermanentPincode VARCHAR(15),
    HiredLab VARCHAR(100),
    Attitude VARCHAR(255),
    CommunicationRemark VARCHAR(255),
    KnowledgeRemark VARCHAR(255),
    AggregateRemark VARCHAR(255),
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT
);
-- FellowshipCandidate 
CREATE TABLE FellowshipCandidate (
    Id INT,
    CandidateId VARCHAR(20) NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    EmailId VARCHAR(255) NOT NULL,
    HiredCity VARCHAR(100), 
    Degree VARCHAR(100),
    HiredDate DATE,
    MobileNumber VARCHAR(20),
    PermanentPincode VARCHAR(15),
    HiredLab VARCHAR(100),
    Attitude VARCHAR(255),
    CommunicationRemark VARCHAR(255),
    KnowledgeRemark VARCHAR(255),
    AggregateRemark VARCHAR(255),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    BirthDate DATE,
    IsBirthDateVerified BOOLEAN,
    ParentName VARCHAR(100),
    ParentOccupation VARCHAR(100),
    ParentsMobileNumber VARCHAR(20),
    ParentsAnnualSalary DECIMAL(10, 2), 
    LocalAddress VARCHAR(255),
    PermanentAddress VARCHAR(255),
    PhotoPath VARCHAR(255),
    JoiningDate DATE,
    CandidateStatus VARCHAR(50),
    PersonalInformation TEXT,
    BankInformation TEXT,
    EducationalInformation TEXT,
    DocumentStatus VARCHAR(50),
    Remark TEXT,
    FOREIGN KEY (Id) REFERENCES HiredCandidate(Id)
);
-- CandidateBankDetails 
CREATE TABLE CandidateBankDetails (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    CandidateId VARCHAR(20),
    Name VARCHAR(100),
    AccountNumber VARCHAR(20),
    IsAccountNumVerified BOOLEAN,
    IfscCode VARCHAR(20),
    IsIFSCCodeVerified BOOLEAN,
    PanNumber VARCHAR(20),
    IsPanNumberVerified BOOLEAN,
    AadhaarNumber VARCHAR(20),
    IsAadhaarNumVerified BOOLEAN,
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (CandidateId) REFERENCES FellowshipCandidate(CandidateId)
);
-- CandidateQualification 
CREATE TABLE CandidateQualification (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    CandidateId VARCHAR(20),
    Diploma VARCHAR(100),
    DegreeName VARCHAR(100),
    IsDegreeNameVerified BOOLEAN,
    EmployeeDiscipline VARCHAR(100),
    IsEmployeeDisciplineVerified BOOLEAN,
    PassingYear INT,
    IsPassingYearVerified BOOLEAN,
    AggrPer DECIMAL(5, 2),
    IsAggrPerVerified BOOLEAN,
    FinalYearPer DECIMAL(5, 2),
    IsFinalYearPerVerified BOOLEAN,
    TrainingInstitute VARCHAR(100),
    IsTrainingInstituteVerified BOOLEAN,
    TrainingDurationMonth INT,
    IsTrainingDurationMonthVerified BOOLEAN,
    OtherTraining VARCHAR(255),
    IsOtherTrainingVerified BOOLEAN,
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (CandidateId) REFERENCES FellowshipCandidate(CandidateId)
);
show tables;
-- CandidateDocuments 
CREATE TABLE CandidateDocuments (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    CandidateId VARCHAR(20),
    DocType VARCHAR(50),
    DocPath VARCHAR(255),
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (CandidateId) REFERENCES FellowshipCandidate(CandidateId)
);
desc CandidateDocuments;

-- Company 
CREATE TABLE Mst_Company (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Location VARCHAR(100),
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT
);

-- AppParameters 
CREATE TABLE AppParameters (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    KeyType VARCHAR(50),
    KeyValue VARCHAR(255),
    KeyText TEXT,
    CurStatus VARCHAR(50),
    LastUpdateUser INT, 
    LastUpdateStamp TIMESTAMP,
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    SeqNum INT
);
desc AppParameters;

-- TechStack 
CREATE TABLE Mst_TechStack (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    TechName VARCHAR(100),
    ImagePath VARCHAR(255),
    Framework VARCHAR(100),
    CurStatus VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT
);
desc TechStack;

-- TechType 
CREATE TABLE Mst_TechType (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(100),
    CurStatus VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT
);
desc TechType;

-- Lab
CREATE TABLE Mst_Lab (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Address VARCHAR(255),
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT
);
desc Lab;

-- LabThreshold 
CREATE TABLE LabThreshold (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    LabId INT, 
    LabCapacity INT,
    LeadThreshold INT,
    IdeationEnggThreshold INT,
    BuddyEnggThreshold INT,
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (LabId) REFERENCES Mst_Lab(Id)
);
desc LabThreshold;

-- MakerProgram
CREATE TABLE MakerProgram (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProgramName VARCHAR(100),
    ProgramType VARCHAR(50),
    ProgramLink VARCHAR(255),
    TechStackId INT,
    TechTypeId INT,
    IsProgramApproved BOOLEAN,
    Description TEXT,
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (TechStackId) REFERENCES Mst_TechStack(Id),
    FOREIGN KEY (TechTypeId) REFERENCES Mst_TechType(Id)
);
desc MakerProgram;

-- Mentor 
CREATE TABLE Mentor (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    MentorType VARCHAR(50),
    LabId INT, 
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (LabId) REFERENCES Mst_Lab(Id)
);
desc Mentor;

-- MentorIdeationMap 
CREATE TABLE MentorIdeationMap (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ParentMentorId INT, 
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (ParentMentorId) REFERENCES Mentor(Id)
);
desc MentorIdeationMap;

-- MentorTechStack 
CREATE TABLE MentorTechStack (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    MentorId INT,
    TechStackId INT, 
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (MentorId) REFERENCES Mentor(Id),
    FOREIGN KEY (TechStackId) REFERENCES Mst_TechStack(Id)
);
-- CompanyRequirement 
CREATE TABLE CompanyRequirement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    requested_month DATE,
    city VARCHAR(100),
    is_doc_verification BOOLEAN,
    requirement_doc_path VARCHAR(255),
    no_of_engg INT,
    tech_stack_id INT,
    tech_type_id INT,
    maker_program_id INT, 
    lead_id INT, 
    ideation_engg_id INT, 
    buddy_engg_id INT, 
    special_remark TEXT,
    Status VARCHAR(50),
    creator_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    creator_user INT,
    FOREIGN KEY (company_id) REFERENCES Mst_Company(Id),
    FOREIGN KEY (tech_stack_id) REFERENCES Mst_TechStack(Id),
    FOREIGN KEY (tech_type_id) REFERENCES Mst_TechType(Id),
    FOREIGN KEY (maker_program_id) REFERENCES MakerProgram(Id),
    FOREIGN KEY (lead_id) REFERENCES Mentor(Id),
    FOREIGN KEY (ideation_engg_id) REFERENCES Mentor(Id), 
    FOREIGN KEY (buddy_engg_id) REFERENCES Mentor(Id)
);
desc CompanyRequirement;

-- CandidateStackAssignment 
CREATE TABLE CandidateStackAssignment (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    RequirementId INT,
    CandidateId VARCHAR(20),
    AssignDate DATE,
    CompleteDate DATE,
    Status VARCHAR(50),
    CreatorStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatorUser INT,
    FOREIGN KEY (RequirementId) REFERENCES CompanyRequirement(Id),
    FOREIGN KEY (CandidateId) REFERENCES FellowshipCandidate(CandidateId)
);
desc CandidateStackAssignment;
show tables;