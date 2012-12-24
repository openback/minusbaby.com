ALTER TABLE `posts` CHANGE `their_description` `description` text;
UPDATE  `posts` SET `description`=`my_description` WHERE `description` = NULL OR `description`='';
ALTER TABLE `posts` DROP COLUMN `my_description`;
