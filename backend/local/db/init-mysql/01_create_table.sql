DROP TABLE IF EXISTS aztggdb.users;
DROP TABLE IF EXISTS aztggdb.recruitment_notice;
DROP TABLE IF EXISTS aztggdb.subscribe_email;
DROP TABLE IF EXISTS aztggdb.subscribe_email_category;
DROP TABLE IF EXISTS aztggdb.hot_issue;
DROP TABLE IF EXISTS aztggdb.hot_issue_comment;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aztggdb.subscribe_email (
    subscribeEmailId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(31) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY subscribe_email_uk_email(email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aztggdb.subscribe_email_category (
    subscribeEmailCategoryId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subscribeEmailId BIGINT NOT NULL,
    category VARCHAR(31) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY subscribe_email_category_nc_subscribeEmailId(subscribeEmailId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aztggdb.hot_issue (
    hotIssueId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    recruitmentNoticeId BIGINT DEFAULT NULL,
    title VARCHAR(1027) DEFAULT NULL,
    content TEXT DEFAULT NULL,
    startAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    endAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY hot_issue_nc_recruitmentNoticeId(recruitmentNoticeId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aztggdb.hot_issue_comment (
    hotIssueCommentId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hotIssueId BIGINT NOT NULL,
    ip VARCHAR(31) NOT NULL,
    content VARCHAR(1027) NOT NULL,
    anonymousName VARCHAR(127) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY hot_issue_comment_nc_hotIssueId(hotIssueId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE aztggdb.users (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    nickname VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(31) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aztggdb.board (
    boardId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userId BIGINT NOT NULL,
    title VARCHAR(255) DEFAULT NULL,
    content TEXT DEFAULT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY board_nc_userId(userId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aztggdb.board_comment (
    boardCommentId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    boardId BIGINT NOT NULL,
    userId BIGINT NOT NULL,
    content VARCHAR(1027) DEFAULT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY board_comment_nc_boardId(boardId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aztggdb.board_like (
    boardLikeId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    boardId BIGINT NOT NULL,
    userId BIGINT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modifiedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY board_like_nc_boardId(boardId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aztggdb.recruitment_notice_statistic
(
    recruitmentNoticeStatisticId BIGINT AUTO_INCREMENT PRIMARY KEY,
    standardCategory               VARCHAR(255) NOT NULL,
    companyCode                    VARCHAR(255) NOT NULL,
    count                           INT          NOT NULL,
    createdAt                      DATETIME    NOT NULL,
    INDEX idx_company_category_date (companyCode, standardCategory, createdAt)
);

CREATE TABLE aztggdb.retryable_recruitment_notice_statistic
(
    retryableRecruitmentNoticeStatisticId BIGINT AUTO_INCREMENT PRIMARY KEY,
    recruitmentNoticeId                     BIGINT    NOT NULL,
    createdAt                                DATETIME NOT NULL,
    INDEX idx_recruitment_notice_id (recruitmentNoticeId)
);