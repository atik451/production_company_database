/*
MySQL Data Transfer
Source Host: localhost
Source Database: forestfilms
Target Host: localhost
Target Database: forestfilms
Date: 12/17/2021 12:00:34 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `ClientID` varchar(5) NOT NULL,
  `ClientName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `LocationCode` varchar(5) NOT NULL,
  `LocationName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LocationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for locationproperty
-- ----------------------------
DROP TABLE IF EXISTS `locationproperty`;
CREATE TABLE `locationproperty` (
  `LocationCode` varchar(5) NOT NULL,
  `PropertyCode` varchar(5) NOT NULL,
  PRIMARY KEY (`LocationCode`,`PropertyCode`),
  KEY `FK4` (`PropertyCode`),
  CONSTRAINT `FK3` FOREIGN KEY (`LocationCode`) REFERENCES `location` (`LocationCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK4` FOREIGN KEY (`PropertyCode`) REFERENCES `property` (`PropertyCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for production
-- ----------------------------
DROP TABLE IF EXISTS `production`;
CREATE TABLE `production` (
  `ProductionID` int(3) NOT NULL,
  `NoOfDays` int(3) DEFAULT NULL,
  `ClientID` varchar(5) DEFAULT NULL,
  `ProductionTypeCode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ProductionID`),
  KEY `FK1` (`ClientID`),
  KEY `FK2` (`ProductionTypeCode`),
  CONSTRAINT `FK1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2` FOREIGN KEY (`ProductionTypeCode`) REFERENCES `productiontype` (`ProductionTypeCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for productionlocation
-- ----------------------------
DROP TABLE IF EXISTS `productionlocation`;
CREATE TABLE `productionlocation` (
  `ProductionID` int(3) NOT NULL,
  `LocationCode` varchar(5) NOT NULL,
  PRIMARY KEY (`ProductionID`,`LocationCode`),
  KEY `Fk6` (`LocationCode`),
  CONSTRAINT `Fk5` FOREIGN KEY (`ProductionID`) REFERENCES `production` (`ProductionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk6` FOREIGN KEY (`LocationCode`) REFERENCES `location` (`LocationCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for productionstafftype
-- ----------------------------
DROP TABLE IF EXISTS `productionstafftype`;
CREATE TABLE `productionstafftype` (
  `ProductionID` int(3) NOT NULL,
  `StaffTypeCode` varchar(5) NOT NULL,
  `Quantity` int(3) DEFAULT NULL,
  PRIMARY KEY (`ProductionID`,`StaffTypeCode`),
  KEY `FK8` (`StaffTypeCode`),
  CONSTRAINT `FK7` FOREIGN KEY (`ProductionID`) REFERENCES `production` (`ProductionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK8` FOREIGN KEY (`StaffTypeCode`) REFERENCES `stafftype` (`StaffTypeCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for productiontype
-- ----------------------------
DROP TABLE IF EXISTS `productiontype`;
CREATE TABLE `productiontype` (
  `ProductionTypeCode` varchar(5) NOT NULL,
  `ProductionTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProductionTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `PropertyCode` varchar(5) NOT NULL,
  `PropertyName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PropertyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for stafftype
-- ----------------------------
DROP TABLE IF EXISTS `stafftype`;
CREATE TABLE `stafftype` (
  `StaffTypeCode` varchar(5) NOT NULL,
  `StaffTypeName` varchar(100) DEFAULT NULL,
  `CostPerDay` int(10) DEFAULT NULL,
  PRIMARY KEY (`StaffTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `client` VALUES ('C1', 'Epom Motors');
INSERT INTO `client` VALUES ('C2', 'Ministry of Agriculture, Fisheries and Food');
INSERT INTO `location` VALUES ('L1', 'Millwall Park, Isle of Dogs');
INSERT INTO `location` VALUES ('L2', 'Windsor Castle, Grounds');
INSERT INTO `location` VALUES ('L3', 'Orford Ness, Suffolk');
INSERT INTO `location` VALUES ('L4', 'Rancid Attic Studio');
INSERT INTO `location` VALUES ('L5', 'St James\'s Park, London');
INSERT INTO `locationproperty` VALUES ('L1', 'PR1');
INSERT INTO `locationproperty` VALUES ('L2', 'PR1');
INSERT INTO `locationproperty` VALUES ('L1', 'PR2');
INSERT INTO `locationproperty` VALUES ('L3', 'PR3');
INSERT INTO `locationproperty` VALUES ('L4', 'PR3');
INSERT INTO `locationproperty` VALUES ('L5', 'PR4');
INSERT INTO `production` VALUES ('2', '5', 'C1', 'PT1');
INSERT INTO `production` VALUES ('6', '1', 'C2', 'PT2');
INSERT INTO `production` VALUES ('7', '2', 'C2', 'PT3');
INSERT INTO `productionlocation` VALUES ('2', 'L1');
INSERT INTO `productionlocation` VALUES ('2', 'L2');
INSERT INTO `productionlocation` VALUES ('6', 'L3');
INSERT INTO `productionlocation` VALUES ('6', 'L4');
INSERT INTO `productionlocation` VALUES ('7', 'L5');
INSERT INTO `productionstafftype` VALUES ('2', 'S1', '2');
INSERT INTO `productionstafftype` VALUES ('2', 'S2', '1');
INSERT INTO `productionstafftype` VALUES ('2', 'S3', '1');
INSERT INTO `productionstafftype` VALUES ('2', 'S4', '3');
INSERT INTO `productionstafftype` VALUES ('6', 'S1', '2');
INSERT INTO `productionstafftype` VALUES ('6', 'S2', '1');
INSERT INTO `productionstafftype` VALUES ('6', 'S3', '1');
INSERT INTO `productionstafftype` VALUES ('6', 'S5', '1');
INSERT INTO `productionstafftype` VALUES ('7', 'S1', '2');
INSERT INTO `productionstafftype` VALUES ('7', 'S2', '1');
INSERT INTO `productionstafftype` VALUES ('7', 'S3', '1');
INSERT INTO `productionstafftype` VALUES ('7', 'S5', '1');
INSERT INTO `productiontype` VALUES ('PT1', 'Advertisement');
INSERT INTO `productiontype` VALUES ('PT2', 'Information Film');
INSERT INTO `productiontype` VALUES ('PT3', 'Training Film');
INSERT INTO `property` VALUES ('PR1', 'Featured Vehicle');
INSERT INTO `property` VALUES ('PR2', 'Wrecked Car');
INSERT INTO `property` VALUES ('PR3', 'None');
INSERT INTO `property` VALUES ('PR4', 'Tractor');
INSERT INTO `stafftype` VALUES ('S1', 'Camera Crew', '2000');
INSERT INTO `stafftype` VALUES ('S2', 'Runner', '1000');
INSERT INTO `stafftype` VALUES ('S3', 'Producer', '5000');
INSERT INTO `stafftype` VALUES ('S4', 'Actors', '3000');
INSERT INTO `stafftype` VALUES ('S5', 'Voice Actor', '2000');
