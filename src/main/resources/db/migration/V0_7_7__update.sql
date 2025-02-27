ALTER TABLE reservation
DROP FOREIGN KEY `FK_chargeBoxId_r`,
DROP FOREIGN KEY `FK_idTag_r`;
ALTER TABLE connector
DROP FOREIGN KEY `FK_chargeBoxId_c`;
ALTER TABLE transaction
DROP FOREIGN KEY `FK_idTag_t`;
ALTER TABLE user
DROP FOREIGN KEY `FK_user_parentIdTag`;
ALTER TABLE chargebox
CHANGE COLUMN `chargeBoxId` `chargeBoxId` VARCHAR(255) NOT NULL COMMENT '' ,
CHANGE COLUMN `endpoint_address` `endpoint_address` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `ocppProtocol` `ocppProtocol` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `chargePointVendor` `chargePointVendor` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `chargePointModel` `chargePointModel` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `chargePointSerialNumber` `chargePointSerialNumber` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `chargeBoxSerialNumber` `chargeBoxSerialNumber` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `fwVersion` `fwVersion` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `fwUpdateStatus` `fwUpdateStatus` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `iccid` `iccid` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `imsi` `imsi` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `meterType` `meterType` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `meterSerialNumber` `meterSerialNumber` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `diagnosticsStatus` `diagnosticsStatus` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ;
ALTER TABLE connector_metervalue
CHANGE COLUMN `value` `value` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `readingContext` `readingContext` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `format` `format` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `measurand` `measurand` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `location` `location` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `unit` `unit` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ;
ALTER TABLE connector_status
CHANGE COLUMN `status` `status` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `errorCode` `errorCode` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `errorInfo` `errorInfo` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `vendorErrorCode` `vendorErrorCode` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ;
ALTER TABLE user
CHANGE COLUMN `idTag` `idTag` VARCHAR(255) NOT NULL COMMENT '' ,
CHANGE COLUMN `parentIdTag` `parentIdTag` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ;
ALTER TABLE user
ADD CONSTRAINT FK_user_parentIdTag
FOREIGN KEY (`parentIdTag`)
REFERENCES `user` (`idTag`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE reservation
CHANGE COLUMN `idTag` `idTag` VARCHAR(255) NOT NULL COMMENT '' ,
CHANGE COLUMN `chargeBoxId` `chargeBoxId` VARCHAR(255) NOT NULL COMMENT '' ,
CHANGE COLUMN `status` `status` VARCHAR(255) NOT NULL COMMENT '' ;
ALTER TABLE reservation
ADD CONSTRAINT FK_chargeBoxId_r
FOREIGN KEY (`chargeBoxId`)
REFERENCES `chargebox` (`chargeBoxId`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
ADD CONSTRAINT FK_idTag_r
FOREIGN KEY (`idTag`)
REFERENCES `user` (`idTag`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;
ALTER TABLE connector
CHANGE COLUMN `chargeBoxId` `chargeBoxId` VARCHAR(255) NOT NULL COMMENT '' ;
ALTER TABLE connector
ADD CONSTRAINT FK_chargeBoxId_c
FOREIGN KEY (`chargeBoxId`)
REFERENCES `chargebox` (`chargeBoxId`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;
ALTER TABLE transaction
CHANGE COLUMN `idTag` `idTag` VARCHAR(255) NOT NULL COMMENT '' ,
CHANGE COLUMN `startValue` `startValue` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `stopValue` `stopValue` VARCHAR(255) NULL DEFAULT NULL COMMENT '' ;
ALTER TABLE transaction
ADD CONSTRAINT FK_idTag_t
FOREIGN KEY (`idTag`)
REFERENCES `user` (`idTag`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;