
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
    aadharNumber bigint UNIQUE,
    serviceProvider VARCHAR(5),
    pid int,
    PRIMARY KEY(uid),
    FOREIGN KEY(pid) REFERENCES ProfessionCategory(pid) ON DELETE SET NULL
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
    apartment VARCHAR(250),
    lid int,
    addressType VARCHAR(50) DEFAULT 'HOME',
    PRIMARY KEY(uid, apartment),
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
    rating int,
    review VARCHAR(500),
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
    cid int,
    uidSS int, -- SS -> Service Seeker
    uidSP int, -- SP -> Service Provider
    complaint VARCHAR(200),
    eid int,
    PRIMARY KEY(cid),
    FOREIGN KEY(uidSS) REFERENCES user(uid) ON DELETE CASCADE,
    FOREIGN KEY(uidSP) REFERENCES user(uid) ON DELETE CASCADE,
    FOREIGN KEY(eid) REFERENCES employee(eid) ON DELETE CASCADE
);

CREATE TABLE blacklist(
	aadharNumber int PRIMARY KEY
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
DROP TABLE user;
DROP TABLE location;
DROP TABLE address;
DROP TABLE favourites;
DROP TABLE phoneNumber;
DROP TABLE sosNumber;
DROP TABLE ratingsAndReviews;
DROP TABLE employee;
DROP TABLE complaints;
DROP TABLE blacklist;
*/
