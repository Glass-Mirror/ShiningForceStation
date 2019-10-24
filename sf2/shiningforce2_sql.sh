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
    `class` SET('SDMN','HERO','PRST','VICR','MMNK','KNTE','PLDN','PGNT','WARR','GLDT','BRN','MAGE','WIZ','SORC','THIF','NINJ','TORT','MNST','PHNK','PHNX','RNGR','BWNT','WFMN','WFBR','BDMN','BDBT','BRGN','ACHR','SNIP','RBT','GLM','RDBN'),
    `att` TINYINT,
    `def` TINYINT,
    `agi` TINYINT,
    `mov` TINYINT,
    `cost` SMALLINT,
    `cursed` BIT(1) NOT NULL,
    `mithril` BIT(1) NOT NULL,
    `description` VARCHAR(250),    
    PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `shiningforce2`.`characters` (`id`,`name`) VALUES ('1', 'utopple.com'), ('2', 'mail.utopple.com'), ('3', 'mail.local.utopple.com'), ('4', 'local.utopple.com');
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

