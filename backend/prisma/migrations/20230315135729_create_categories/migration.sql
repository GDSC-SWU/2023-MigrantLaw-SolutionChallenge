-- CreateTable
CREATE TABLE `law` (
    `lawId` BIGINT NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(50) NOT NULL,
    `jomun` VARCHAR(10000) NOT NULL,

    PRIMARY KEY (`lawId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lawJson` (
    `lawId` BIGINT NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(50) NOT NULL,
    `jomunKey` JSON NULL,
    `jomunTitle` JSON NULL,
    `jomunStartDay` JSON NULL,
    `jomunContent` JSON NULL,
    `jomunReference` JSON NULL,
    `hang` JSON NULL,

    PRIMARY KEY (`lawId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
