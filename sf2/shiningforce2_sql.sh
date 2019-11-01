mysqladmin -p create shiningforce2

mysql -u root -p  <<EOF
GRANT SELECT ON shiningforce2.* TO 'selectSF2'@'localhost' IDENTIFIED BY '<REMOVED FOR SECURITY>';
GRANT SELECT,INSERT,UPDATE,DELETE ON shiningforce2.* TO 'modifySF2'@'localhost' IDENTIFIED BY '<REMOVED FOR SECURITY>';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON shiningforce2.* TO 'databaseSF2'@'localhost' IDENTIFIED BY '<REMOVED FOR SECURITY>';
GRANT ALL ON *.* TO 'phpmyadmin'@'localhost' IDENTIFIED BY '<REMOVED FOR SECURITY>';
UPDATE user SET plugin='mysql_native_password' where User='selectSF2';
UPDATE user SET plugin='mysql_native_password' where User='modifySF2';
UPDATE user SET plugin='mysql_native_password' where User='databaseSF2';
UPDATE user SET plugin='mysql_native_password' where User='phpmyadmin';
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
    `cursed` BOOLEAN NOT NULL,
    `mithril` BOOLEAN NOT NULL,
    `description` VARCHAR(250) NOT NULL,    
    PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `shiningforce2`.`weapons` (
    `name`,`class`,`att`,`def`,`agi`,`mov`,`cost`,`cursed`,`mithril`,`description`)
    VALUES
    ('Wooden Arrow','ACHR,BRGN,SNIP,RNGR,BWNT',5,0,0,0,250,false,false,''),
    ('Iron Arrow','ACHR,BRGN,SNIP,RNGR,BWNT',7,0,0,0,600,false,false,''),
    ('Steel Arrow','ACHR,BRGN,SNIP,RNGR,BWNT',12,0,0,0,1270,false,false,''),
    ('Robin Arrow','BRGN,SNIP,BWNT',17,0,0,0,1480,false,false,''),
    ('Assault Shell','BRGN,SNIP,BWNT',25,0,0,0,2500,false,false,''),
    ('Great Shot','BRGN,SNIP,BWNT',29,0,0,0,5000,false,false,''),
    ('Nazca Cannon','BRGN,SNIP,BWNT',33,0,0,0,3000,false,false,'Found on the Nazca Ship'),
    ('Buster Shot','BRGN,SNIP,BWNT',37,0,0,0,6800,false,true,''),
    ('Hyper Cannon','BRGN,SNIP,BWNT',40,0,0,0,8700,false,true,''),
    ('Grand Cannon','BRGN,SNIP,BWNT',43,0,0,0,9800,false,true,'Use to cast Muddle 1'),
    ('Evil Shot','BRGN,SNIP,BWNT',51,-5,0,0,13000,true,false,'');
INSERT INTO `shiningforce2`.`weapons` (
    `name`,`class`,`att`,`def`,`agi`,`mov`,`cost`,`cursed`,`mithril`,`description`)
    VALUES 
    ('Short Axe','WARR,GLDT,BRN,RDBN',5,0,0,0,120,false,false,''),
    ('Hand Axe','WARR,GLDT,BRN,RDBN',9,0,0,0,340,false,false,''),
    ('Middle Axe','WARR,GLDT,BRN,RDBN',13,0,0,0,610,false,false,''),
    ('Power Axe','WARR,GLDT,BRN,RDBN',17,0,0,0,1100,false,false,''),
    ('Battle Axe','GLDT,BRN,RDBN',21,0,0,0,1370,false,false,''),
    ('Large Axe','GLDT,BRN,RDBN',25,0,0,0,2250,false,false,''),
    ('Great Axe','GLDT,BRN,RDBN',28,0,0,0,4600,false,false,''),
    ('Heat Axe','GLDT,BRN,RDBN',32,0,0,0,7200,false,true,'Use to cast Blaze 2'),
    ('Atlas Axe','GLDT,BRN,RDBN',35,0,0,0,9600,false,true,'Use to cast Blaze 3'),
    ('Ground Axe','GLDT,BRN,RDBN',39,0,0,1,10000,false,true,''),
    ('Rune Axe','GLDT,BRN,RDBN',42,0,0,0,10000,false,true,'Use to cast Detox 1'),
    ('Evil Axe','GLDT,BRN,RDBN',50,-5,0,0,15000,true,false,'Found in the Force Sword\'s Shrine');
