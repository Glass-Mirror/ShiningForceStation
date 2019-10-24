mysqladmin -p create shiningforce2

mysql -u root -p  <<EOF
GRANT SELECT ON shiningforce2.* TO 'selectSF2'@'localhost' IDENTIFIED BY '<REMOVED FOR SECURITY>';
GRANT SELECT,INSERT,UPDATE,DELETE ON shiningforce2.* TO 'modifySF2'@'localhost' IDENTIFIED BY '<REMOVED FOR SECURITY>';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON shiningforce2.* TO 'datebaseSF2'@'localhost' IDENTIFIED BY '<REMOVED FOR SECURITY>';
UPDATE user SET plugin='mysql_native_password' where User='selectSF2';
UPDATE user SET plugin='mysql_native_password' where User='modifySF2';
UPDATE user SET plugin='mysql_native_password' where User='databaseSF2';
FLUSH PRIVILEGES;
USE shiningforce2;
CREATE TABLE `weapons` (
    `id` INT NOT NULL AUTO_INCREMENT, 
    `name` VARCHAR(50) NOT NULL, 
    `class` SET('SDMN','HERO','PRST','VICR','MMNK','KNTE','PLDN','PGNT','WARR','GLDT','BRN','MAGE','WIZ','SORC','THIF','NINJ','TORT','MNST','PHNK','PHNX','RNGR','BWNT','WFMN','WFBR','BDMN','BDBT','BRGN','ACHR','SNIP','RBT','GLM','RDBN') NOT NULL,
    `att` TINYINT NOT NULL,
    `def` TINYINT NOT NULL,
    `agi` TINYINT NOT NULL,
    `mov` TINYINT NOT NULL,
    `cost` SMALLINT NOT NULL,
    `cursed` BIT(1) NOT NULL,
    `mithril` BIT(1) NOT NULL,
    `description` VARCHAR(250) NOT NULL,    
    PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `shiningforce2`.`weapons` (
    `name`,`class`,`att`,`def`,`agi`,`mov`,`cost`,`cursed`,`mithril`,`description`)
    VALUES
    ('Wooden Arrow','ACHR,BRGN,SNIP,RNGR,BWNT',5,0,0,0,250,0,0,''),
    ('Iron Arrow','ACHR,BRGN,SNIP,RNGR,BWNT',7,0,0,0,600,0,0,''),
    ('Steel Arrow','ACHR,BRGN,SNIP,RNGR,BWNT',12,0,0,0,1270,0,0,''),
    ('Robin Arrow','BRGN,SNIP,BWNT',17,0,0,0,1480,0,0,''),
    ('Assault Shell','BRGN,SNIP,BWNT',25,0,0,0,2500,0,0,''),
    ('Great Shot','BRGN,SNIP,BWNT',29,0,0,0,5000,0,0,''),
    ('Nazca Cannon','BRGN,SNIP,BWNT',33,0,0,0,3000,0,0,'Found on the Nazca Ship'),
    ('Buster Shot','BRGN,SNIP,BWNT',37,0,0,0,6800,0,1,''),
    ('Hyper Cannon','BRGN,SNIP,BWNT',40,0,0,0,8700,0,1,''),
    ('Grand Cannon','BRGN,SNIP,BWNT',43,0,0,0,9800,0,1,'Use to cast Muddle 1'),
    ('Evil Shot','BRGN,SNIP,BWNT',51,-5,0,0,13000,1,0,'');




EOF

`weapons`
INT             id
VARCHAR(50)     name
VARCHAR(50)     classes
TINYINT         att
TINYINT         def
TINYINT         agi
TINYINT         mov
SMALLINT        value
BIT(1)          cursed
VARCHAR(250)    description



`characters`
INT             id
VARCHAR(50)     name
VARCHAR(1000)   description
VARCHAR(50)     classPre
VARCHAR(50)     classPost1
VARCHAR(50)     classPost2

