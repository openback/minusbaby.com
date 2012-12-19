DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `id` int(32) NOT NULL auto_increment,
  `sort_order` int(32) NOT NULL,
  `name` varchar(1024) NOT NULL default '',
  `tag` varchar(1024),
  `url` varchar(1024),
  `email` varchar(1024),
  `bio` text,
  `show_in_contact` bool default 0,
  `hidden` bool default 0,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

INSERT INTO `artists` (`id`, `sort_order`, `name`, `tag`, `url`, `email`, `bio`, `show_in_contact`, `hidden`) VALUES
(1, 1, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 1, 0),
(2, 2, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 1, 0),
(3, 3, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 1, 0),
(4, 4, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 1, 0),
(5, 5, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 1, 0),
(6, 6, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 0, 0),
(7, 7, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 0, 0),
(8, 8, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 0, 0),
(9, 9, 'Morgan Tucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 0, 0),
(10, 10, 'Torgan Mucker', 'Mad Skillz', 'http://crashfaster.com', 'morgantucker@crashfaster.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, <a href="#">gravida eget tortor</a>. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. Donec porta eleifend ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 0, 0);