INSERT INTO `shiningforce2`.`weapons` (
    `name`,`class`,`att`,`def`,`agi`,`mov`,`cost`,`cursed`,`mithril`,`description`)
    VALUES 
    ('Short Knife','THIF',5,0,0,0,70,false,false,''),
    ('Dagger','THIF',8,0,0,0,320,false,false,''),
    ('Knife','THIF',12,0,0,0,500,false,false,''),
    ('Thieve\'s Dagger','THIF',18,0,5,0,940,false,false,'');
INSERT INTO `shiningforce2`.`weapons` (
    `name`,`class`,`att`,`def`,`agi`,`mov`,`cost`,`cursed`,`mithril`,`description`)
    VALUES 
    ('Leather Glove','MMNK',26,0,0,0,1300,false,false,''),
    ('Power Glove','MMNK',33,0,0,0,1800,false,false,''),
    ('Brass Knuckles','MMNK',39,0,0,0,2900,false,false,''),
    ('Iron Knuckles','MMNK',43,0,0,0,4800,false,false,''),
    ('Misty Knuckles','MMNK',48,0,0,0,5500,false,true,'Use to remove some enemy MP'),
    ('Giant Knuckles','MMNK',55,0,0,0,7500,false,true,'Use to cast Muddle 1'),
    ('Evil Knuckles','MMNK',63,0,0,0,9500,true,false,'Found in tunnels under Yeel');
INSERT INTO `shiningforce2`.`weapons` (
    `name`,`class`,`att`,`def`,`agi`,`mov`,`cost`,`cursed`,`mithril`,`description`)
    VALUES 
    ('Wooden Rod','MAGE,PRST,WIZ,SORC,VICR',3,0,0,0,60,false,false,''),
    ('Short Rod','MAGE,PRST,WIZ,SORC,VICR',5,0,0,0,130,false,false,''),
    ('Bronze Rod','MAGE,PRST,WIZ,SORC,VICR',8,0,0,0,360,false,false,''),
    ('Iron Rod','MAGE,PRST,WIZ,SORC,VICR',12,0,0,0,560,false,false,''),
    ('Power Stick','MAGE,PRST,WIZ,SORC,VICR',15,0,0,0,1050,false,false,''),
    ('Flail','WIZ,SORC,VICR',19,0,0,0,1450,false,false,''),
    ('Guardian Staff','WIZ,SORC,VICR',22,5,0,0,2380,false,false,''),
    ('Indra Staff','WIZ,SORC,VICR',25,0,0,0,3200,false,false,'Use to steal MP'),
    ('Wish Staff','VICR',26,0,0,0,6100,false,true,'Use to cast Attack'),
    ('Mage Staff','WIZ,SORC',27,0,0,0,6300,false,true,'Use to cast Blaze 2'),
    ('Great Rod','WIZ,SORC,VICR',28,0,0,0,7900,false,true,''),
    ('Holy Staff','VICR',29,0,0,0,9000,false,true,'Equip to regain 2HP every round'),
    ('Goddess Staff','VICR',31,0,0,0,9700,false,true,'Use to cast Aura 2'),
    ('Supply Staff','WIZ,SORC',32,0,0,0,8500,false,true,'Use to remove some enemy MP'),
    ('Freeze Staff','WIZ,SORC',37,0,0,0,9500,false,true,'Use to cast Freeze 3'),
    ('Mystery Staff','WIZ,SORC,VICR',39,0,0,0,10000,false,true,'Equip to regain 2MP every round'),
    ('Demon Rod','WIZ,SORC,VICR',50,0,-10,0,12500,true,false,'Use to steal MP. Found in Dwarven Town');
