DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(32) NOT NULL auto_increment,
  `sort_order` int(32) NOT NULL,
  `title` varchar(140) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `thumbnail_url` varchar(140) NOT NULL,
  `embed` text NOT NULL,
  `description` text,
  `slug` varchar(140) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;
