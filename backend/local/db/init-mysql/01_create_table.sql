CREATE TABLE aztggdb.recruitment_notice (
    recruitmentNoticeId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    companyCode VARCHAR(31) NOT NULL,
    scrapGroupCode VARCHAR(31) NOT NULL,
    jobOfferTitle VARCHAR(127) NOT NULL,
    hash VARCHAR(511) NOT NULL,
    categories VARCHAR(511) DEFAULT NULL,
    corporateCodes VARCHAR(511) DEFAULT NULL,
    url VARCHAR(511) NOT NULL,
    clickCount INTEGER DEFAULT '0',
    scrapedAt DATETIME NOT NULL,
    startAt DATETIME DEFAULT NULL,
    endAt DATETIME DEFAULT NULL
);