INSERT INTO `shiningforce2`.`weapons` (
    `name`,`class`,`att`,`def`,`agi`,`mov`,`cost`,`cursed`,`mithril`,`description`)
    VALUES 
    ('Wooden Stick','KNTE,PLDN,PGNT',3,0,0,0,70,false,false,''),
    ('Short Spear','KNTE,PLDN,PGNT',6,0,0,0,120,false,false,''),
    ('Bronze Lance','KNTE,PLDN,PGNT',9,0,0,0,260,false,false,''),
    ('Spear','KNTE,PLDN,PGNT',12,0,0,0,460,false,false,''),
    ('Steel Lance','KNTE,PLDN,PGNT',16,0,0,0,810,false,false,''),
    ('Power Spear','KNTE,PLDN,PGNT',20,0,0,0,1270,false,false,''),
    ('Heavy Lance','PLDN,PGNT',23,0,0,0,1600,false,false,''),
    ('Javelin','PLDN,PGNT',26,0,0,0,3400,false,false,''),
    ('Chrome Lance','PLDN,PGNT',31,0,0,0,6900,false,false,''),
    ('Valkyrie','PLDN,PGNT',33,0,0,0,7700,false,true,'Use to cast Boost'),
    ('Halberd','PLDN,PGNT',37,0,0,0,7300,false,true,'Use to cast Bolt 1'),
    ('Holy Lance','PLDN,PGNT',39,5,0,0,9300,false,true,'Use to restore 10 HP'),
    ('Mist Javelin','PLDN,PGNT',42,0,0,0,9900,false,true,''),
    ('Evil Lance','PLDN,PGNT',48,0,0,-2,11000,true,false,'Found behind the Devil\'s Head');
INSERT INTO `shiningforce2`.`weapons` (
    `name`,`class`,`att`,`def`,`agi`,`mov`,`cost`,`cursed`,`mithril`,`description`)
    VALUES 
    ('Wooden Sword','SDMN,HERO,BDMN,BDBT,BRN,RDBN,NINJ',3,0,0,0,60,false,false,''),
    ('Short Sword','SDMN,HERO,BDMN,BDBT,BRN,RDBN,NINJ',5,0,0,0,140,false,false,''),
    ('Middle Sword','SDMN,HERO,BDMN,BDBT,BRN,RDBN,NINJ',9,0,0,0,340,false,false,''),
    ('Long Sword','SDMN,HERO,BDMN,BDBT,BRN,RDBN,NINJ',12,0,0,0,620,false,false,''),
    ('Steel Sword','SDMN,HERO,BDMN,BDBT,BRN,RDBN,NINJ',16,0,0,0,1120,false,false,''),
    ('Achilles Sword','SDMN,HERO',19,0,0,0,1120,false,false,'The only weapon that can harm Talos'),
    ('Broad Sword','HERO,BDBT,BRN,RDBN,NINJ',22,0,0,0,1600,false,false,''),
    ('Buster Sword','HERO,BDBT,BRN,RDBN,NINJ',26,0,0,0,2600,false,false,''),
    ('Great Sword','HERO,BDBT,BRN,RDBN,NINJ',29,0,0,0,5100,false,false,''),
    ('Critical Sword','HERO,BDBT,BRN,RDBN,NINJ',32,0,0,0,7200,false,true,'Increase probability of Critical Attacks'),
    ('Katana','NINJ',34,0,0,0,9600,false,true,''),
    ('Battle Sword','HERO,BDBT,BRN,RDBN',35,0,0,0,9200,false,true,''),
    ('Counter Sword','HERO,BDBT,BRN,RDBN',39,0,0,0,13000,false,true,'Increase probability of Counter Attacks'),
    ('Ninja Katana','NINJ',39,0,0,0,11500,false,true,''),
    ('Gisarme','NINJ',42,0,0,0,15000,false,true,'On occassion will immediately kill opponent'),
    ('Levanter','HERO',42,0,0,0,14000,false,true,'Use to cast Blaze 3'),
    ('Force Sword','HERO',46,0,0,0,10000,false,true,'Chaos Breaker reincarnated'),
    ('Dark Sword','HERO,BDBT,BRN,RDBN,NINJ',50,-5,0,0,17000,true,false,'Use to cast Desoul 1');
EOF
