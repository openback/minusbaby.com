DROP TABLE IF EXISTS `fields`;
CREATE TABLE IF NOT EXISTS `fields` (
  `id` int(32) NOT NULL auto_increment,
  `content` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

INSERT INTO `fields` (`id`, `content`) VALUES
(1, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut tempor eu, gravida eget tortor. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. <A href="#">Donec porta eleifend ornare</a>. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi cursus suscipit orci, auctor rhoncus nibh malesuada a. Maecenas euismod sollicitudin tortor vitae viverra. In hac habitasse platea dictumst. In hac habitasse platea dictumst. Mauris eu semper odio. Proin quis felis ultricies quam blandit semper ut ut dolor. Duis et dui sem, ac sodales lectus. Maecenas bibendum nunc pellentesque ligula suscipit nec vestibulum erat porta.</p> <p>Suspendisse tempor consequat elit et ultrices. Duis ut mi nec purus viverra bibendum sit amet quis sapien. Suspendisse at enim vitae risus vehicula condimentum. Sed non mi ut tellus mattis rutrum et vel eros. Quisque vehicula convallis massa, auctor vulputate turpis ultricies vel. Donec ultrices mi et enim fringilla ut placerat leo pretium. Maecenas porttitor iaculis eleifend. Aliquam sit amet ultrices erat. <a href="#">Donec ut euismod ipsum</a>. Quisque quis erat mauris. Sed laoreet, mauris vitae interdum elementum, ante dolor consequat metus, non tincidunt massa sem non sem. Suspendisse ut odio nisi, sed porta erat. Nam auctor pulvinar lectus, id blandit nisi semper vitae.</p>');
