DROP TABLE IF EXISTS aztggdb.recruitment_notice;
DROP TABLE IF EXISTS aztggdb.subscribe_email;
DROP TABLE IF EXISTS aztggdb.subscribe_email_category;

CREATE TABLE aztggdb.recruitment_notice (
    recruitmentNoticeId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    companyCode VARCHAR(31) NOT NULL,
    scrapGroupCode VARCHAR(31) NOT NULL,
    jobOfferTitle VARCHAR(127) NOT NULL,
    hash VARCHAR(511) NOT NULL,
    categories VARCHAR(511) DEFAULT NULL,
    standardCategory VARCHAR(31) DEFAULT NULL,
    corporateCodes VARCHAR(511) DEFAULT NULL,
    url VARCHAR(511) NOT NULL,
    clickCount INTEGER DEFAULT '0',
    scrapedAt DATETIME NOT NULL,
    startAt DATETIME DEFAULT NULL,
    endAt DATETIME DEFAULT NULL
);

CREATE TABLE aztggdb.subscribe_email (
    subscribeEmailId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(31) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY subscribe_email_uk_email(email)
);

CREATE TABLE aztggdb.subscribe_email_category (
    subscribeEmailCategoryId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subscribeEmailId BIGINT NOT NULL,
    category VARCHAR(31) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY subscribe_email_category_nc_subscribeEmailId(subscribeEmailId)
);

CREATE TABLE aztggdb.hot_issue (
    hotIssueId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    recruitmentNoticeId BIGINT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY hot_issue_nc_recruitmentNoticeId(recruitmentNoticeId)
);

CREATE TABLE aztggdb.hot_issue_comment (
    hotIssueCommentId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hotIssueId BIGINT NOT NULL,
    ip VARCHAR(31) NOT NULL,
    content VARCHAR(1027) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY hot_issue_comment_nc_hotIssueId(hotIssueId)
);