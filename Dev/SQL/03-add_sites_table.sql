DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
  `id` int(32) NOT NULL auto_increment,
  `sort_order` int(32) NOT NULL,
  `name` varchar(1024) NOT NULL default '',
  `url` varchar(1024),
  `hidden` bool default 0,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

INSERT INTO `sites` (`id`, `sort_order`, `name`, `url`, `hidden`) VALUES
(1, 1, 'Last.fm', 'http://last.fm/artist/crashfaster', 0),
(2, 2, 'Facebook', 'https://facebook.com/crashfaster', 0);
