
CREATE TABLE professionCategory(
	pid int,
    profession VARCHAR(32) DEFAULT 'NONE',
    domain VARCHAR(32) DEFAULT 'NONE',
    PRIMARY KEY(pid)
);

CREATE TABLE user(
	uid int AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(50),
    name VARCHAR(50),
    age int,
    verficationDoc int,
    #pid int,
    PRIMARY KEY(uid)
    #FOREIGN KEY(pid) REFERENCES ProfessionCategory(pid) ON DELETE SET NULL
);

CREATE TABLE location(
	lid int,
	locality VARCHAR(250),
    pin int,
    city VARCHAR(50),
    PRIMARY KEY(lid)
);

CREATE TABLE address(
	uid int,
    address VARCHAR(250),
    lid int,
    addressType VARCHAR(50) DEFAULT 'HOME',
    PRIMARY KEY(uid, address),
    FOREIGN KEY(uid) REFERENCES user(uid) ON DELETE CASCADE,
    FOREIGN KEY(lid) REFERENCES location(lid) ON DELETE SET NULL
);

CREATE TABLE favourites(
	uidSS int,	-- SS -> Service Seeker
    uidSP int,	-- SP -> Service Provider
    PRIMARY KEY(uidSS, uidSP),
    FOREIGN KEY(uidSS) REFERENCES user(uid) ON DELETE CASCADE,
    FOREIGN KEY(uidSP) REFERENCES user(uid) ON DELETE CASCADE
);

CREATE TABLE phoneNumber(
	uid int,
    phoneNumber int,
    PRIMARY KEY(uid, phoneNumber),
    FOREIGN KEY(uid) REFERENCES user(uid) ON DELETE CASCADE
);

CREATE TABLE sosNumber(
	uid int,
    phoneNumber int,
    PRIMARY KEY(uid, phoneNumber),
    FOREIGN KEY(uid) REFERENCES user(uid) ON DELETE CASCADE
);

CREATE TABLE ratingsAndReviews(
	uidSS int, -- SS -> Service Seeker
    uidSP int, -- SP -> Service Provider
    rating DECIMAL(2,1),
    review VARCHAR(200),
    PRIMARY KEY(uidSS, uidSP),
	FOREIGN KEY(uidSS) REFERENCES user(uid) ON DELETE CASCADE,
    FOREIGN KEY(uidSP) REFERENCES user(uid) ON DELETE CASCADE
);

CREATE TABLE employee(
	eid int,
    name VARCHAR(32),
    designation VARCHAR(32),
    availability VARCHAR(15),
    PRIMARY KEY(eid)
);

CREATE TABLE complaints(
	uidSS int, -- SS -> Service Seeker
    uidSP int, -- SP -> Service Provider
    complaint VARCHAR(200),
    eid int,
    PRIMARY KEY(uidSS, uidSP),
	FOREIGN KEY(uidSS) REFERENCES user(uid) ON DELETE CASCADE,
    FOREIGN KEY(uidSP) REFERENCES user(uid) ON DELETE CASCADE,
    FOREIGN KEY(eid) REFERENCES employee(eid) ON DELETE CASCADE
);

CREATE TABLE blacklist(
	phoneNumber int PRIMARY KEY
);

show tables;

/*
DESCRIBE professionCategory;
DESCRIBE user
DESCRIBE location
DESCRIBE address
DESCRIBE favourites
DESCRIBE phoneNumber
DESCRIBE sosNumber
DESCRIBE ratingsAndReviews
DESCRIBE employee
DESCRIBE complaints
DESCRIBE blacklist


DROP TABLE professionCategory;
DROP TABLE user CASCADE;
DROP TABLE location CASCADE;
DROP TABLE address CASCADE;
DROP TABLE favourites CASCADE;
DROP TABLE phoneNumber CASCADE;
DROP TABLE sosNumber CASCADE;
DROP TABLE ratingsAndReviews CASCADE;
DROP TABLE employee CASCADE;
DROP TABLE complaints CASCADE;
DROP TABLE blacklist CASCADE;
*/