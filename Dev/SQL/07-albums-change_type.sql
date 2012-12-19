ALTER TABLE `albums` CHANGE `type` `type` enum('Solo','Compilation','Appears on', 'EP', 'LP') default NULL;
UPDATE `albums` SET `type`='EP' WHERE `type`='Solo';
ALTER TABLE `albums` CHANGE `type` `type` enum('Compilation','Appears on', 'EP', 'LP') default NULL;
