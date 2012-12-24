ALTER TABLE `events` CHANGE `their_description` `description` text;
UPDATE `events` SET `description`=`my_description` WHERE `description` = NULL OR `description`='';
ALTER TABLE `events` DROP COLUMN `my_description`;
