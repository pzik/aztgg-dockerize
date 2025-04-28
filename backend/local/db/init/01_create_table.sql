CREATE TABLE aztggdb.recruitment_notice (
    recruitmentNoticeId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    companyCode VARCHAR(31) NOT NULL,
    jobOfferTitle VARCHAR(127) NOT NULL,
    hash VARCHAR(511) NOT NULL,
    tag VARCHAR(31) DEFAULT NULL,
    url VARCHAR(511) NOT NULL,
    clickCount INTEGER DEFAULT '0',
    scrapedAt DATETIME NOT NULL,
    startAt DATETIME NOT NULL,
    endAt DATETIME DEFAULT NULL
);
