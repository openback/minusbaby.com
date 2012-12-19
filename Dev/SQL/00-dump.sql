-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: internal-db.s43752.gridserver.com
-- Generation Time: Jun 12, 2011 at 07:03 PM
-- Server version: 4.1.25
-- PHP Version: 4.4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `db43752_crashfaster_cake`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
  `id` int(32) NOT NULL auto_increment,
  `type` enum('Solo','Compilation','Appears on') default NULL,
  `label` varchar(140) default NULL,
  `label_url` text,
  `catalog_number` varchar(140) default NULL,
  `title` varchar(140) NOT NULL default '',
  `release_date` date default NULL,
  `formats` varchar(140) default NULL,
  `country` varchar(2) default 'US',
  `url` text,
  `purchase_url` text,
  `license` varchar(140) default NULL,
  `cover_file_path` text,
  `cover_file_name` varchar(140) default NULL,
  `cover_file_size` int(32) default NULL,
  `cover_content_type` varchar(140) default NULL,
  `thumbnail_file_path` text,
  `thumbnail_file_name` varchar(140) default NULL,
  `thumbnail_file_size` int(32) default NULL,
  `thumbnail_content_type` varchar(140) default NULL,
  `comments` text,
  `downloads` int(32) default '0',
  `slug` varchar(140) default 'album',
  `artist` varchar(140) default 'minusbaby',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `type`, `label`, `label_url`, `catalog_number`, `title`, `release_date`, `formats`, `country`, `url`, `purchase_url`, `license`, `cover_file_path`, `cover_file_name`, `cover_file_size`, `cover_content_type`, `thumbnail_file_path`, `thumbnail_file_name`, `thumbnail_file_size`, `thumbnail_content_type`, `comments`, `downloads`, `slug`, `artist`) VALUES
(1, 'Solo', '8bitpeoples', 'http://8bitpeoples.com', '8BP036', 'Monkey Patch', '2003-12-01', 'MP3', 'US', 'http://www.8bitpeoples.com/discography/8BP036', '', 'CC', 'monkey_patch-cover.png', 'monkey_patch-cover.png', 13671, 'image/png', 'monkey_patch-cover-th.png', 'monkey_patch-cover-th.png', 4693, 'image/png', 'My earliest memory of a monkey is the scene in "Kingukongu tai Gojira" where King Kong opens a giant snake''s mouth so far beyond it''s natural extention point that it eventually looks like a mushroom with a long, wiggly, scaled stem. Sure, King Kong is an ape but to a 4 year old, it was a very big monkey with an attitude problem. It was also pretty bad-ass. So, in return for playfully horrific imagery, I managed to write an album dedicated to all things apish and monkeyed. Don''t accept any imitations, this album is more real than Diddy Kong''s learned vocabulary.', 0, 'Monkey-Patch', 'minusbaby'),
(2, 'Solo', '8bitpeoples', 'http://8bitpeoples.com', '8BP089', 'Saudade for Beginners', '2008-11-26', 'MP3', 'US', 'http://www.8bitpeoples.com/discography/8BP089', '', 'CC', 'saudade_for_beginners-cover.png', 'saudade_for_beginners-cover.png', 8665, 'image/png', 'saudade_for_beginners-cover-th.png', 'saudade_for_beginners-cover-th.png', 1741, 'image/png', 'After a five-year hiatus, minusbaby returns to our discography with the hip-shaking "Saudade for Beginners"; five tunes written in S&atilde;o Paulo, <a href="http://www.flickr.com/photos/minusbaby/collections/72157600800256445/" target="_blank">Brazil</a> and <a  href="http://www.flickr.com/photos/minusbaby/tags/eastharlem/" target="_blank">East Harlem</a>, New York City. Whereas "<a href="http://www.8bitpeoples.com/discography/8BP036">Monkey Patch</a>" concerned itself with fictitious apes and animal hybrids, "Saudade for Beginners" aims to express life after the experience of <a href="http://en.wikipedia.org/wiki/Saudade" target="_blank">saudade</a>, a term often discussed pedantically by the academe, but best left to music and poetry as in <a href="http://bossa.net/" target="_blank">bossa nova</a> and <a href="http://en.wikipedia.org/wiki/Samba" target="_blank">samba</a> &ndash; of which minusbaby is a devoted connoisseur. Shake what your <a href="http://lookwayup.com/lwu.exe/lwu/toEng?s=d&amp;w=m%E3e&amp;slang=Por" target="_blank">m&atilde;e</a> gave you.', 0, 'Saudade-for-Beginners', 'minusbaby'),
(3, 'Solo', '8bitpeoples', 'http://8bitpeoples.com', '8BP101', 'Left', '2009-08-28', 'MP3', 'US', 'http://www.8bitpeoples.com/discography/8BP101', '', 'CC', 'left.png', 'left.png', 8462, 'image/png', 'left-th.png', 'left-th.png', 2147, 'image/png', 'The first time I listened to "Left" I was 6,000 feet above sea level being driven in a car navigating the winding roads of the Himalayas. The last time I listened to "Left" was a few minutes ago while watching some writers at the 5Pointz graffiti spot in Queens. Both times I was mentally transported to a place between those two extremes &ndash; the majestic and the everyday. Can something be both timeless and fresh? It can when the bass is the base and each snare truly ensnares.<br />\r\n<br />\r\nOnce again, minusbaby has shown us the proto-urban; an audio space where an imaginary city is built in the mind''s eye from the rawest materials and yet still seems to be polished and eternal. Please, enjoy, as I do, the reductive/constructive paradox which is minusbaby''s perpetual rhythm machine and sip and nibble from one of the most inconspicuously nuanced suppers ever to disguise itself as a snack. Simplicity was never so deceptive.<br />\r\n<br />\r\n<a href="http://www.nattyadams.com/" target="_blank">Nathaniel Adams</a> &bull; Jersey City, NJ &bull; August 2009', 0, 'Left', 'minusbaby'),
(4, 'Solo', '8bitpeoples', 'http://8bitpeoples.com', '8BP110', 'Derecha', '2010-08-02', 'MP3/CD', 'US', 'http://www.8bitpeoples.com/discography/8BP110', '', 'CC', 'derecha-cover.png', 'derecha-cover.png', 3657, 'image/png', 'derecha-cover-th.png', 'derecha-cover-th.png', 1819, 'image/png', 'It''s surprising to me as someone who generally isn''t that big on chip music that I''m on my third straight play through minusbaby''s new album, <i>Derecha</i>. And even though I admittedly get fidgety and impatient on hearing more than one song at any given time in any given genre (chronic musical ADD), here I am humming along like an asshole, more forcefully with each repeated listen, ad-libbing riffs here and there while I finger-drum beats on my desktop like a white Candido, and quickly approaching my fourth return listen.<br /> <br />As an album, it''s a mature progression from his previous EP, <i>Left</i>. And it''s damn good. And I want to tell people about it, but what do I even say?  It''s chip music, but it doesn''t sound like something from any video game I played when I was a kid. It''s new music made with old-school mentality using a combination of sounds that could either be from 1985 or 2085. It''s funky, it''s danceable, it''s composed, it''s cerebral, it''s performing a complicated samba throughout the <i>Southern Hemisphere</i> at times. It''s all of these and yet it''s none of these.<br /> <br />In a word, it''s minusbaby.<br /> <br />Dylan Garret, DJ &bull; New York, NY &bull; July 2010', 0, 'Derecha', 'minusbaby'),
(8, 'Solo', 'Self-Released', '', '', 'O Que NÃ£o Tem JuÃ­zo [2003â€“2006]', '2009-09-28', 'MP3', 'US', 'http://freemusicarchive.org/music/minusbaby/O_Que_No_Tem_Juzo_20032006/', '', 'CC', 'o_que_nao_tem_juizo-cover.png', 'o_que_nao_tem_juizo-cover.png', 2518, 'image/png', 'o_que_nao_tem_juizo-cover-th.png', 'o_que_nao_tem_juizo-cover-th.png', 1750, 'image/png', '<p>For a few weeks in 2003 I thought that it would be interesting to write an album with chip music-influenced tracks in stereo and hip-hop-influenced tracks in mono.\r\n</p>\r\n<p>\r\nI played with this idea for a few years until deciding to ditch it and just release everything together as this ad hoc compilation.\r\n</p>', 0, 'O-Que-Nao-Tem-Juizo-2003-2006', 'minusbaby'),
(18, 'Solo', 'Self-Released', '', '', 'Left Remixes, Pt. 1', '2009-10-01', 'MP3', 'US', 'http://freemusicarchive.org/music/minusbaby/Left_Remixes_Pt_1/', '', 'CC', 'left_remixes_pt_1.png', 'left_remixes_pt_1.png', 2134, 'image/png', 'left_remixes_pt_1-th.png', 'left_remixes_pt_1-th.png', 985, 'image/png', '<iframe src="http://player.vimeo.com/video/6187252?portrait=0" width="450" height="253" frameborder="0"></iframe>\r\n\r\nIn early August 2009, I assembled a group of musicians to remix the first single, "<b>A Large Part of Your Mind Sliced</b>", from my newest release on <b>8bitpeoples</b>, "<a href="/music/#Left-Remixes-Pt-1">Left</a>".\r\n<br /><br />I''d mentioned that purebred animals are more likely to succumb to one of a wider array of illness than crossbred specimens and that I am all for healthy animals and music.\r\n<br /><br />\r\nThere were no rules.', 0, 'Left-Remixes-Pt-1', 'minusbaby'),
(19, 'Solo', 'Self-Released', '', '', 'Left Remixes, Pt. 2', '2010-04-26', 'MP3', 'US', 'http://freemusicarchive.org/music/minusbaby/Left_Remixes_Pt_2/', '', 'CC', 'left_remixes_pt_2.png', 'left_remixes_pt_2.png', 2292, 'image/png', 'left_remixes_pt_2-th.png', 'left_remixes_pt_2-th.png', 1035, 'image/png', '<iframe src="http://player.vimeo.com/video/8738481?portrait=0" width="450" height="253" frameborder="0"></iframe>', 0, 'Left-Remixes-Pt-2', 'minusbaby'),
(5, 'Compilation', 'Soulseek Records', 'http://www.soulseekrecords.org', 'SLSK001', 'Soulseek Compilation 001', '2002-12-01', 'MP3/CD', 'US', 'http://soulseekrecords.org/releases/slsk001_va_-_soulseek_compilation_volume_1', '', '', 'slsk.jpg', 'slsk.jpg', 52476, 'image/jpeg', 'slsk-th.jpg', 'slsk-th.jpg', 6962, 'image/jpeg', 'The debut release from Soulseek Records, Comp001 embodies the democratic ideology behind the conception of the label itself. Chosen by user votes from over 160 separate artist submissions, the tracks on Comp001 span from glitch to dance, from ambient to breakcore, creating a powerful and diverse introduction to this new label.', 0, 'Soulseek-Compilation-001', 'Various Artists'),
(6, 'Compilation', 'Domizil', 'http://www.micromusic.net', '', 'Micro_Superstarz_2000', '2000-01-01', 'CD', 'CH', 'http://www.micromusic.net', 'http://www.micromusic.net/new_shop/micromusic/m001_details.html', '', 'mm2000.jpg', 'mm2000.jpg', 127016, 'image/jpeg', 'mm2000-th.jpg', 'mm2000-th.jpg', 44148, 'image/jpeg', '<p>\r\n<a href="http://www.micromusic.net">Micromusic.net</a> is an underground sound community, a digital lifestyle platform for screen-kidz, joystick-lovers and audioNerds. A web entertainment park for talented & creative sound_trackerz, for all low-tech producers with a high-tech way of living. micro_superstarz2000 is a collection of the most interesting tracks activated online during the first twelve months. It is a re-compilation of the content of Micromusic''s website, in itself a concentration of 700 pieces of music submitted in the past year. Micromusic''s mission is to define quality in a quantity_producing media_machine.\r\n</p>\r\n<p>\r\nâ€” 2000\r\n</p>', 0, 'Micro-Superstarz-2000', 'Various Artists'),
(7, 'Solo', 'Rappers I Know', 'http://www.rappersiknow.com', '', 'Strong Arctic Winds Take Terns', '2008-08-07', 'MP3', 'US', 'http://freemusicarchive.org/music/minusbaby/Strong_Arctic_Winds_Take_Terns_Fourteen_Songs_Written_and_Recorded_Between_2003_and_2004/', '', '', 'sawtt.png', 'sawtt.png', 3178, 'image/png', 'sawtt-th.png', 'sawtt-th.png', 998, 'image/png', '<iframe src="http://player.vimeo.com/video/91664?byline=0&amp;portrait=0" width="450" height="338" frameborder="0"></iframe>\r\n\r\n<p>This new release of older material from Richard Alexander Caraballo, aka minusbaby, is, for the most part, not in his usual chiptune style. However, the way â€œStrong Arctic Winds Take Terns"  relates to the chiptune work is instructive to the listener who might be just finding their way into his wildly creative universe.\r\n</p>\r\n<p>\r\nWith chiptune music, there is a forced elementalism, a certain influence imposed by the hardware limitations of making music on a vintage gaming console that pushes the artist to bust out creatively. But when the same artist works in the dizzying world of VST plug-ins and the endless possibilities of laptop music, those without a strong idea of their own sonic identity often flounder and are incapable of forging a distinctive style. minusbaby''s work in chiptunes before and after making this music clearly gave him a sense of the need to create limits within which to work â€” the advantage of forced boundaries. Each track presents a short view into a very defined sonic world in which he explores just long enough to find the interesting permutations on the structure and yet leave the listener wanting more.\r\n</p>\r\n<p>\r\nWhile betraying a sensitivity to the integrity of each sound, â€œStrong Arctic Winds Take Terns"  does not come off as a â€œdesigner''s record"  in which one can hear the endless fretting over mix choices while the impact suffers. This release gives the listener a clear image of an artist with a solid, sonic identity; making harmonious, instrumental music.\r\n</p>\r\n<p>\r\nâ€” Chris "<a href="http://freemusicarchive.org/music/glomag/">glomag</a>" Burke â€¢ New York, New York, USA â€¢ May 13th, 2008\r\n</p>', 0, 'Strong-Arctic-Winds-Take-Terns', 'minusbaby'),
(9, 'Compilation', 'R-Bot Records', 'http://rbrecords.kit.net', '', 'Drum Machine Collection', '2009-03-11', 'MP3', 'BR', 'http://www.rbrecords.kit.net/release.html', '', '', 'drum_machine_collection-cover.png', 'drum_machine_collection-cover.png', 3396, 'image/png', 'drum_machine_collection-cover-th.png', 'drum_machine_collection-cover-th.png', 1367, 'image/png', '', 0, 'Drum-Machine-Collection', 'Various Artists'),
(10, 'Compilation', 'Dancing Is Forbidden', 'http://dancingisforbidden.bandcamp.com', '', 'Diversity Is Forbidden', '2008-08-07', 'MP3', 'US', 'http://dancingisforbidden.bandcamp.com/album/diversity-is-forbidden', '', '', 'dif010.png', 'dif010.png', 28299, 'image/png', 'dif010-th.png', 'dif010-th.png', 7528, 'image/png', '<p>\r\nDiversity is Forbidden is meant to be an equal opportunity plan for artists of all kinds. Open up your ears and let the flow of the music indulge on your hearing abilities. And a note to artists out there: KEEP PLAYING MUSIC, KEEP DOING WHAT YOU''RE DOING.\r\n</p>\r\n<p>\r\nThanks to all the bands/musicians that contributed and helped make this become reality.\r\n</p>\r\n<p>\r\n25 Works of art from 25 different artists. Chiptunes, noise, hardcore, punk, electronica, ambient - it''s all here.\r\n</p>', 0, 'Diversity-Is-Forbidden', 'Various Artists'),
(11, 'Compilation', 'Godxiliary', 'http://www.godxiliary.com', '', 'alphabets & animals', '2008-12-01', 'MP3', 'US', 'http://www.godxiliary.com/05.htm', '', '', 'animalsalphabets.png', 'animalsalphabets.png', 2683, 'image/png', 'animalsalphabets-th.png', 'animalsalphabets-th.png', 2017, 'image/png', '<p>"A strange compilation of electronic music, "Alphabets & Animals" is presented by the Godxiliary Web site as an online music collaboration. Twenty-six artists present songs all with animal names and labeled on the album in alphabetical order. As if that isnâ€™t enough, the CD is gift wrapped in black paper with white writing and odd drawings all over it. Very Edgar Allan Poe or H.P. Lovecraft. But, the idea is supposed to be more of a Crass Records feel, one can assume.\r\n</p>\r\n<p>\r\nFor those looking to broaden their horizons and experience what else is out there besides the usual bland radio friendly pop music, "Alphabets & Animals" offers just that: a seemingly random cacophony of flutes, beats, howling, answering machine messages and backwards tape loops. Perhaps even someone beating on a trash can with a stick.\r\n</p>\r\n<p>\r\nWhile this may sound awful, there is quite a bit of interesting stuff on this album.\r\n</p>\r\n<p>\r\nâ€œAlbatrossâ€ by Mikrosopht is a danceable techno beat and Invisible Public Libraryâ€™s accordion on â€œColossal Squidâ€ is pretty cool.  The experimental ''60s-esque sound of Viktoria Lisbetâ€™s â€œD (a Dead Dog Dream)â€ sounds a little like the Beatles meets David Bowie. Other outstanding songs include the acoustic â€œGopher Bombâ€ by the Stomach Aches, the funky â€œEye for Iguanaâ€ by Rob Moore, the heavy reverb-laden â€œJerboaâ€ by Random Animal; and the silly â€œMonkey Songâ€ by John Lasala, the Zesty Burrito and Simian Hu Flung Pu.\r\n</p>\r\n<p>\r\nFor a break from the obvious, the "Alphabets & Animals compilation" releases the most odd yet wonderfully original assemblage of music and noise available. And the cat-shaken- in-a-burlap-sack sound of Track 14 is something to behold."\r\n</p>\r\n<p>\r\nâ€” Dino Lull\r\n</p>', 0, 'alphabets-animals', 'Various Artists'),
(12, 'Compilation', 'Godxiliary', 'http://www.godxiliary.com', 'GXDL00', '202020', '2006-01-06', 'MP3', 'US', 'http://www.godxiliary.com/00.htm', '', '', '202020.png', '202020.png', 7683, 'image/png', '202020-th.png', '202020-th.png', 1396, 'image/png', '202020 project: for 20 months 20 musicians create 20 tracks', 0, '202020', 'Various Artists'),
(13, 'Compilation', 'Couch Fort Records', '', '', 'The Ottoman Empire', '2005-01-01', 'CD/MP3', 'US', 'http://www.archive.org/details/hemp004', '', '', 'ottoman.jpg', 'ottoman.jpg', 142475, 'image/jpeg', 'ottoman-th.jpg', 'ottoman-th.jpg', 40918, 'image/jpeg', '<p>The first of two 2005 compilation CD''s released by the now-defunct Couch Fort Records. Many of the artists featured here went on to become members of the Digital Vomit collective.\r\n</p>\r\n<p>\r\nLimited copies of this piece of cyberpunk history remain available; please see the "Album Notes."\r\n</p>', 0, 'The-Ottoman-Empire', 'Various Artists'),
(14, 'Compilation', '16 Color/CustomFlix', 'http://www.16color.com/', '', 'The Best of 16 Color', '2004-09-20', 'DVD', 'US', '', '', '', '16color.jpg', '16color.jpg', 45970, 'image/jpeg', '16color-th.jpg', '16color-th.jpg', 25561, 'image/jpeg', '<p>Between 1999 and 2004, over 40,000 movies were created on 16color website and showcased to the world. From stamp-sized drunken binges to lo-res mini-epics, this collection of 178 masterpieces is a true testament to the powers of pixelated procrastination.\r\n</p>\r\n<p>\r\nSet to the retro music of The 8bitpeoples, The Best of 16 Color will leave you yearning for the era of blips and bleeps. The 8bitpeoples are a group of artists seeking to push the boundaries of the early videogame aesthetic. Deriving inspiration from and working directly with hardware such as the Nintendo Entertainment System, GameBoy and Commodore 64, they repurpose these machines to write the music of a past that never was. Featuring tunes by Mesu Kasumai, Nullsleep, Sabastian Boaz, Role Model, minusbaby and Twilight Electric, this is the sound of yesterday''s future.\r\n</p>', 0, 'The-Best-of-16-Color', 'Various Artists'),
(15, 'Compilation', 'Hippocamp', 'http://hippocamp.net', '', 'Hippocamp Valentines Compilation 2004', '2004-02-15', 'MP3', 'GB', 'http://www.discogs.com/Various-Hippocamp-Valentines-Compilation-2004/release/233412', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Hippocamp annual Valentine''s Day compilation for 2004', 0, 'Hippocamp-Valentines-Compilation-2004', 'Various Artists'),
(21, 'Appears on', 'Gaijin Games', 'http://www.gaijingames.com', '884502776119', 'BIT.TRIP FATE [Original Soundtrack]', '2010-10-05', 'MP3', 'US', '', 'http://www.cdbaby.com/cd/gaijingames5', 'Â© 2010 Gaijin Games', 'bittripfate.jpg', 'bittripfate.jpg', 19017, 'image/jpeg', 'bittripfate-th.jpg', 'bittripfate-th.jpg', 6119, 'image/jpeg', '<p>BIT.TRIP FATE takes CommanderVideo to a darker place. The rhythms are heavy; the sound unlike anything he''s ever heard. Now you too can explore an unfamiliar and hypnotic genre mash-up wherein dubstep and chipmusic flirt with, and intoxicate your senses.\r\n</p>\r\n<p>\r\nIn a fitting guest-appearance, minusbaby lends two of his most sublime tracks to the album, just to get you in the mood.\r\n</p>\r\n<p>\r\nDiscover your own FATE as you continue your BIT.TRIP with this amazing audio companion.\r\n</p>', 0, 'BIT-TRIP-FATE-Original-Soundtrack', 'Various Artists'),
(17, 'Compilation', 'Hippocamp', 'http://hippocamp.net', '', 'Hippocamp Ruins Sgt. Peppers', '2005-12-10', 'MP3', 'GB', 'https://thepiratebay.org/torrent/4478118/hippocamp_ruins_sergeant_peppers', '', '', 'sgtpepper.jpg', 'sgtpepper.jpg', 203554, 'image/jpeg', 'sgtpepper-th.jpg', 'sgtpepper-th.jpg', 49671, 'image/jpeg', '', 0, 'Hippocamp-Ruins-Sgt-Peppers', 'Various Artists'),
(22, 'Appears on', 'Knifetank', 'http://knifetank.bandcamp.com', '', 'Knifetank (The Albumhole)', '2010-07-20', 'MP3', 'US', '', 'http://knifetank.bandcamp.com', '', 'knifetank_01.jpg', 'knifetank_01.jpg', 213201, 'image/jpeg', 'knifetank_01-th.jpg', 'knifetank_01-th.jpg', 44962, 'image/jpeg', '<p>\r\nBorn out of an HTML5 game, KnifeTank (The Albumhole) takes the game''s original chiptune score and mixes it with nerdcore hip hop and additional remixes. Turning it into a fantastic stand alone album. Play the original game at <a href="http://www.knifetanks.com">www.knifetanks.com</a>\r\n</p>\r\n<p>\r\nThe core music and production for the KnifeTank soundtrack was handled by <a href="http://www.crashfaster.com">crashfaster</a>.\r\n</p>\r\n<p>\r\n<a href="http://www.docpop.org">Doctor Popular</a> lent an hand with additional composition and contributed the organic sounds (guitar, beatbox, mouthharp, and kazoo) to the KnifeTank songs.\r\n</p>\r\n<p>\r\nVocals for "Crimson Dream" were recorded by <a href="http://www.unwoman.com">Unwoman</a> in her studio.\r\n</p>\r\n<p>\r\nAll other remixes and vocals recorded by the artists themselves.\r\n</p>', 0, 'Knifetank-The-Albumhole', 'Various Artists'),
(23, 'Compilation', '8bitpeoples', 'http://8bitpeoples.com', '8BP050', '8BP050', '2006-11-30', 'CD', 'US', 'https://www.8bitpeoples.com/store/product/71', 'https://www.8bitpeoples.com/store/product/71', 'CC', '8bp050.png', '8bp050.png', 71097, 'image/png', '8bp050-th.png', '8bp050-th.png', 43634, 'image/png', '8bitpeoples'' 50th release is a two-CD set bursting at the seams with 50 artists from around the world. It stands to be the definitive document of the low-bit underground. Professionally mastered, printed & pressed, with eye-popping artwork by minusbaby. Be the first on your block to own this shiny dual-disc slab of chiptune history.', 0, '8BP050', 'Various Artists'),
(24, 'Compilation', 'Receptors Music', 'http://receptorsmusic.com', 'RCP06', 'Wanna Hld Yr Handheld, Vol. 1', '2009-09-09', 'MP3', 'US', '', 'http://8bitoperators.bandcamp.com/album/wanna-hld-yr-handheld-vol-1', '', 'i_wanna_hld_yr_handheld_cover.jpg', 'i_wanna_hld_yr_handheld_cover.jpg', 38981, 'image/jpeg', 'i_wanna_hld_yr_handheld_cover-th.jpg', 'i_wanna_hld_yr_handheld_cover-th.jpg', 14127, 'image/jpeg', 'Almost 2 full years in the making, the 8-Bit Operators'' "Wanna Hld Yr Handheld, Vol. 1" Beatles tribute focuses on the glorious avant-garde and electronic side of the Fab 4 with over 20 of the biggest international names in 8-bit chip music, all utilizing the hardware of re-tooled, classic Game Boys, Ataris, Nintendo Entertainment Systems, circuit-bent toys, Commodore 64s and Apple II computers.', 0, 'Wanna-Hld-Yr-Handheld-Vol-1', 'Various Artists'),
(28, 'Appears on', 'Tettix', 'http://www.tettix.net', '', 'Tettix "A New Challenger!"', '2010-07-30', 'MP3', 'US', 'http://www.tettix.net/albums/a_new_challenger.html', '', 'CC', 'a_new_challenger_cover.jpg', 'a_new_challenger_cover.jpg', 426072, 'image/jpeg', 'a_new_challenger_cover-th.jpg', 'a_new_challenger_cover-th.jpg', 36933, 'image/jpeg', '<p>\r\n<b>Did you get everyone involved you wanted?</b>\r\n</p>\r\n<p>\r\nI had the whole thing buttoned up and ready to release. And then minusbaby got back to me three weeks after I emailed him and wanted to remix Clothesline. Obviously, I wanted him involved so I decided to hold off the release. His sudden unexpected inclusion was also when I got the "A New Challenger!" idea. So what was once "Disasterpeace''s Dragon Fist Rising Mix" became "Disasterpeace vs. Dragon Punch!" and so on. I wrote the interstitial tracks, which were a ton of fun. Might do an extended mix of Continue, too. And then rebuttoned the album up for release. I''m glad minusbaby was such a late-comer, I think the album concept is much stronger because of it. And his remix is sick.\r\n</p>\r\n\r\nâ€” From "<a href="http://boingboing.net/2010/07/30/how-tettix-tried-to.html">How Tettix tried to design a T-shirt and ended up with a remix album</a>" (Boing Boing &middot; Friday, July 30, 2010)', 0, 'Tettix-A-New-Challenger', 'Various Artists'),
(25, 'Compilation', 'Locomalito', 'http://www.locomalito.com', '', 'Hydorah [Original and Arranged Tracks]', '2011-03-14', 'CD/MP3', 'ES', 'http://hydorah.bandcamp.com', '', '', 'hydorah_cover.jpg', 'hydorah_cover.jpg', 150627, 'image/jpeg', 'hydorah_cover-th.jpg', 'hydorah_cover-th.jpg', 28475, 'image/jpeg', '<iframe src="http://player.vimeo.com/video/7066986?title=0&amp;byline=0&amp;portrait=0" width="450" height="225" frameborder="0"></iframe>', 0, 'Hydorah-Original-and-Arranged-Tracks', 'Various Artists'),
(27, 'Compilation', '8bitpeoples', 'http://8bitpeoples.com', '8BP100', 'Blip Festival 2008: 32 Live Recordings', '2009-08-22', 'CD', 'US', '', 'https://www.8bitpeoples.com/store/product/65', '', '8bp100_cover.png', '8bp100_cover.png', 2570, 'image/png', '8bp100_cover-th.png', '8bp100_cover-th.png', 1368, 'image/png', '<p>"For a scene and a subculture not known to put a great emphasis on the physicality of an album or an EP, a scene which thrives and prides itself on the free exchange of digital music, this is the right record to make tangible. Milestones should be marked by monuments, and this is the second time 8bitpeoples have done so: with the 2xCD 8BP50 CD after the first Blip Festival, and now with this; 8BP100 â€” so you can see just how far it''s all come. Now take this artifact in your hands, press play on your system, inspect the pretty parcel it came in until you''ve unlocked its every secret, then turn up the volume, close your eyes, and picture yourself there."\r\n</p>\r\n<p>\r\nâ€” <a href="http://www.nattyadams.com">Nathaniel Adams</a>\r\n</p>', 0, 'Blip-Festival-2008-32-Live-Recordings', 'Various Artists'),
(29, 'Appears on', 'monobomb/343 Industries', '', '', '"Grandmaster Chief"', '2010-10-27', 'MP3', 'US', 'http://freemusicarchive.org/music/fasterbaby/~/Grandmaster_Chief', '', 'CC', 'grandmaster_chief_cover.png', 'grandmaster_chief_cover.png', 2070, 'image/png', 'grandmaster_chief_cover-th.png', 'grandmaster_chief_cover-th.png', 667, 'image/png', '<p>\r\nSoaked in sangria and beer at a pre-PAX industry party in Seattle this past August, <a href="http://crashfaster.com">crashfaster</a> and I were asked by one of its producers to write a cover of the "<b>Halo</b>" theme for a "<b>Halo: Reach</b>" event in two days. Her only rule was for it to include the Monk chant.\r\n</p>\r\n <p>\r\nIt was featured in the Halo Waypoint 343 Sparkast on <a href="http://halo.xbox.com/forums/f/14/t/1309.aspx">October 27th, 2010</a>.\r\n</p>', 0, 'Grandmaster-Chief', 'fasterbaby'),
(30, 'Compilation', '8bitpeoples', 'http://8bitpeoples.com', '8BP105', 'Data Drop: 12 Tracks for Co-Conspirators', '2010-02-25', 'MP3', 'US', '', '', '', 'conspirators_cover.png', 'conspirators_cover.png', 22312, 'image/png', 'conspirators_cover-th.png', 'conspirators_cover-th.png', 8361, 'image/png', '<p>"Data Drop: 12 Tracks For Co-Conspirators," is an exclusive collection of previously unreleased tracks by Blip Festival 2009 participants; made available only to the event''s supporters and donors.\r\n</p>\r\n<p>\r\n8bitpeoples, The Tank, and the Blip Festival crew extend our genuine thanks to you for ensuring that Blip Festival 2009 took place, and we hope you enjoy the release.\r\n</p>', 0, 'Data-Drop-12-Tracks-for-Co-Conspirators', 'Various Artists'),
(31, 'Compilation', '8bitpeoples', 'http://8bitpeoples.com', '', 'Blip Festival 2007: The Videos', '2008-12-05', 'DVD', 'US', '', 'https://www.8bitpeoples.com/store/product/62', '', 'blip_2007_dvd_cover.jpg', 'blip_2007_dvd_cover.jpg', 288554, 'image/jpeg', 'blip_2007_dvd_cover-th.jpg', 'blip_2007_dvd_cover-th.jpg', 55628, 'image/jpeg', '<iframe src="http://player.vimeo.com/video/2471908?byline=0&amp;portrait=0" width="450" height="300" frameborder="0"></iframe>\r\n<p>\r\nIn 2007, musicians and artists from around the world assembled in New York City to participate in the second annual <a href="http://blipfestival.org">Blip Festival</a>. Curated and organized by 8bitpeoples and The Tank, this four-day event showcased the untapped potential of low-bit home computer and game consoles used as creative audio and video tools.\r\n</p>\r\n<p>\r\n2 Player Productions is proud to present this DVD video compilation, featuring one track from each of the festival''s 32 performers. Unrestricted camera access positions the viewer directly between a surging crowd and a bracing wall of sound, one built upon familiar technology turned on its ear.\r\n</p>', 0, 'Blip-Festival-2007-The-Videos', 'Various Artists');
-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(32) NOT NULL auto_increment,
  `title` varchar(140) default NULL,
  `start_time` datetime default NULL,
  `their_description` text,
  `my_description` text,
  `venue_id` int(32) NOT NULL default '0',
  `age` varchar(140) default NULL,
  `price` varchar(140) default NULL,
  `byob` tinyint(1) default '0',
  `rsvp_url` text,
  `external_url` text,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  `event_file_path` text,
  `event_file_name` varchar(140) default NULL,
  `event_file_size` int(32) default NULL,
  `event_content_type` varchar(140) default NULL,
  `facebook_url` text,
  `lastfm_url` text,
  `mp3_url` text,
  `end_date` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `start_time`, `their_description`, `my_description`, `venue_id`, `age`, `price`, `byob`, `rsvp_url`, `external_url`, `created`, `modified`, `event_file_path`, `event_file_name`, `event_file_size`, `event_content_type`, `facebook_url`, `lastfm_url`, `mp3_url`, `end_date`) VALUES
(1, '8static', '2011-02-19 19:00:00', 'First up, we have crashfaster from San Francisco in his 8static debut. Also making his 8static debut is PrincetonÃ¢â‚¬â„¢s own Decktonic, who has been rocking open mic with his DS-10 for quite a few months now. Thankfully minusbaby is back again from NYC, with noteNdo on visuals all night long. Before the main show and open mic there is a talk on Creative Commons and licensing your music by Bit Shifter. Make sure to check the Events page for a lengthy description.', '', 1, 'All Ages', '$8 &bull; $5 with RSVP', 0, 'http://tinyurl.com/8staticFeb11RSVP', 'http://8static.com', '2011-02-11 02:20:09', '2011-05-14 19:54:45', NULL, NULL, NULL, NULL, '', '', '', NULL),
(2, 'Pulsewave', '2011-02-26 20:00:00', 'No one will be safe at the next Pulsewave, where candy-coated valentines will exchange blows with pitiless carnality on a sweaty dancefloor smitten by jiggling naughty bits; and you''ll love them for it.', '', 2, 'All Ages', '$10', 0, '', 'http://pulsewavenyc.com', '2011-02-11 02:20:09', '2011-04-26 17:59:04', '4db76a58-eecc-4cfa-beb3-7eee400dc0a6.png', 'pulsewave-feb_11.png', 7959, 'image/png', '', '', '', NULL),
(3, 'New York&mdash;Tokyo Game Night', '2010-11-30 00:00:00', NULL, NULL, 3, NULL, NULL, 0, NULL, 'http://www.newyork-tokyo.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'FILE HipersÃ´nica', '2011-04-03 19:00:00', 'O HipersÃ´nica Encontro acontece como um espaÃ§o para alÃ©m da apresentaÃ§Ã£o de espetÃ¡culos; um evento experimental em que qualquer um poderÃ¡ entregar propostas de trabalho em dvd ou cd para a equipe do HipersÃ´nica Rio 2011, expor a sua opiniÃ£o e ter contato direto com os convidados e com a produÃ§Ã£o do festival. Na programaÃ§Ã£o, artistas que constroem seus prÃ³prios instrumentos com diversos materiais e tÃ©cnicas que propÃµem formas contemporÃ¢neas de se produzir sonoridades eletrÃ´nicas. ', '', 6, '16+', 'R$0', 0, '', 'http://www.hipersonica.org', '2011-03-23 02:02:42', '2011-04-26 17:49:24', '4d9f3bb5-2dd0-4d09-963a-0dab400dc0a6.png', 'filehipersonica11.png', 43150, 'image/png', '', '', '', NULL),
(73, 'Blip Festival 2011', '2011-05-19 00:00:00', 'Entering its fifth year, this iteration of Blip Festival showcases an international chip community that stands at a crossroads. Now firmly entrenched in mainstream culture with chipsounds and pixel art finding their way into television, motion pictures, and ironically enough, modern video games, Chip musicians and artists find they are no longer expected to educate their audiences but, instead, are free to innovate. As the community becomes less of a genre and more of an ethos, documenting the ever-growing diversification of the community is the Blip Festival''s top goal.', 'I play on Thursday, May 19th at 10:40 PM, in case you need to know specifically. But you ought to come out for all three nights. C''mon now. It''s Blip Festival.', 48, 'All Ages', '3-day pass: $51.70<br />1-day pass: $20.00', 0, 'http://blipfestival.org/2011/tickets', 'http://blipfestival.org/2011/', '2011-04-08 10:25:11', '2011-05-04 12:35:44', '4db87aa0-3e4c-4e94-a6a9-4cea400dc0a6.gif', 'blip_11_banner.gif', 112243, 'image/gif', 'https://www.facebook.com/event.php?eid=105798896165311', 'http://www.last.fm/festival/1907456+Blip+Festival+New+York', '', '2011-05-21'),
(7, 'The Engadget Show', '2011-03-25 19:00:00', 'Attention humans, the Engadget Show is back next Friday, March 25th at 7:00pm with HP''s Jon Rubinstein at The Times Center in New York City, and you can win a free trip for two to the taping! Josh will be sitting down the former Palm CEO (current HP Senior VP) to get the inside scoop on everything from the TouchPad, new Pre 3, Veer, the state of WebOS, and much more! Trust us when we say that you won''t want to miss it. What''s more, our very own Joanna Stern will be demoing the Samsung 9 Series laptop, we''ll have the Nintendo 3DS on stage for a live demo, and special guests Nilay Patel and Paul Miller will be joining the roundtable! We''ll also have the usual slew of insane giveaways and rocking chiptunes music, as well as some more surprises!', '', 7, 'All Ages', '$0', 0, '', 'http://www.engadget.com/2011/03/18/the-engadget-show-with-jon-rubinstein-next-friday-march-25th', '2011-03-23 02:11:55', '2011-04-08 09:55:10', '4d9f3dee-b7b0-4872-bc32-151e400dc0a6.jpg', 'engadgetshow.jpg', 72577, 'image/jpeg', '', '', '', NULL),
(9, 'Independent Games Festival', '2010-11-18 20:00:00', '', '', 11, '', '', 0, '', 'http://www.igf.com/2010/11/independent_games_festival_bab.html', NULL, '2011-04-26 18:19:23', '4db76f1a-dcc4-4031-bc5d-071c400dc0a6.jpg', '2010-11-18_babycastles.jpg', 144482, 'image/jpeg', '', '', '', NULL),
(10, 'LoveSac Speedrun Classic: Finale', '2010-10-20 20:00:00', NULL, NULL, 12, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Music Night', '2010-09-17 20:00:00', '', '', 13, '', '', 0, '', 'http://kokorostudio.us', NULL, '2011-04-26 18:20:07', '4db76f47-1c24-4355-9b04-0ad2400dc0a6.jpg', '20100917-kokoro_studio_02.jpg', 140490, 'image/jpeg', '', '', '', NULL),
(12, 'PAX 2010', '2010-09-04 20:00:00', NULL, NULL, 14, NULL, NULL, 0, NULL, 'http://paxsite.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '8bitSF', '2010-08-29 20:00:00', '', '', 15, '', '', 0, '', 'http://8bitsf.com', NULL, '2011-04-26 19:58:18', '4db76f68-ad98-4f35-a207-0e5d400dc0a6.jpg', '20100829-dna_lounge.jpg', 115866, 'image/jpeg', '', '', 'http://freemusicarchive.org/music/minusbaby/8bitSF_at_DNA_Lounge_San_Francisco', NULL),
(14, 'Nullbits', '2010-08-20 20:00:00', '', '', 16, '', '', 0, '', 'http://chippanze.org/nullbits', NULL, '2011-04-26 18:21:12', '4db76f88-aec0-44a0-a1f3-119d400dc0a6.jpg', 'nullbits.jpg', 209728, 'image/jpeg', '', '', '', NULL),
(15, 'FILE Hipers&#244;nica', '2010-07-27 20:00:00', NULL, NULL, 17, NULL, NULL, 0, NULL, 'http://www.filefestival.org/site_2007/pagina_conteudo_livre.asp?a1=309&a2=708&id=2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Beyond the Welding Hour', '2010-07-17 20:00:00', '', '', 18, '', '', 0, '', '', NULL, '2011-04-26 18:21:50', '4db76fae-23d0-4244-afe0-1572400dc0a6.png', 'the_new_hope.png', 151260, 'image/png', '', '', '', NULL),
(17, '60Hz Beta Beat', '2010-07-10 20:00:00', NULL, NULL, 19, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'WFMU on the High Line', '2010-05-31 20:00:00', NULL, NULL, 20, NULL, NULL, 0, NULL, 'http://blog.wfmu.org/freeform/2010/05/monday-wfmu-live-on-the-high-line-f-djrupture-minusbaby-dj-trent-live-stargazing.html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'I/O:QNS', '2010-04-22 20:00:00', '', '', 21, '', '', 0, '', 'http://ioshownyc.blogspot.com', NULL, '2011-04-26 18:22:57', '4db76ff1-6480-4d9c-9575-1ca9400dc0a6.png', '042210-ioqns.png', 119288, 'image/png', '', '', '', NULL),
(21, 'Forward Music', '2010-02-11 20:00:00', '', '', 23, '', '', 0, '', 'http://www.facebook.com/event.php?eid=432619200440', NULL, '2011-04-26 19:57:40', '', NULL, NULL, NULL, '', '', 'http://freemusicarchive.org/music/minusbaby/minusbaby_-_Singles_1918', NULL),
(22, 'I/O', '2010-02-01 20:00:00', '', '', 24, '', '', 0, '', 'http://ioshownyc.blogspot.com/2009/12/feb-1.html', NULL, '2011-04-26 18:29:00', '4db7715c-e228-474d-9727-46f5400dc0a6.gif', 'i-o_020110-front-460x660.gif', 7687, 'image/gif', '', '', '', NULL),
(23, 'Chiptune III', '2010-01-14 20:00:00', '', '', 25, '', '', 0, '', 'http://boston8bit.com/index.php?option=com_content&view=article&id=21:thu-jan-14-chiptune-3-live-at-the-middle-east&catid=12:shows', NULL, '2011-04-26 18:30:07', '4db7719e-ea8c-4b64-a9ca-4d17400dc0a6.jpg', '011410.jpg', 124148, 'image/jpeg', '', '', '', NULL),
(24, 'Blip Festival 2009', '2009-12-17 20:00:00', '', '', 26, '', '', 0, '', 'http://blipfestival.org/2009', NULL, '2011-04-26 19:59:27', '4db771b7-da44-46a0-a3d7-50c0400dc0a6.gif', 'blip_2009.gif', 10591, 'image/gif', '', '', 'http://freemusicarchive.org/music/minusbaby/~/Flying_Live_at_Blip_Festival_2009', NULL),
(25, 'Data Beez', '2009-11-20 20:00:00', '', '', 27, '', '', 0, '', '', NULL, '2011-04-26 18:31:06', '4db771d9-2590-4b22-b971-55ae400dc0a6.gif', '112009.gif', 20084, 'image/gif', '', '', '', NULL),
(26, 'Data Beez', '2009-11-18 20:00:00', '', '', 28, '', '', 0, '', '', NULL, '2011-04-26 18:33:54', '4db77282-b300-4b79-b5ca-5ef0400dc0a6.gif', 'db_03.gif', 20820, 'image/gif', '', '', '', NULL),
(27, 'Data Beez/Giant Robot 2', '2009-11-07 20:00:00', '', '', 29, '', '', 0, '', '', NULL, '2011-04-26 18:34:29', '4db772a5-3674-4cd4-82cd-6434400dc0a6.gif', 'db_01.gif', 27029, 'image/gif', '', '', '', NULL),
(28, 'Noise Channel', '2009-11-04 20:00:00', '', '', 30, '', '', 0, '', '', NULL, '2011-04-26 18:34:51', '4db772ba-099c-43cb-8497-67ba400dc0a6.gif', '110409.gif', 16382, 'image/gif', '', '', '', NULL),
(29, '8static Anniversary After-party', '2009-10-10 20:00:00', '', '', 31, '', '', 0, '', '', NULL, '2011-03-28 17:00:14', NULL, NULL, NULL, NULL, '', '', '', NULL),
(30, 'ITP TNO', '2009-09-24 20:00:00', '', '', 32, '', '', 0, '', '', NULL, '2011-04-26 18:35:54', '4db772fa-d4b4-4dce-95e6-713a400dc0a6.gif', '092409.gif', 16851, 'image/gif', '', '', '', NULL),
(31, 'RockEM SockEM', '2009-09-11 20:00:00', '', '', 33, '', '', 0, '', '', NULL, '2011-04-26 18:36:12', '4db7730c-e8b8-41d1-a194-73d1400dc0a6.gif', '091109.gif', 12167, 'image/gif', '', '', '', NULL),
(32, 'Festival de M&uacute;sica Electr&oacute;nica Latina', '2009-08-29 20:00:00', '', '', 34, '', '', 0, '', '', NULL, '2011-04-26 18:36:32', '4db7731f-37d8-465a-80b0-76cf400dc0a6.jpg', '082909.jpg', 33531, 'image/jpeg', '', '', '', NULL),
(33, 'Buenos Amigos: The Show', '2009-08-25 20:00:00', '', '', 35, '', '', 0, '', '', NULL, '2011-04-26 18:36:52', '4db77334-1ad8-4a8a-b726-7950400dc0a6.gif', '082509.gif', 16377, 'image/gif', '', '', '', NULL),
(34, 'Budapest Micro II', '2009-08-01 20:00:00', '', '', 36, '', '', 0, '', '', NULL, '2011-04-26 18:37:09', '4db77345-2538-469f-8fca-7abe400dc0a6.jpg', '080109.jpg', 176856, 'image/jpeg', '', '', '', NULL),
(35, 'Era New Horizons', '2009-07-30 19:00:00', '', '', 37, '', '', 0, '', '', NULL, '2011-04-26 18:37:35', '4db7735f-f914-4ca3-a89a-7dfa400dc0a6.jpg', '073009.jpg', 154231, 'image/jpeg', '', '', '', NULL),
(36, 'Era New Horizons', '2009-07-30 20:00:00', '', '', 38, '', '', 0, '', '', NULL, '2011-03-28 17:02:06', NULL, NULL, NULL, NULL, '', '', '', NULL),
(37, 'Blip Festival Europe', '2009-07-24 20:00:00', '', '', 39, '', '', 0, '', '', NULL, '2011-03-28 17:02:34', NULL, NULL, NULL, NULL, '', '', '', NULL),
(38, 'Chipfest IV', '2009-07-12 20:00:00', '', '', 40, '', '', 0, '', '', NULL, '2011-04-26 18:38:02', '4db7737a-eaa8-4d13-abc3-021b400dc0a6.jpg', '071209.jpg', 345392, 'image/jpeg', '', '', '', NULL),
(39, 'Bleep London', '2009-07-11 20:00:00', '', '', 41, '', '', 0, '', '', NULL, '2011-04-26 18:38:22', '4db7738e-c950-4ef8-bb19-04dd400dc0a6.jpg', '071109.jpg', 262246, 'image/jpeg', '', '', '', NULL),
(40, 'Godxiliary Tour: NYC', '2009-06-21 20:00:00', '', '', 42, '', '', 0, '', '', NULL, '2011-04-26 18:38:46', '4db773a5-e8bc-41e3-b13c-07d2400dc0a6.jpg', '062109.jpg', 191201, 'image/jpeg', '', '', '', NULL),
(41, 'S&oacute;lo Dame Indie Pop', '2009-05-17 20:00:00', '', '', 43, '', '', 0, '', '', NULL, '2011-04-26 19:17:14', '4db77ca9-3d7c-4fef-8f5a-7b0b400dc0a6.gif', '051709.gif', 143781, 'image/gif', '', '', '', NULL),
(42, '', '2009-01-28 20:00:00', '', '', 44, '', '', 0, '', '', NULL, '2011-04-27 06:07:04', '4db814f8-680c-4dc0-83f5-515b400dc0a6.gif', '012809.gif', 9174, 'image/gif', '', '', '', NULL),
(43, 'BYTE.BYTE.BYTE', '2008-08-08 20:00:00', '', '', 45, '', '', 0, '', '', NULL, '2011-04-27 10:11:56', '4db84e5c-10e0-47c5-bb29-7353400dc0a6.png', '080808.png', 6229, 'image/png', '', '', '', NULL),
(44, '*SUPERNESS*', '2008-07-16 20:00:00', '', '', 46, '', '', 0, '', '', NULL, '2011-04-27 13:00:00', '4db875c0-55d0-497a-97df-5fab400dc0a6.gif', 'superness.gif', 15842, 'image/gif', '', '', '', NULL),
(45, 'Joy Decoy', '2008-05-31 20:00:00', '', '', 47, '', '', 0, '', '', NULL, '2011-04-27 12:57:17', '4db8751d-6f6c-4131-8933-4db5400dc0a6.gif', 'joy_decoy-053108.gif', 19941, 'image/gif', '', '', '', NULL),
(46, 'Blip Festival 2007', '2007-11-30 20:00:00', NULL, NULL, 48, NULL, NULL, 0, NULL, 'http://blipfestival.org/2007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'International Chiptune Resistance', '2006-06-08 20:00:00', NULL, NULL, 49, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'S900/Plug', '2004-11-27 20:00:00', NULL, NULL, 50, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, '', '2004-11-13 20:00:00', NULL, NULL, 51, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '2nd GB Music Match', '2004-04-25 20:00:00', NULL, NULL, 52, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'DMZ Media Arts Festival', '2003-11-15 20:00:00', '', '', 53, '', '', 0, '', 'http://archive.rhizome.org/digest/?msg=00088', NULL, '2011-04-27 10:01:59', '', NULL, NULL, NULL, '', '', '', NULL),
(52, 'Micromusic NYC', '2003-08-02 20:00:00', '', '', 54, '', '', 0, '', '', NULL, '2011-04-28 12:34:31', '4db9c147-404c-48f0-a311-13e8400dc0a6.gif', '080203_mmnyc.gif', 10458, 'image/gif', '', '', '', NULL),
(53, 'Micromusic NYC', '2002-04-18 20:00:00', NULL, NULL, 55, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Blip', '2001-07-18 20:00:00', '', '', 56, '', '', 0, '', '', NULL, '2011-04-27 09:54:38', '4db84a4e-e150-4a0c-b2d0-08e3400dc0a6.jpg', 'blip_2001.jpg', 172699, 'image/jpeg', '', '', '', NULL),
(55, 'Data Beez', '2009-11-12 00:00:00', '', '', 15, '', '', 0, '', '', '2011-03-28 17:59:22', '2011-04-26 18:34:10', '4db77292-81bc-4513-ac6f-6132400dc0a6.gif', 'db_02.gif', 21689, 'image/gif', '', '', '', NULL),
(56, 'Bang!', '2009-07-16 00:00:00', '', '', 58, '', '', 0, '', 'http://www.planobporto.com/index.php?opcao=2&tipo=-2&id=806&ling=1', '2011-03-28 18:00:09', '2011-04-20 21:13:46', '4dafaefa-b0f8-4672-9e86-64d6400dc0a6.gif', '071609.gif', 22363, 'image/gif', '', '', '', NULL),
(57, 'Pulsewave', '2009-05-30 00:00:00', '', '', 2, '', '', 0, '', '', '2011-03-28 18:00:48', '2011-04-26 19:14:41', '4db77c11-02dc-45cc-9e55-1ad6400dc0a6.gif', '053009.gif', 26166, 'image/gif', '', '', '', NULL),
(58, '8static', '2009-04-11 00:00:00', '', '', 1, '', '', 0, '', '', '2011-03-28 18:01:44', '2011-04-26 19:17:56', '4db77cd4-2020-4f55-8d4b-0264400dc0a6.png', '041109.png', 83060, 'image/png', '', '', '', NULL),
(59, 'Pulsewave', '2009-01-31 00:00:00', '', '', 2, '', '', 0, '', '', '2011-03-28 18:02:25', '2011-04-27 06:06:51', '4db814eb-5e8c-442a-94a3-4ff8400dc0a6.gif', '013109.gif', 22089, 'image/gif', '', '', '', NULL),
(60, 'RockEM SockEM', '2009-01-09 00:00:00', '', '', 33, '', '', 0, '', '', '2011-03-28 18:04:47', '2011-04-27 06:07:21', '4db81509-47a8-469e-be3a-52f0400dc0a6.gif', '010909.gif', 8580, 'image/gif', '', '', '', NULL),
(61, 'Pulsewave', '2010-11-20 00:00:00', '', '', 2, '', '', 0, '', '', '2011-03-28 18:07:33', '2011-04-26 18:18:37', '4db76eec-0f5c-42f2-8713-0392400dc0a6.gif', 'pulsewave-nov_10_v2.gif', 21445, 'image/gif', '', '', '', NULL),
(62, 'The Engadget Show', '2010-05-22 00:00:00', '', '', 7, '', '', 0, '', 'http://www.engadget.com/show', '2011-03-28 18:08:35', '2011-04-26 19:59:51', '', NULL, NULL, NULL, '', '', 'http://freemusicarchive.org/music/minusbaby/~/minusbaby-santeria_no_2_engadget_version', NULL),
(63, 'Pulsewave', '2010-03-20 20:00:00', '', '', 2, '', '', 0, '', 'http://pulsewavenyc.com', '2011-03-28 18:09:47', '2011-04-26 18:23:31', '4db77013-7b74-4534-8631-21aa400dc0a6.gif', 'pulsewave-mar_10-460wide.gif', 15161, 'image/gif', '', '', '', NULL),
(64, 'The Engadget Show', '2010-03-20 15:00:00', '', '', 7, '', '', 0, '', 'http://www.engadget.com/show', '2011-03-28 18:11:03', '2011-03-28 18:11:41', NULL, NULL, NULL, NULL, '', '', '', NULL),
(65, 'Blip Festival 2008', '2008-12-06 23:00:00', '', '', 26, '', '', 0, '', 'http://blipfestival.org/2008', '2011-03-28 18:13:01', '2011-04-27 06:11:10', '4db815ed-ac24-43dc-82a6-29f2400dc0a6.gif', 'blip_vv_banner.gif', 19413, 'image/gif', '', '', '', NULL),
(66, '', '2008-10-29 21:00:00', '', '', 44, '', '', 0, '', '', '2011-03-28 18:13:44', '2011-03-28 18:13:44', NULL, NULL, NULL, NULL, '', '', '', NULL),
(67, 'Less Than Three', '2008-06-14 21:00:00', '', '', 2, '', '', 0, '', '', '2011-03-28 18:14:29', '2011-04-27 12:58:50', '4db8757a-3c20-4df3-95c6-57af400dc0a6.gif', 'less_than_three-061408.gif', 16782, 'image/gif', '', '', '', NULL),
(68, 'Pulsewave', '2008-03-29 20:00:00', '', '', 2, '', '', 0, '', 'http://pulsewavenyc.com', '2011-03-28 18:15:35', '2011-04-27 12:58:16', '4db87558-be58-4474-9b64-549f400dc0a6.png', 'pulsewave_2008_01.png', 24097, 'image/png', '', '', '', NULL),
(69, 'Pulsewave', '2006-09-23 20:00:00', '', '', 2, '', '', 0, '', 'http://pulsewavenyc.com', '2011-03-28 18:16:31', '2011-03-28 18:16:43', NULL, NULL, NULL, NULL, '', '', '', NULL),
(70, 'Plug', '2003-11-14 00:00:00', '', '', 50, '', '', 0, '', '', '2011-03-28 18:17:38', '2011-04-27 09:59:27', '4db84b6f-b598-4b58-98f6-1b7a400dc0a6.gif', '111403_plug.gif', 11677, 'image/gif', '', '', '', NULL),
(71, 'GB Music Match', '2003-04-27 00:00:00', '', '', 52, '', '', 0, '', '', '2011-03-28 18:18:21', '2011-03-28 18:18:21', NULL, NULL, NULL, NULL, '', '', '', NULL),
(72, 'DOPE: GDC Edition', '2011-03-04 00:00:00', '', '', 57, '', '', 0, '', '', '2011-03-28 18:28:08', '2011-03-28 18:28:08', NULL, NULL, NULL, NULL, '', '', '', NULL),
(74, 'DOG909', '2011-04-14 20:00:00', '', '', 59, '', '', 0, '', 'http://dog.tv.br/dogcaffe', '2011-04-20 10:02:41', '2011-04-20 10:02:41', '4daf11b0-c860-4cac-ab91-7305400dc0a6.png', 'dog909_20110414-500x700.png', 6352, 'image/png', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(32) NOT NULL auto_increment,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  `icon` varchar(140) default NULL,
  `name` varchar(140) NOT NULL default '',
  `tag` varchar(140) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `created`, `modified`, `icon`, `name`, `tag`) VALUES
(2, NULL, '2011-02-28 00:54:34', NULL, 'Homes Ã‚Â· Outside', 'thatsafinehomesoutside'),
(3, NULL, '2011-02-28 00:54:34', NULL, 'bandeirante', 'bandeirante'),
(4, NULL, '2011-02-28 00:54:34', NULL, 'saskrotch', 'saskrotch');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `id` int(32) NOT NULL auto_increment,
  `name` text NOT NULL,
  `country` varchar(2) default NULL,
  `url` text,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=122 ;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `name`, `country`, `url`, `created`, `modified`) VALUES
(3, '8bit today', 'NL', 'http://8bittoday.com', NULL, '2011-06-01 19:50:36'),
(4, '8GB', 'AR', 'http://kikencorp.com', NULL, '2011-06-01 19:50:36'),
(6, 'Animal Style', 'US', 'http://animal-style.com', NULL, '2011-06-01 19:50:36'),
(7, 'Argumentativa', 'US', 'http://argumentativa.com', NULL, '2011-06-01 19:50:36'),
(8, 'Arturo en el Barco', 'US', 'http://www.arturoenelbarco.com', NULL, '2011-06-01 19:50:37'),
(9, 'Babycastles', 'US', 'http://babycastles.com', NULL, '2011-06-01 19:50:37'),
(10, 'BalÃºn', 'US', 'http://balunonline.com', NULL, '2011-06-01 19:50:37'),
(11, 'Bit Shifter', 'US', 'http://bit.shifter.net', NULL, '2011-06-01 19:50:37'),
(12, 'Boston 8-bit', 'US', 'http://www.boston8bit.com', NULL, '2011-06-01 19:50:37'),
(13, 'Brandon Boyer', 'US', 'http://www.brandonnn.com', NULL, '2011-06-01 19:50:37'),
(14, 'Bubblyfish', 'US', 'http://bubblyfish.com', NULL, '2011-06-01 19:50:37'),
(15, 'Burnkit2600', 'US', 'http://burnkit2600.com', NULL, '2011-06-01 19:50:37'),
(16, 'Cheap Dinosaurs', 'US', 'http://filefreakout.com/cheapdinosaurs', NULL, '2011-06-01 19:50:38'),
(17, 'Chika Iijima', 'US', 'http://imagima.com', NULL, '2011-06-01 19:50:38'),
(18, 'Chipmusic.org', 'US', 'http://chipmusic.org', NULL, '2011-06-01 19:50:38'),
(19, 'Chippanze', 'BR', 'http://chippanze.org', NULL, '2011-06-01 19:50:38'),
(20, 'crashfaster', 'US', 'http://crashfaster.com', NULL, '2011-06-01 19:50:39'),
(21, 'Dorian Wood', 'US', 'http://www.dorianwood.com', NULL, '2011-06-01 19:50:40'),
(22, 'Droid-On', 'BR', 'http://www.myspace.com/droidon', NULL, '2011-06-01 19:50:40'),
(23, 'enso', 'US', 'http://enso.tumblr.com', NULL, '2011-06-01 19:50:41'),
(24, 'exileFaker', 'US', 'http://www.myspace.com/exilefaker', NULL, '2011-06-01 19:50:41'),
(25, 'foci + loci', 'US', 'http://tamarayadao.com/foci+loci.html', NULL, '2011-06-01 19:50:41'),
(26, 'Frank William Miller, Jr.', 'US', 'http://fwmj.com', NULL, '2011-06-01 19:50:41'),
(27, 'Free Music Archive', 'US', 'http://freemusicarchive.org', NULL, '2011-06-01 19:50:42'),
(28, 'Gaijin Games', 'US', 'http://gaijingames.com', NULL, '2011-06-01 19:50:42'),
(29, 'glomag', 'US', 'http://glomag.com', NULL, '2011-06-01 19:50:42'),
(30, 'Godxiliary', 'US', 'http://godxiliary.com', NULL, '2011-06-01 19:50:42'),
(31, 'Ill Doctrine', 'US', 'http://illdoctrine.com', NULL, '2011-06-01 19:50:43'),
(32, 'Jemma Hostetler', 'US', 'http://www.jemmahostetler.com', NULL, '2011-06-01 19:50:43'),
(33, 'Joseph Meyer', 'US', 'http://www.drawjoedraw.com', NULL, '2011-06-01 19:50:43'),
(34, 'Julie West', 'US', 'http://www.juliewest.com', NULL, '2011-06-01 19:50:44'),
(35, 'Machine Drum', 'US', 'http://machinedrum.net', NULL, '2011-06-01 19:50:45'),
(36, 'Mar HernÃ¡ndez', 'ES', 'http://malotaprojects.com', NULL, '2011-06-01 19:50:45'),
(37, 'Max ZT', 'US', 'http://maxzt.com', NULL, '2011-06-01 19:50:45'),
(38, 'MeNeO', 'ES', 'http://www.entter.com/meneo', NULL, '2011-06-01 19:50:45'),
(39, 'Mikrosopht', 'US', 'http://mikrosopht.godxiliary.com', NULL, '2011-06-01 19:50:46'),
(40, 'Mr. Spastic', 'US', 'http://mrspastic.com', NULL, '2011-06-01 19:50:46'),
(41, 'Neil Voss', 'US', 'http://neilvoss.com', NULL, '2011-06-01 19:50:46'),
(42, 'NO CARRIER', 'US', 'http://no-carrier.com', NULL, '2011-06-01 19:50:47'),
(43, 'noteNdo', 'US', 'http://notendo.com', NULL, '2011-06-01 19:50:47'),
(44, 'Nullsleep', 'US', 'http://nullsleep.com', NULL, '2011-06-01 19:50:47'),
(45, 'O2Star', 'US', 'http://www.oxygenstarpower.com', NULL, '2011-06-01 19:50:47'),
(47, 'Paris Treantafeles', 'US', 'http://parisgraphics.com', NULL, '2011-06-01 19:50:48'),
(48, 'Psignal', 'GB', 'http://psignal.com', NULL, '2011-06-01 19:50:48'),
(49, 'Pulselooper', 'BR', 'http://www.myspace.com/pulselooper', NULL, '2011-06-01 19:50:48'),
(50, 'Rappers I Know', 'US', 'http://rappersiknow.com', NULL, '2011-06-01 19:50:49'),
(51, 'Rhinostrich', 'US', 'http://www.rhinostrich.com', NULL, '2011-06-01 19:50:49'),
(52, 'Romy Ilano', 'US', 'http://www.miromi.com', NULL, '2011-06-01 19:50:49'),
(53, 'starPause', 'US', 'http://starpause.com', NULL, '2011-06-01 19:50:49'),
(54, 'Subway Sonicbeat', 'BR', 'http://www.subwaysonicbeat.kit.net', NULL, '2011-06-01 19:50:50'),
(55, 'sylcmyk', 'US', 'http;//sylcmyk.com', NULL, '2011-06-01 19:50:50'),
(56, 'Tale of Tales', 'BE', 'http://tale-of-tales.com', NULL, '2011-06-01 19:50:50'),
(57, 'ARE, The', 'US', 'http://www.thearebeats.com', NULL, '2011-06-01 19:50:36'),
(58, 'C-Men, The', 'NL', 'http://www.thecmen.com', NULL, '2011-06-01 19:50:37'),
(59, 'Tank, The', 'US', 'http://thetanknyc.org', NULL, '2011-06-01 19:50:51'),
(60, 'Trash80', 'US', 'http://trash80.com', NULL, '2011-06-01 19:50:51'),
(61, 'Unclassed Media', 'GB', 'http://unclassedmedia.com', NULL, '2011-06-01 19:50:52'),
(62, 'VBLANK', 'US', 'http://waitforvblank.com', NULL, '2011-06-01 19:50:52'),
(63, 'Zen Albatross', 'US', 'http://zenalbatross.net', NULL, '2011-06-01 19:50:53'),
(64, 'Patric Catani', 'DE', 'http://www.myspace.com/pcatani', NULL, '2011-06-01 19:50:48'),
(65, 'STu', 'CH', 'http://stu.atari.org', NULL, '2011-06-01 19:50:50'),
(66, 'Cow''p', 'JP', 'http://www.19-t.com/comb', NULL, '2011-06-01 19:50:39'),
(67, 'zabutom', 'SE', 'http://www.myspace.com/zabutom', NULL, '2011-06-01 19:50:53'),
(68, 'failotron', 'HU', 'http://failotron.org', NULL, '2011-06-01 19:50:41'),
(69, 'coova', 'JP', 'http://www.myspace.com/coova', NULL, '2011-06-01 19:50:38'),
(70, 'm-.-n', 'BE', 'http://discodirt.10pm.org', NULL, '2011-06-01 19:50:45'),
(71, 'Johan Kotlinski', 'SE', 'http://www.rebelpetset.com', NULL, '2011-06-01 19:50:43'),
(72, 'Tonylight', 'IT', 'http://www.tonylight.it', NULL, '2011-06-01 19:50:51'),
(73, 'Syphus', 'GB', 'http://syphus.untergrund.net', NULL, '2011-06-01 19:50:50'),
(74, 'Unicorn Dream Attack', 'US', 'http://www.unicorndreamattack.com', NULL, '2011-06-01 19:50:52'),
(75, 'Starscream', 'US', 'http://myspace.com/starscreamnewyork', NULL, '2011-06-01 19:50:50'),
(76, 'Lissajou', 'US', 'http://myspace.com/lissajou', NULL, '2011-06-01 19:50:44'),
(77, 'Mark Denardo', 'US', 'http://www.markdenardo.com', NULL, '2011-06-01 19:50:45'),
(78, 'IAYD', 'US', 'http://www.myspace.com/iayd', NULL, '2011-06-01 19:50:42'),
(79, 'Chromix', 'US', 'http://www.chromixmusic.com', NULL, '2011-06-01 19:50:38'),
(80, 'Eat Rabbit', 'FR', 'http://www.myspace.com/eatrabbit', NULL, '2011-06-01 19:50:40'),
(81, 'Dr. Von Pnok', 'FR', 'http://drvonpnok.com', NULL, '2011-06-01 19:50:40'),
(82, 'Jean Y. Kim', 'US', 'http://www.fx6ex6.com', NULL, '2011-06-01 19:50:43'),
(83, 'Rosa Menkman', 'NL', 'http://rosa-menkman.blogspot.com', NULL, '2011-06-01 19:50:49'),
(84, 'little-scale', 'AU', 'http://little-scale.com', NULL, '2011-06-01 19:50:44'),
(85, 'outpt', 'US', 'http://outpt.net', NULL, '2011-06-01 19:50:47'),
(86, 'tRasH cAn maN', 'SE', 'http://www.trash-can-man.com', NULL, '2011-06-01 19:50:51'),
(87, 'Psilodump', 'SE', 'http://www.psilodump.com', NULL, '2011-06-01 19:50:48'),
(88, 'X-Dump, The', 'SE', 'http://www.x-dump.com', NULL, '2011-06-01 19:50:52'),
(89, 'Micromusic', 'CH', 'http://micromusic.net', NULL, '2011-06-01 19:50:46'),
(91, 'David Sugar', 'GB', 'http://www.davidsugar.com', NULL, '2011-06-01 19:50:39'),
(92, 'Deceptikon', 'US', 'http://www.deceptikon.net', NULL, '2011-06-01 19:50:39'),
(93, 'Midnight Snacks', 'US', 'http://midnightsnacks.8chan.net', NULL, '2011-06-01 19:50:46'),
(109, 'Noisewaves', 'US', 'http://noisewaves.bandcamp.com', '2011-05-28 22:32:46', '2011-06-01 19:50:47'),
(95, 'Daniel Rehn', 'US', 'http://danielrehn.com', NULL, '2011-06-01 19:50:39'),
(96, 'LA Game Space', 'US', 'http://lagamespace.org', NULL, '2011-06-01 19:50:44'),
(97, 'Playpower', 'US', 'http://playpower.org', NULL, '2011-06-01 19:50:48'),
(98, 'Saskrotch', 'US', 'http://www.barnofhell.com/saskrotch.htm', NULL, '2011-06-01 19:50:49'),
(102, 'FILE', 'BR', 'http://file.org.br', '2011-03-01 13:03:07', '2011-06-01 19:50:41'),
(103, 'monobomb records', 'US', 'http://monobomb.com', '2011-03-19 20:49:25', '2011-06-01 19:50:46'),
(104, '8bitpeoples', 'US', 'http://8bitpeoples.com', '2011-03-19 20:49:25', '2011-06-01 19:50:36'),
(105, '2 Player Productions', 'US', 'http://www.2playerproductions.com', '2011-03-23 03:09:50', '2011-06-01 19:50:36'),
(106, 'DJ Big Wiz', 'US', 'http://twitter.com/djbigwiz', '2011-03-23 03:15:01', '2011-06-01 19:50:39'),
(107, '4mat', 'GB', 'http://4mat.bandcamp.com', '2011-04-26 17:22:28', '2011-06-01 19:50:36'),
(108, 'RÃ¡dio Metanol', 'BR', 'http://metanol.fm', '2011-04-26 17:24:06', '2011-06-01 19:50:49'),
(110, 'NNNNNNNNNN', 'JP', 'http://nnnnnnnnnn.futene.net', '2011-05-28 22:32:46', '2011-06-01 19:50:46'),
(111, 'Ultrasyd', 'FR', 'http://ultrasyd.free.fr', '2011-05-28 22:32:46', '2011-06-01 19:50:52'),
(112, 'Talk to Animals', 'US', 'http://www.facebook.com/talktoanimals', '2011-05-28 22:32:46', '2011-06-01 19:50:51'),
(113, 'Peter Swimm', 'US', 'http://www.burialape.com', '2011-05-28 22:32:46', '2011-06-01 19:50:48'),
(114, 'Ralp', 'ES', 'http://www.ralp.org', '2011-05-28 22:32:46', '2011-06-01 19:50:49'),
(115, 'knife city', 'US', 'http://www.facebook.com/knifecity', '2011-05-28 22:32:46', '2011-06-01 19:50:44'),
(116, 'Tristan Perich', 'US', 'http://tristanperich.com', '2011-05-28 22:32:46', '2011-06-01 19:50:51'),
(117, 'Eindbaas', 'NL', 'http://eindbaas.org', '2011-05-28 22:32:46', '2011-06-01 19:50:40'),
(118, 'cTrix', 'AU', 'http://syntaxparty.org/ctrix', '2011-05-28 22:32:47', '2011-06-01 19:50:39'),
(121, 'ui', 'VE', 'http://www.iloveui.com', '2011-06-01 19:50:36', '2011-06-01 19:50:36'),
(120, 'Kanagawa', 'HU', 'http://www.facebook.com/kanagawarocks', '2011-06-01 06:56:27', '2011-06-01 19:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `performers`
--

DROP TABLE IF EXISTS `performers`;
CREATE TABLE IF NOT EXISTS `performers` (
  `id` int(32) NOT NULL auto_increment,
  `event_id` int(32) NOT NULL default '0',
  `name` varchar(140) NOT NULL default '',
  `url` text,
  `role` enum('artist','visualist') default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `performers`
--

INSERT INTO `performers` (`id`, `event_id`, `name`, `url`, `role`) VALUES
(18, 73, 'Zen Albatross', 'http://www.zenalbatross.net/', 'artist'),
(17, 7, 'The C-Men', 'http://vimeo.com/user407146', 'visualist'),
(19, 73, 'Wet Mango', 'http://www.gameboybeats.com/', 'artist'),
(20, 73, 'visualicious', 'http://vimeo.com/imagima', 'visualist'),
(21, 73, 'Ultrasyd', 'http://ultrasyd.free.fr/', 'artist'),
(22, 73, 'Tristan Perich', 'http://tristanperich.com/', 'artist'),
(23, 73, 'Ten Thousand Free Men & Their Families', 'http://10kfreemen.com/', 'artist'),
(24, 73, 'Talk to Animals', 'http://www.myspace.com/talktoanimals', 'artist'),
(25, 73, 'Stagediver', 'http://stagediver.radiograffiti.org/', 'artist'),
(26, 73, 'Peter Swimm', 'http://www.burialape.com/', 'artist'),
(27, 73, 'Party Time! Hexcellent!', 'http://www.partytimehexcellent.com/', 'visualist'),
(28, 73, 'Nullsleep', 'http://nullsleep.com', 'artist'),
(29, 73, 'Noisewaves', 'http://noisewaves.bandcamp.com/', 'artist'),
(30, 73, 'NO CARRIER', 'http://no-carrier.com', 'visualist'),
(31, 73, 'NNNNNNNNNN', 'http://www.myspace.com/nnnnnnnnnn8bit', 'artist'),
(32, 73, 'M7Kenji', 'http://m7kenji.com/', 'visualist'),
(33, 73, 'Henry Homesweet', 'http://www.myspace.com/henryhomesweet', 'artist'),
(34, 73, 'exileFaker', 'http://www.facebook.com/exileFaker', 'artist'),
(35, 73, 'cTrix', 'http://syntaxparty.org/ctrix/', 'artist'),
(36, 73, 'Chipzel', 'http://www.myspace.com/chipzel', 'artist'),
(37, 73, 'Bit Shifter', 'http://bit.shifter.net', 'artist'),
(38, 73, 'BEASTMODE', 'http://soundcloud.com/beastmode', 'artist'),
(39, 73, 'Anamanaguchi', 'http://anamanaguchi.com', 'artist'),
(52, 73, 'knife city', 'http://www.facebook.com/knifecity', 'artist'),
(41, 73, 'vade', 'http://vade.info/', 'visualist'),
(42, 73, 'Raquel Meyers', 'http://www.raquelmeyers.com/', 'visualist'),
(43, 73, 'enso', 'http://enso.tumblr.com/', 'visualist'),
(44, 73, 'Ralp', 'http://www.ralp.org/', 'artist'),
(45, 73, 'Bubblyfish', 'http://www.bubblyfish.com/', 'artist'),
(46, 73, 'Starscream', 'http://starscreamband.com', 'artist'),
(47, 73, '4mat', 'http://4mat.bandcamp.com', 'artist'),
(48, 74, 'Bahia303', '', 'artist'),
(49, 74, 'Subway Sonicbeat', '', 'artist'),
(50, 74, 'Ghouls''N''Eggs', '', 'artist'),
(51, 74, 'Droid-On', '', 'artist');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(32) NOT NULL auto_increment,
  `title` varchar(140) default NULL,
  `producer_name` varchar(140) default NULL,
  `producer_url` text,
  `production_name` varchar(140) default NULL,
  `production_url` text,
  `date` date default NULL,
  `their_description` text,
  `my_description` text,
  `download_text` varchar(140) default NULL,
  `embed` text,
  `post_file_path` text,
  `post_file_name` varchar(140) default NULL,
  `post_file_size` int(32) default NULL,
  `post_content_type` varchar(140) default NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  `slug` varchar(140) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `producer_name`, `producer_url`, `production_name`, `production_url`, `date`, `their_description`, `my_description`, `download_text`, `embed`, `post_file_path`, `post_file_name`, `post_file_size`, `post_content_type`, `created`, `modified`, `slug`) VALUES
(16, 'Hi.', 'minusbaby', 'http://minusbaby.com', 'New Website and Thangs', '', '2011-05-19', '', '<p>\r\n<i>01</i> Â· Oh, lookâ€¦ a re-design with a fancy, collapsible Twitter bar up there, just about every track I''ve released in the "Music" section and an "Art and Design" section that''s not yet complete, but will be filled over time. I''ll add a "Photography" section eventually, too.\r\n</p>\r\n<p>\r\n<i>02</i> Â· I''m playing <a href="http://blipfestival.org/2011">Blip Festival New York 2011</a> tonight. I will be joined on stage by <a href="http://crashfaster.com">crashfaster</a>, members of <a href="http://sambanewyork.com">Samba New York<i>!</i></a> and <a href="http://brazilianquarter.bandcamp.com">Brazilian Quarter</a>. Clarinet, tuba, cavaquinho, mandolin, agogÃ´, tamborim, pandeiro and surdo. Clothing is optional.\r\n</p>\r\n<p>\r\n<i>03</i> Â· "BIAS" has been released on CD via <b>monobomb records</b>. On it are my last two <a href="http://8bitpeoples.com">8bitpeoples</a> EPs, "Left" and "Derecha", newly mixed by <a href="http://crashfaster.com">Morgan Tucker</a> at monobomb studios in San Francisco and mastered by Hans Dekline of <a href="http://soundbitesdog.com">Sound Bites Dog</a> in Los Angeles. You may buy one or 998 copies at Blip for now, and online later.\r\n</p>\r\n<p>\r\nThat''s that, I think. Thanks for visiting. See you on the dance floor. No really, go.\r\n</p>', '', '', '4dd1840b-9fe4-473d-bccf-60a1400dc0a6.png', '20110516_news.png', 4628, 'image/png', '2011-05-16 11:08:58', '2011-06-07 21:03:55', 'Hi'),
(3, 'BIT.TRIP FATE', 'Gaijin Games', 'http://gaijingames.com', 'BIT.TRIP FATE', 'http://bittripgame.com/bittrip-fate.html', '2011-02-02', 'BIT.TRIP FATE takes Commander Video to a darker place. The rhythms are heavy; the sound unlike anything he''s ever heard. Now you, too, can explore an unfamiliar and hypnotic genre mash-up wherein dubstep and chipmusic flirt with, and intoxicate your senses.\r\n<br/><br/>\r\nIn a fitting guest-appearance, minusbaby lends two of his most sublime tracks to the album, just to get you in the mood.\r\n<br/><br/>\r\nDiscover your own FATE as you continue your BIT.TRIP with this amazing audio companion.', 'Two of my tunes will be in Gaijin Games'' "BIT.TRIP FATE", to be released this Autumn via NintendoÂ® WiiWareâ„¢. The menu and credits screens will feature new versions of tracks from "Left": "Left [Sucka MCs Mix]" and "A Large Part of Your Mind Sliced [What Mix]". ', 'You may preview and buy it at <a href="http://www.cdbaby.com/cd/gaijingames5">www.cdbaby.com/cd/gaijingames5</a>.', '', '4d89a746-add8-4591-ad6b-05c0c0a80168.png', 'news-bit_trip_fate.png', 1868, 'image/png', '2011-03-18 16:53:15', '2011-04-29 11:20:45', 'BIT-TRIP-FATE'),
(6, 'Beatles Cover', '8-Bit Operators', 'http://www.8bitops.com', 'I Wanna Hld Yr Handheld, Vol. 1', 'http://8bitoperators.bandcamp.com', '2009-09-09', 'Almost 2 full years in the making, the 8-Bit Operators "Wanna Hld Yr Handheld, Vol. 1" Beatles tribute focuses on the glorious avant-garde and electronic side of the Fab 4 with over 20 of the biggest international names in 8-bit chip music, all utilizing the hardware of re-tooled, classic Game Boys, Ataris, Nintendo Entertainment Systems, circuit-bent toys, Commodore 64s and Apple II computers. ', 'I covered "Flying" because it''s a groovy instrumental and the one tune written by all four members of the band.', 'Listen to all sixteen tracks at <a href="http://8bitoperators.bandcamp.com">http://8bitoperators.bandcamp.com</a>.', '', '4d90d491-3fe8-47c7-b8cc-3b8b400dc0a6.jpg', 'news-i_wanna_hld_yr_handheld_01.jpg', 36387, 'image/jpeg', '2011-03-28 11:33:53', '2011-03-30 09:42:53', 'Beatles-Cover'),
(7, 'Remixes and a Video', 'Various Artists', '', 'Left Remixes, Pt. 1', 'http://minusbaby.com', '2009-10-01', '<b>Music Video by:</b><br />\r\n<a title="Asif Siddiky" href="http://www.2playerproductions.com">Asif Siddiky</a> [USA]\r\n<br /><br />\r\n<b>Remixes by:</b>\r\n<br />\r\n<a title="Polytron Corporation" href="http://polytroncorporation.com">6955</a> [Canada], <a title="8GB" href="http://kikencorp.com/8gb">8GB</a> [Argentina], <a title="The ARE" href="http://theare.wordpress.com">The ARE</a> [USA], <a title="Rhinostrich" href="http://rhinostrich.com">Rhinostrich</a> [USA], <a title="Saskrotch" href="http://myspace.com/saskrotch">Saskrotch</a> [USA] and <a title="sylcmyk" href="http://myspace.com/sylcmyk">sylcmyk</a> [USA]', '<p>\r\nIn early August 2009, I assembled a group of musicians to remix the first single, "<b>A Large Part of Your Mind Sliced</b>", from my newest release on <b>8bitpeoples</b>, "<a href="/music/#Left-Remixes-Pt-1">Left</a>".\r\n</p>\r\n<p>\r\nI''d mentioned that purebred animals are more likely to succumb to one of a wider array of illness than crossbred specimens and that I am all for healthy animals and music.\r\n</p>\r\n<p>\r\nThere were no rules.\r\n</p>\r\n<p>\r\nIt is accompanied by a music video directed by Asif Siddiky of 2 Player Productions. It made its debut on August 22nd, 2009 at Multiplicidade in Rio de Janeiro, Brasil. It was met by a premiere in New York City at the Tank a week later.\r\n</p>', '', '<iframe src="http://player.vimeo.com/video/6187252?title=0&amp;byline=0&amp;portrait=0&amp;color=00B9F1" width="720" height="405" frameborder="0"></iframe>', '', '', NULL, NULL, '2011-03-28 20:36:24', '2011-04-29 11:28:51', 'Remixes-and-a-Video'),
(8, 'Data Beez Wrap-Up', 'Data Beez', 'http://databeez.com', 'West Coast Micro Tour', 'http://databeez.com', '2009-11-21', '', '<p>I had a great time on the <b><a href="http://www.databeez.com">Data Beez</a> West Coast Micro Tour</b> with <a href="http://www.blackpawn.com">blackpawn</a>, <a href="http://www.crashfaster.com">Crashfaster</a>, <a href="http://www.fx6ex6.com">Fx6Ex6</a>, Go Motion, <a href="http://tcinseattle.livejournal.com">Guybrush</a>, <a href="http://www.leeni.us">Leeni</a>, <a href="http://www.mrspastic.com">Mr. Spastic</a>, <a href="http://www.parisgraphics.com">Paris</a>, <a href="http://danielrehn.com">Daniel Rehn</a>, <a href="http://crunchyco.com/music/spamtron.html">Spamtron</a>, <a href="http://www.starpause.com">starPause</a> and <a href="http://www.trash80.net">Trash80</a> in Los Angeles, San Francisco, Portland and Seattle from November 5th through the 20th.</p>\r\n\r\n<p><i>Special thanks to Adam Robezzoli of <a href="http://attractmo.de">Attract Mode</a>, <a href="http://www.giantrobot.com">Giant Robot</a>, <a href="http://www.janm.org">Japanese American National Museum</a>, <a href="http://www.argumentativa.com">Miguel Arias</a>, Tim Dufour, <a href="http://delicious.com/aylk">Miguel HernÃ¡ndez</a>, <a href="http://www.vimeo.com/twoplayer">2 Player Productions</a> and every single man, woman and savage who made it out to the shows; even the crazy robots.</i></p>', '', '', '4d936053-0a04-4381-9c3c-6874400dc0a6.jpg', 'databeezwrapup.jpg', 148957, 'image/jpeg', '2011-03-30 09:54:43', '2011-04-29 11:24:01', 'Data-Beez-Wrap-Up'),
(9, 'Blip Talk with minusbaby', 'Blip Festival 2009', 'http://blipfestival.org/2009/', 'Interview', 'http://blipfestival.org/2009/blog/12/01/blip-talk-with-minusbaby', '2009-12-01', '<b>Blip:</b> Before you got into making chip music, what type of music or art where you into?', '<p>\r\nMy taste in music and art hasn''t changed drastically since I began making chip music in 1999, but I''ve dug deeper into Brazilian, French and German prog over the past decade. Wonky time signatures haven''t made it into my music, yet, but I''ve adopted a more dissonant, unstable and semi-psychadelic slant to my music that I''ll happily acknowledge as being a direct link to classic, Clube da Esquina-era music coming out of Minas Gerais, Brazil during the earlyâ€’ to midâ€’1970s; LÃ´ Borges, Milton Nascimento, Beto Guedes and Nelson Ãngelo, especially. Also, string arrangements during that same era by Wagner Tiso and Toninho Horta. All of this, of course, may be traced back to Cartola, Dorival Caymmi and AntÃ´nio Carlos Jobim whom, with VinÃ­cius de Moraes and JoÃ£o Gilberto, managed to make sour notes extend into several levels of sophistication, headiness and just a bit of raunchiness.\r\n</p>', 'Read the rest at <a href="http://blipfestival.org/2009/blog/12/01">http://blipfestival.org/2009/blog/12/01</a>.', '', '4d93622f-ce60-47ff-99f8-3c2c400dc0a6.png', 'bliptalkwithminusbaby.png', 2228, 'image/png', '2011-03-30 10:01:41', '2011-04-29 11:23:28', 'Blip-Talk-with-minusbaby'),
(10, '"A Few Years Later" Music Video', 'Plasticflesh', 'http://plasticflesh.com', 'A Few Years Later', 'http://vimeo.com/8738481', '2010-01-14', 'Life enters a barren planet.', '', 'View it in HD at <a href="http://vimeo.com/8738481">http://vimeo.com/8738481</a>', '<iframe src="http://player.vimeo.com/video/8738481?title=0&amp;byline=0&amp;portrait=0&amp;color=00B9F1" width="720" height="405" frameborder="0"></iframe>', '', '', NULL, NULL, '2011-03-30 10:18:07', '2011-03-30 10:19:12', 'A-Few-Years-Later-Music-Video'),
(11, '11m 20s of New Music', 'minusbaby', 'http://minusbaby.com', 'Flying Bonus Beats, Version 1', 'http://freemusicarchive.org/music/minusbaby/minusbaby_-_Singles_1918/', '2010-02-16', '', '<p>\r\nI wrote 13 minutes of bonus beats to extend my Beatles cover, "Flying", for a dance party-style gig in Montreal on February 11th - <a href="http://www.forwardmusicmontreal.com/">Forward Music</a> at <a href="http://www.barpasseport.com/">Bar Passeport</a>. My oft partner in petty crime, <a href="http://myspace.com/glomaggot">glomag</a>, played, too.\r\n</p>\r\n<p>\r\nHere''s the bulk of it without the original version. As it was written strictly for a specific, live setting, I do not consider it finished and will indubitably return to it. I thought I''d share it in the meantime for the sake of non-moving butts everywhere. Play it stupid loud so that you''ll go slightly deaf for two days like me.\r\n</p>\r\n<p>\r\nP.S.: Listen for the <a href="http://starscreamband.com">Starscream</a> interlude.\r\n</p>', 'You may download it at <a href="http://freemusicarchive.org/music/minusbaby/minusbaby_-_Singles_1918/">Free Music Archive</a>.', '<object width="720" height="50"><param name="movie" value="http://freemusicarchive.org/swf/trackplayer.swf"/><param name="flashvars" value="track=http://freemusicarchive.org/services/playlists/embed/track/25397.xml"/><param name="allowscriptaccess" value="sameDomain"/><embed type="application/x-shockwave-flash" src="http://freemusicarchive.org/swf/trackplayer.swf" width="720" height="50" flashvars="track=http://freemusicarchive.org/services/playlists/embed/track/25397.xml" allowscriptaccess="sameDomain" /></object>', '4d9369d0-24a8-421e-90b3-3e4a400dc0a6.png', 'flyingbonusbeats.png', 6559, 'image/png', '2011-03-30 10:35:12', '2011-03-30 10:35:12', '11m-20s-of-New-Music'),
(12, '"KnifeTank" Remix', 'crashfaster & Doc Pop', 'http://knifetank.bandcamp.com', 'Deep Slit [Red Wings Remix]', 'http://knifetank.bandcamp.com/track/deep-slit-red-wings-remix', '2010-07-20', 'Born out of an HTML5 game, "<a href="http://knifetank.bandcamp.com/album/crashfaster-doctor-popular-present-knifetank-the-albumhole">KnifeTank (The Albumhole)</a>" takes the game''s original chiptune score and mixes it with nerdcore hip hop and additional remixes. Turning it into a fantastic stand alone album. Play the original game at <a href="http://www.knifetanks.com">www.knifetanks.com</a>', '', 'You may stream and buy it at <a href="http://knifetank.bandcamp.com/">http://knifetank.bandcamp.com/</a>.', '', '4d937080-d19c-443d-8bb7-79e3400dc0a6.png', 'knifetank01.png', 198503, 'image/png', '2011-03-30 11:03:44', '2011-03-30 11:03:44', 'KnifeTank-Remix'),
(13, 'Tettix Remix', 'Tettix', 'http://www.tettix.net', 'A New Challenger!', 'http://www.tettix.net/albums/a_new_challenger.html', '2010-07-30', 'Electronic musician <a href="http://www.tettix.net/">Tettix</a> just released "<a href="http://www.tettix.net/albums/a_new_challenger.html">A New Challenger</a>", a remix album featuring tracks from his earlier "<a href="ttp://www.tettix.net/albums/tkoep.html">T.K.O.E.P.</a>". <a href="http://www.headlessbarbie.com/">Alex Mauer</a>, <a href="http://www.myspace.com/derriskharlanmsc">Derris-Kharlan</a>, <a href="http://www.disasterpeace.com/">Disasterpeace</a>, <a href="http://www.helastechne.com/">HÃ©las Techne</a> and <b>minusbaby</b> worked with him to create it.', '', 'You may download it at <a href="http://www.tettix.net/albums/a_new_challenger.html">http://www.tettix.net</a>.', '', '4d9371a3-4924-4267-b554-5375400dc0a6.png', 'tettix_01.png', 238404, 'image/png', '2011-03-30 11:08:35', '2011-05-13 21:55:08', 'Tettix-Remix'),
(14, 'New Release on 8bitpeoples', 'minusbaby', 'http://minusbaby.com', 'Derecha', 'http://www.8bitpeoples.com/discography/8BP110', '2010-08-02', '<p>It''s surprising to me as someone who generally isn''t that big on chip music that I''m on my third straight play through minusbaby''s new album, <i>Derecha</i>. And even though I admittedly get fidgety and impatient on hearing more than one song at any given time in any given genre (chronic musical ADD), here I am humming along like an asshole, more forcefully with each repeated listen, ad-libbing riffs here and there while I finger-drum beats on my desktop like a white Candido, and quickly approaching my fourth return listen.\r\n</p>\r\n<p>\r\nAs an album, it''s a mature progression from his previous EP, <i><a href="http://www.8bitpeoples.com/discography/8BP101">Left</a></i>. And it''s damn good. And I want to tell people about it, but what do I even say? It''s chip music, but it doesn''t sound like something from any video game I played when I was a kid. It''s new music made with old-school mentality using a combination of sounds that could either be from 1985 or 2085. It''s funky, it''s danceable, it''s composed, it''s cerebral, it''s performing a complicated samba throughout the <i>Southern Hemisphere</i> at times. It''s all of these and yet it''s none of these.\r\n</p>\r\n<p>\r\nIn a word, it''s minusbaby.\r\n</p>\r\n<p>\r\n&mdash; Dylan Garret, DJ Â· New York, NY Â· July 2010\r\n</p>', '', 'You may download it at <a href="http://www.8bitpeoples.com/discography/8BP110">http://www.8bitpeoples.com</a>.', '', '4d93734a-68bc-4493-a6b9-5171400dc0a6.png', 'leftcover.png', 3359, 'image/png', '2011-03-30 11:15:38', '2011-04-29 11:21:30', 'New-Release-on-8bitpeoples');

-- --------------------------------------------------------

--
-- Table structure for table `press`
--

DROP TABLE IF EXISTS `press`;
CREATE TABLE IF NOT EXISTS `press` (
  `id` int(32) NOT NULL auto_increment,
  `bio` text,
  `embed_1` text,
  `embed_2` text,
  `embed_3` text,
  `embed_4` text,
  `press_file_path` text,
  `press_file_name` varchar(140) default NULL,
  `press_file_size` int(32) default NULL,
  `press_content_type` varchar(140) default NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `press`
--

INSERT INTO `press` (`id`, `bio`, `embed_1`, `embed_2`, `embed_3`, `embed_4`, `press_file_path`, `press_file_name`, `press_file_size`, `press_content_type`, `created`, `modified`) VALUES
(1, '<p style="font-size: 125%;">Richard Alexander Caraballo began his minusbaby project in 1999 to explore the diversity of a lo-fi, compositional aesthetic and has since progressed experimentally in its scope to include elements guided by those roots and a sonic language representative of his influences, namely: <i>the art of bass and how it moves asses</i>.</p>\r\n<p>\r\nIn addition to music, he is a prolific pixel artist who, since 1999, has been largely responsible for defining the unique aesthetics of the modern 8-bit creative movement. Spearheading the visual identities of <a href="http://8bitpeoples.com">8bitpeoples</a>, <a href="http://pulsewave.org">Pulsewave</a> and the <a href="http://blipfestival.org">Blip Festival</a> has contributed to making his work ubiquitous to the public''s perception of chip music and art. His work, which he has referred to as, â€œa practice in primitivism, but mostly a stab at trying to continue several traditions at once,â€ is often guided by a central idea meant to be triumphed by the individual.\r\n</p>\r\n<p>\r\nCombining his love for type, patterns and limited palettes, minusbaby has developed his own unique visual and musical languages where rather than easing into common trends, he utilizes multiple sources outside of video game culture to broaden both his and the movement''s repertoire so as to expand the canon and avoid Super Mario cannons.\r\n</p>', '', '', '', '', '2011-03-19_ben_mason_720x388.jpg', '2011-03-19_ben_mason_720x388.jpg', 44771, 'image/jpeg', '2011-03-18 08:09:39', '2011-05-05 16:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `press_links`
--

DROP TABLE IF EXISTS `press_links`;
CREATE TABLE IF NOT EXISTS `press_links` (
  `id` int(32) NOT NULL auto_increment,
  `site` varchar(140) default NULL,
  `site_url` text,
  `article_url` text,
  `article_title` varchar(140) default NULL,
  `author` varchar(140) default NULL,
  `author_url` text,
  `article` text,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  `image_file_path` text,
  `image_file_name` varchar(140) default NULL,
  `image_file_size` int(32) default NULL,
  `image_content_type` varchar(140) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `press_links`
--

INSERT INTO `press_links` (`id`, `site`, `site_url`, `article_url`, `article_title`, `author`, `author_url`, `article`, `created`, `modified`, `image_file_path`, `image_file_name`, `image_file_size`, `image_content_type`) VALUES
(1, '8bit Today', 'http://www.8bittoday.com', 'http://www.8bittoday.com/articles/13/the-artwork-of-minusbaby', 'The Artwork of minusbaby', 'Sander van der Borne', 'http://www.sanderfocus.nl', '<p><b>[8bit today] How did you grow into working with 8bit? Could you tell us more about the process of involvement?</b></p>\r\n\r\n<p>[Minusbaby] "In 1987, my older brother bought a fancy <a href="http://en.wikipedia.org/wiki/Commodore_64">Commodore 64</a> workstation; the computer, a monitor, floppy drive, printer plotter, software pack, controllers and a table to put it on. It was a really big deal because that sort of thing was rare in the projects. I grew up in Lillian Wald Houses - public housing on the Lower East Side of Manhattan, New York City.</p>\r\n\r\n <p>I paid attention. He showed me some games. <a href="http://www.c64.com/?type=1&amp;id=224">Rambo</a>, <a href="http://www.c64.com/?type=1&amp;id=371">Montezuma''s Revenge</a> and <a href="http://www.c64.com/?type=1&amp;id=1303">Dino Eggs</a> became my favorites. But there was one piece of software that I really enjoyed - I forget its name now. Cracked by the Chinese Cracking Service, it was for creating animations. I remember that my first ever piece of pixel art was made in that program. It was of a dog pissing on a fire hydrant. It''s true. I''ve always been classy. From there I went on to make talking bears, hands crippled and shaken by arthritis and bouncing breasts. I think the animations were limited to three frames. I was twelve years old. I ended up temporarily forgetting all of that stuff because I was running around my neighborhood drawing all over the bridges, elevators, stairwells and sidewalks with fat markers and paint between trying for high scores in "Frantic Freddy".</p>\r\n\r\n<p>In 1995, after dropping out of high school twice out of boredom and eventually graduating from an alternative program and then decidedly not attending the diploma ceremony, I ended up a student at the <a href="http://www.cooper.edu/">Cooper Union</a> in New York City. I applied because it was free as was the application process because the guidance counselor at my high school liked me so I was given three fee waivers allowing me to apply to three colleges instead of two. I concentrated in drawing and sculpture for the first three months of the second year until I dropped out.</p>\r\n\r\n<p>In 1999, I got my hands on a laptop. I found a cracked copy of Photoshop 5. Because I didn''t have a camera nor scanner then, I ended up using the program in the same way I used the C64 animator - I limited myself to using the pencil, line, paint bucket and eraser tools. I did this on the hush hush because I figured people might consider my style an exercise in futility; especially because during that era of web design most things were all exploded and extracted, three-dimensional angles and wireframes beneath miles of large and tiny type and high-tech in a mitochondrial sort of way. I did that stuff, too.</p>\r\n\r\n<p>In 2001, Jeremiah Johnson (<a href="http://www.nullsleep.com">Nullsleep</a>) and I met and from there I concentrated more on my pixel stuff because all of a sudden there was a need for it. I''m not going to say, "and the rest was history," because that would be pretentious. I still make my own coffee."</p>\r\n\r\n<p><b>[8bit today] Instead of being restricted by limitations, you give the 8bit touch to it by mind. Could you tell more about your process of working?</b></p>\r\n\r\n<p>[Minusbaby] "Because I come from a sort of mixed media background on a several fronts (dependent on what was around and what I could afford) - computer, spray paint, lead, carbon, oil pastels, fake gold leaf, smoke, fire, ink and anything else - I felt that there was no reason for me to stick to traditional pixel art techniques. While I do follow a set of rules based on grids, aspect ratios and aliasing, everything else is fair game. For example, a Commodore 64''s palette is limited to sixteen colors. A few months ago, I made a Pulsewave flier using its palette along with darker versions of the original sixteen colors. While some purists have a tough time giving me respect, my color choices and disregard of the screen resolutions of the original consoles and computers set a personal precedent allowing me to do whatever I want, therefore avoiding boredom and inspiring growth. I am done being bothered by conservative crews who can''t cope. Besides, it''s fun to be naughty and break rules.</p>\r\n\r\n<p><a href="http://spriters-resource.com/resources/tut/yychr-snes/">YY-<span class="caps">CHR</span></a>, a little program for creating <a href="http://en.wikipedia.org/wiki/Nintendo_Entertainment_System"><span class="caps">NES</span></a> sprites, has become a recent favorite. <a href="http://noname.c64.org/csdb/release/?id=30789">Timanthes</a> by <a href="http://noname.c64.org/csdb/group/?id=135">Focus</a> is another handy tool similar to YY-<span class="caps">CHR</span> instead with file output for the Commodore 64. But I usually use Photoshop to make my pixel art because it''s efficient when I have a ton of illustration gigs to complete. I''m the same way while making music. When I have a bit of downtime and a specific process in mind, I use a tracker. When I have 12,000 miles of ideas to realize and produce, I use software. I''ve a new interest in using <a href="http://www.wayfar.net/">x|k</a>''s MIDNES triggered by software and a <a href="http://en.wikipedia.org/wiki/Roland_TR-505">Roland TR-505</a> for basslines and percussion. That would be a funky sweet spot between hardware and software. Above all, efficiency and sincerity in practice rather than transparent conservatism is what motivates my work. Oh, and making it nice. That''s the passion behind it all.</p>\r\n\r\n<p>I''ve just mentioned this, but I think it''s important for me to point out that I approach my music and design in similar ways. I do not translate my subjects and concepts into pixelated, 8-bit versions of the initial idea. Instead, I aim to communicate directly and with squares - square pixels and square waves (although triangular waves are my favorite). I guess it''s a practice in <a href="http://en.wikipedia.org/wiki/Primitivism">primitivism</a>, but mostly a stab at trying to continue several traditions at once. If I must choose, I''d say <a href="http://en.wikipedia.org/wiki/Mark_Rothko">Mark Rothko</a>, tiles in Portugal, <a href="http://en.wikipedia.org/wiki/Ndebele">Ndebele</a> homes, airports, the <a href="http://en.wikipedia.org/wiki/Bauhaus">Bauhaus</a>, semiotics, <a href="http://en.wikipedia.org/wiki/Charles_Eames">Charles and Ray Eames</a>'' output, <a href="http://en.wikipedia.org/wiki/Caipirinha">caipirinhas</a>, dominoes, silhouettes (especially those of women), language inflections, birds and their calls, Charlie Ahearn''s <a href="http://en.wikipedia.org/wiki/Wild_Style">Wild Style</a>, fetishism (particularly that of <a href="http://en.wikipedia.org/wiki/Santer%C3%ADa">SanterÃ­a</a> and <a href="http://en.wikipedia.org/wiki/Candombl%C3%A9">CandomblÃ©</a>), <a href="http://en.wikipedia.org/wiki/Saul_Bass">Saul Bass</a>'' movie posters, American Bison, the Sun, <a href="http://en.wikipedia.org/wiki/Paul_Rand">Paul Rand</a>''s logos, zoos, <a href="http://en.wikipedia.org/wiki/Herb_Lubalin">Herb Lubalin</a>''s typography, the romanticization of Latin traditions and routines, <a href="http://en.wikipedia.org/wiki/L%C3%A1szl%C3%B3_Moholy-Nagy">LÃ¡szlÃ³ Moholyâ€“Nagy</a>''s paintings and alphabets are some of the most dominant signifiers in my work. There are many other reasons for my Ã¦sthetic choices, but I''ll have to save those explanations for another time or else these paragraphs will end up too much for one book."</p>\r\n\r\n<p><b>[8bit today] Coming from a broader creative background, what role would you see for 8bit in your artistic career for the future? Are there any big plans?</b></p>\r\n\r\n<p>[Minusbaby] "Besides working to improve my skills as a pixel artist, I want to take on commissions that allow me to move my pixel art from flat screens and paper into the round. I''ve always has a passion for sculpture. I worked as an art restorator''s assistant for several years; repairing stone and metal sculptures, fireplaces and objets d''art. I want to cover the usual areas of solid things: toys, clothing, site-specific installations, furniture, video and print installations using entire rooms and expand my materials to include fabric, wood, metal, light and more of the planet without leaving a mess. I''ve an interest in easing into video performance, too. It would be nice to be able to have control over the visual portion of my live gigs because I don''t dance around like a maniac; not yet, anyway. I''d rather have people look at pretty pictures instead of me.</p>\r\n\r\n<p>I have a project underway that will, I guess, set me up for my video aspirations. I am curating the first Pulsewave of 2009. Jean Y. Kim, <a href="http://www.parisgraphics.com/">Paris Treantafeles</a> - two friends talented and brilliant on several levels - are collaborating with me on the video portion of that show. It''s going to be a combination of epic poem, screenplay, low-bit, digital projection and shadow puppets. Guided by the general direction of each act''s style, timbre, texture and instrumentation, we will provide visuals that tell the story of a boy''s adventure from morning into the night.</p>\r\n\r\n<p>On the purely musical side of things, I''m two-thirds into writing the follow-up to my recent EP, <a href="http://www.8bitpeoples.com/discography/8BP089">Saudade for Beginners</a>. It will be the second part of a four-release series. For live shows, I''ve been arranging older tunes and preparing new ones for an on-going series of performances that will feature fancy musicians on fancy instruments. My next big gig will be in April for <a href="http://8static.com/">8static</a>, a monthly chip music series in Philadelphia. I''m certain <a href="http://angelicanegron.com/">AngÃ©lica NegrÃ³n</a> and <a href="http://www.vimeo.com/olivares">JosÃ© Olivares</a> of <a href="http://www.balunonline.com/">BalÃºn</a> will join me on accordion and melodica, Carl Peczynski aka <a href="http://www.myspace.com/oxygenstar">Oxygen Star</a> will be on drums and the rest is still being planned. I''m thinking a full-blown, Brazilian percussion section and if I''m lucky, <a href="http://profile.myspace.com/index.cfm?fuseaction=user.viewprofile&amp;friendid=26679523">DJ Big Wiz</a> will be available.</p>\r\n\r\n<p>I read <a href="http://en.wikipedia.org/wiki/Ray_Charles">Ray Charles</a>'' autobiography last year. A few lines resonated strongly. I don''t remember the exact words, but he said that he preferred to make a crowd dance as a result of the music making them happy rather than nervous. I like that a lot. I want to do that with my music, design and photography. I want people to feel good and dance.</p>\r\n<p>The restâ€¦ I''ll be playing that by eye and ear. "</p>', '2011-03-18 08:09:39', '2011-05-02 21:53:17', '4d92b151-647c-4485-b3dc-2975400dc0a6.png', '8bittoday_logo.png', 1537, 'image/png'),
(7, 'True Chip Till Death', 'http://blipfestival.org/2009/', 'http://blipfestival.org/2009/blog/12/01/blip-talk-with-minusbaby', 'Blip Talk with minusbaby', 'True Chip Till Death', 'http://truechip.org', '<p>\r\n&bull; <i>Blip: Before you got into making chip music, what type of music or art where you into?</i>\r\n</p>\r\n<p>\r\nMy taste in music and art hasnâ€™t changed drastically since I began making chip music in 1999, but Iâ€™ve dug deeper into Brazilian, French and German prog over the past decade. Wonky time signatures havenâ€™t made it into my music, yet, but Iâ€™ve adopted a more dissonant, unstable and semi-psychadelic slant to my music that Iâ€™ll happily acknowledge as being a direct link to classic, Clube da Esquina-era music coming out of Minas Gerais, Brazil during the early- to mid-1970s; LÃ´ Borges, Milton Nascimento, Beto Guedes and Nelson Ã‚ngelo, especially. Also, string arrangements during that same era by Wagner Tiso and Toninho Horta. All of this, of course, may be traced back to Cartola, Dorival Caymmi and AntÃ´nio Carlos Jobim whom, with Vinicius de Moraes and JoÃ£o Gilberto, managed to make sour notes extend into several levels of sophistication, headiness and just a bit of raunchiness.\r\n</p>\r\n<p>\r\n&bull; <i>Blip: How did you first become aware of the possibility of chip music?</i>\r\n</p>\r\n<p>\r\nAside from a passive influence via exposure to Sega, Nintendo and Commodore 64 soundtracks as a kid, I think it all goes back to Ron Hubbard and Matt Simmonds a.k.a. 4mat for many chip musicians, and Iâ€™m no exception. Because I was never a super hardcore gaming nerd (bless your souls), I found out about them via the almighty micromusic.net; in their links section. This was in 1999.\r\n</p>\r\n<p>\r\n&bull; <i>Blip: How does your background influence your current work?</i>\r\n</p>\r\n<p>\r\nI grew up with a mom who loved salsa, doo-wop and the Beatles, a father who dug boogaloo, a grandfather who played Puerto Rican jÃ­baro (folk) music and a grandmother with a large SanterÃ­a record collection. The concert scene from the movie â€œWild Styleâ€ was filmed up my street; I heard it from my window while it was being recorded. I was six years old. My older brother was a teenage b-boy and DJ who played hip-hop, electro and freestyle and gigged for Irene Caraâ€™s mom once and weâ€™d go to the East Village to pick up used British shoegaze and post-punk records on weekends instead of eating. Iâ€™d go to sleep listening dub on a pirate radio station broadcast from somewhere out of Brooklyn during my hair metal period from 1987 to 1988.\r\n</p>\r\n<p>\r\nI watched Run-D.M.C. film the video for â€œThe Avenueâ€ in 1990, A Tribe Called Quest film the video for â€œCan I Kick It?â€ in 1991 (both on my block), fell for jazz in 1992, met C.L. Smooth, Grand Puba and Redman in 1993, dove into electronic music hardcore in 1994, Brazilian music in 1995 and in the same year Henry Threadgillâ€™s record, â€œCarry the Dayâ€, changed my life sonically and was an introduction to Bill Laswellâ€™s work.\r\n</p>\r\n<p>\r\nIn 1996, I learned to dig old school ska and rocksteady, listened to a lot of exotica and space age pop in 1997, became obsessed with Ninja Tune and Thrill Jockey in 1998, figured out chip music and some of the other stuff Iâ€™ve mentioned a couple of questions ago in 1999 and yeah, all of this has definitely influenced me greatly and Iâ€™m lucky to have had so much exposure to such a wide range of style from childhood on. Itâ€™s all like Lego in my head.\r\n</p>\r\n<p>\r\n&bull; <i>Blip: Who are you most excited to see at Blip? Why?</i>\r\n</p>\r\n<p>\r\nIâ€™m really looking forward to the Hunters. Iâ€™m a big Coova fan. Iâ€™m also curious about Alex Bond a.k.a. Enso, and Jean Y. Kim as first-time Blip Festival visualists this year. Whatever they do, Iâ€™m sure itâ€™ll be high-powered.\r\n</p>\r\n<p>\r\n&bull; <i>Blip: Where do you see your progression as an artist heading? Deeper into chip music, or perhaps something different?</i>\r\n</p>\r\n<p>\r\nIâ€™ve always been moving in and out of chip music, so Iâ€™m going to keep on doing that.\r\n</p>', '2011-05-05 10:00:16', '2011-05-05 10:01:30', '4dc2d7a0-4678-4f52-97fa-0279400dc0a6.png', 'tctd_logo.png', 1341, 'image/png'),
(5, 'Ian CofrÃ©', 'http://theartseen.net', 'http://minusbaby.tumblr.com/post/260081378', 'minusbaby - Left', 'Ian CofrÃ©', 'http://theartseen.net', '<p>\r\nIt takes a certain point in an artistâ€™s career â€“ after having already developed a rich, personal vocabulary and a command of his tools â€“ to take an inward look and render a self-portrait that is sincere, accurate, and profoundly complex.  Richard Alexander Caraballo (minusbaby) has done that with his new album, Left, which reads like a travelerâ€™s journal for his firing synapses.\r\n</p>\r\n<p>\r\n<i>Left</i> could be the uncovered Ã©tudes of a late 20<sup>th</sup> century analog synth experimenter, but intermixed with hip-hop and samba grooves, it is an artifact of the unique outlook of this self-aware, NYC native, deftly moving back and forth between his local and global influences. <i>Monkey Patch</i></a> [2003] was a playful concept album built around simian references, and <i>Saudade for Beginners</i> [2008], a melancholic stroll steeped in Brazilian rhythms and funk, showed a huge, compositional leap forward. In contrast to his earlier 8bitpeoples (â€œ8BPâ€) releases, rather than look outward for inspiration, Richard has turned his inner world (or his alter ego as minusbaby, though thereâ€™s no indication that he keeps them separate) into the central theme for <i>Left</i>.\r\n</p>\r\n<p>\r\nThe titles insinuate a timeline of milestones, but to think these are mapped-out steps would betray the abstract topography of the authorâ€™s extended rumination, an album with a 21-minute span constructed in movements, not so much as songs.  Caraballo has distilled his experiences and identifying markers into six iterations that sound like a textured, electric field.  Listeners will find themselves enmeshed in his studied grasp of 8-bit orchestration, knowing hints of his earlier, recognizable tracks, and styled, external influences, most apparent in the shifting rhythms woven into constant and insistent bass lines.  There is a density in composition that is a mature extension of a technique Richard has been using since Monkey Patch (listen to â€œHazardous Salamanderâ€ with its oscillating drone and accompanying melody).  That same density, however, risks drowning out the subtleties in the interlaced melodies at times, leaving behind only the major musical arcs: ascendant, descendant, and transcendent.  The committed explorer will find it more rewarding to find some good speakers or headphones and listen to it all the way through in one sitting.\r\n</p>\r\n<p>\r\nThis album is only limited by its brevity, a consequence of 8BPâ€™s signature 3â€-CD release format, allowing for fewer standout and standalone moments. Still, Caraballo, ever the opportunist, uses Left as a departure point to initiate a remix project that will debut in installments. The first, based on the second cut, â€œA Large Part of Your Mind Sliced,â€ has already been released, paving the way for subsequent, reflexive portraits. Intent on disregarding boundaries, Richard laid out only one direction: it was a simple statement about the evolutionary success of the half-breed over the purebred. By enlisting mutually respected musicians, minusbaby will get to see how well his musical DNA can live on beyond the albumâ€™s limits, subject to these same forces of fragmentation and reconstruction that help define our contemporary identities. Richardâ€™s, of course, is tinted an unmistakable â€˜minusbaby blue.â€™\r\n</p>\r\n<p>\r\n<i>Ian CofrÃ© is an independent curator based in NYC working in contemporary art, occasionally straying into his overlapping passion for music.</i>\r\n</p>', '2011-03-29 20:56:30', '2011-05-02 21:45:37', '4d92a9ee-2f9c-425a-9090-4704400dc0a6.png', 'left_cover.png', 1819, 'image/png'),
(6, 'Free Music Archive', 'http://freemusicarchive.org', 'http://freemusicarchive.org/curator/True_Chip_Till_Death/blog/minusbaby_and_his_tiny_world', 'minusbaby and His Tiny World', 'True Chip Till Death', 'http://truechiptilldeath.com', '<p>\r\nI want to thank WFMU for getting me involved as a curator for the FMA. I''m currently the editor of a Chip Music and Art related blog, <a title="Shameless Plug!" href="http://truechiptilldeath.com/">True Chip Till Death</a>, and it is my pleasure to show you some of the best tracks coming out of the Chip Music scene.</p>\r\n<p>Knowing the types of readers the FMA has, some of you may have heard of <a title="Or its more controversial scene name, Chiptune. Look at that fiesty revision history!" href="http://en.wikipedia.org/wiki/Chip_tune">Chip Music</a> before. Documentaries like <a title="Disclosure: I''m a talking head in this." href="http://www.2playerproductions.com/">Reformat the Planet</a> and <a href="http://www.8bitmovie.com/">8BIT</a>, compilations like <a title="Better than Kraftwerk. There i''ve said it." href="http://www.astralwerks.com/8-bit/"><span class="style2">8-BIT OPERATORS</span></a>, and crews like <a href="http://www.micromusic.net/">Micromusic </a>and <a href="http://www.8bitpeoples.com/">8bitpeoples</a> have shown off some of the best and brightest the scene has to offer.The bestest part, however is that the great majority of these tunes are free to download and enjoy (but not for stealing! <a href="http://www.xlr8r.com/features/2008/11/chiptunes-been-caught-stealing">Bad Timbaland!</a>).\r\n</p>\r\n<p>\r\nMy goal for the FMA is to highlight some of these new releases and classic tracks from the most innovative and exciting artists in the scene. The styles vary almost as much as the use of platforms, from dubstep to indie rock, from the Sega Genesis to the Atari 2600, so there is a lot of ground to cover. Hopefully you''ll find some new favorite bands, so lets get started!\r\n</p>\r\n<p>\r\nOur first featured artist, <a href="http://www.minusbaby.com/">minusbaby</a>, is a globe trotting citizen of the world, one who''s interests are as unique as his takes on the classic video game music sound. Using software that mimics the limitations of various classic consoles like the NES, and Sega Master system, he is seemlessly able to blend various styles of music from hip-hop to samba to afro-funk, <a title="Live at Blip Festival 2008" href="http://vimeo.com/2494635?pg=embed&amp;sec=">and live he expands that sound</a> using an eclectic mix of musicans of all backgrounds and skill levels.\r\n</p>\r\n<p>\r\nHis 2008 release, <a href="/music/minusbaby/Saudade_for_Beginners/">Saudade for Beginners</a>, released on <a href="http://www.8bitpeoples.com/discography#8BP089">8bitpeoples</a>, was a milestone for minusbaby. Alongside his talent at using iconic video game sounds in a way that enhances his composition instead of turning it into a gimmick, he also shows off <a href="http://minusbaby.tumblr.com/">his visual chops</a> with stunning album artwork and the rare ability to turn electronic based music into something heartfelt and honest.\r\n</p>\r\n<p>\r\nThe five tracks on the release might seem a bit of a tease, so you can check out his <a href="http://vimeo.com/videos/search:minusbaby">live videos</a> which include guest appearance from some of his many collaborators including "Def Jux Records'' turntablist, DJ Big Wiz [Aesop Rock, El-P, Mr. Lif], Trackmasters producer, The ARE [Lil'' Kim, De La Soul, K-Otix] and the assembly of a samba school".\r\n</p>\r\n<p>\r\nUpcoming releases in the series (Advanced Saudade?) should see minusbaby further incorporate these explosive live performances into the resulting recordings. Until then also check out the rarities comp "<strong>O Que NÃ£o Tem JuÃ­zo [2003â€”2006]</strong>" on his website</a>.\r\n</p>\r\nâ€” Peter Swimm for <a href="http://freemusicarchive.org/curator/True_Chip_Till_Death/">True Chip Till Death</a> &middot; Jersey City, NY &middot; 2011/05/11', '2011-03-29 22:12:47', '2011-05-02 21:58:33', '4d92bbcf-b3b0-4439-b1a9-1adc400dc0a6.png', 'fma_logo.png', 4468, 'image/png'),
(8, 'Revista Fraude', 'http://revistafraude.com', ' http://issuu.com/revistafraude/docs/fraude_7', 'Uma Pessoa de 8bit (An 8bit Person)', 'JoÃ£o AraÃºjo & Nelson Oliveira', 'http://revistafraude.com', '<p>\r\n&bull; <i>Could you define the 8-bit aesthetic to Fraudeâ€™s public?</i>\r\nIt has become a blanket term to describe images that are, emulate or have been inspired by video game console,arcade and home computer raster images. In other words, old school video game graphics.\r\n</p>\r\n<p>\r\n&bull; <i>Why and since when minusbaby?</i>\r\nI was known as â€œSYS 64738â€ â€” my favorite Commodore 64 command â€” in 1998 and then realized that that was too comprehensively nerdy so I went with an incidental phrase that ended up holding water. I worked as a tattoo designer in the late 1990s. I would spend time at the tattoo parlor to get an understanding of the way body curves and ink relate. I donâ€™t know why exactly, but customers would ask if I was married and had children. I grew tired of the long answer, so I shortened it to, â€œI am minus baby.â€ That was usually enough to momentarily confuse them and halt further personal questions.\r\n</p>\r\n<p>\r\nThereâ€™s a second meaning to the alias that Iâ€™ve slowly begun letting out. Maybe next time, though.\r\n</p>\r\n<p>\r\n&bull; <i>Letâ€™s start with your workâ€¦ music and visual arts. Which came first?</i>\r\n</p>\r\n<p>\r\nThe visual arts side, well, Iâ€™ve been doing that since I was a little kid. One drawing I especially remember is of funny-looking pigeons standing next to a can of GoyaÂ® gandules (â€œpigeon peasâ€ in English). I was four years old.\r\n</p>\r\n<p>\r\nAs far as my music, I began my current phase in 1997 or so with a 4-track tape deck, a cheap sampler, hundreds of records and kidsâ€™ toys. In 1999, Iâ€™d noticed that those musical experiments were beginning to sound like too many people uploading tunes to scene.org, so I decided to try something different. I downloaded a copy of GoatTracker via stolen internet access in 1999 and incorporated Commodore 64 triangles and squares into what Iâ€™d already been writing. Some of the better tunes ended up on Micromusic.netâ€™s â€œMicro_Superstarz_2000â€ CD compilation, my first release for 8bitpeoples, â€œMonkey Patchâ€, and â€œStrong Arctic Winds Take Ternsâ€, released by Rappers I Know Records, curiously enough. I donâ€™t even rap.\r\n</p>\r\n<p>\r\n&bull; <i>How would you define your work?</i>\r\n</p>\r\n<p>\r\nA few months ago in an 8bit Today interview I managed to describe my work succinctly, so Iâ€™ll use it again: â€œa practice in primitivism, but mostly a stab at trying to continue several traditions at once.â€ Itâ€™s easy to fall into the trappings of pixel art: video game references, very bright colors and esoteric imagery only understood by gamers, so I try for something a bit different. Lately, my work has been either type-heavy or illustration-heavy.\r\n</p>\r\n<p>\r\n&bull; <i>When, why and how did you start â€œdoing it yourselfâ€?</i>\r\n</p>\r\n<p>\r\nThe tradition of learning a skill solely for the sake of a letter grade or paycheck is quite depressing, so I adopted a do-it-yourself ethic while in high school. I dropped out twice and spent time at museums, libraries, zoos, record shops and on the street instead. I eventually re-enrolled, graduated, got accepted to a fancy arts college and dropped out a year and a half later.\r\n</p>\r\n<p>\r\n<a href="http://minusbaby.tumblr.com/post/254506979">READ MOREâ€¦</a>\r\n</p>', '2011-05-05 10:30:04', '2011-05-05 14:44:32', '4dc2df01-fda0-4ab0-bb33-4743400dc0a6.jpg', 'revista_fraude_logo.jpg', 7791, 'image/jpeg'),
(9, 'MTV Brasil', 'http://mtv.com.br', '', 'Nullbits no Scrap MTV (Nullbits on MTV Scrap)', 'MTV Scrap', 'http://mtv.com.br', '<object width="450" height="286"><param name="movie" value="http://www.youtube-nocookie.com/v/USOe4MuC6ao?fs=1&amp;hl=en_US&amp;rel=0"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube-nocookie.com/v/USOe4MuC6ao?fs=1&amp;hl=en_US&amp;rel=0" type="application/x-shockwave-flash" width="450" height="286" allowscriptaccess="always" allowfullscreen="true"></embed></object>', '2011-05-05 14:43:52', '2011-05-05 14:43:52', '4dc31a18-7434-46d7-beb7-2c2e400dc0a6.jpg', 'mtv_brasil_logo.jpg', 14463, 'image/jpeg'),
(10, 'MTV Brasil', 'http://mtv.uol.com.br/programas/mod', 'http://mtv.uol.com.br/programas/mod/videos/03-tecnologias-obsoletas', 'Mod MTV | 03 | Tecnologias Obsoletas', 'Mod MTV', 'http://mtv.uol.com.br/programas/mod/videos/03-tecnologias-obsoletas', '<iframe src="http://player.mtv.uol.com.br/embed.php?id=36382" name="" width="480" height="270" frameborder="0" SCROLLING=NO></iframe>', '2011-05-19 10:10:20', '2011-05-27 15:12:51', '4dd54efc-8010-4112-a1d0-66aa400dc0a6.jpg', 'mtv_brasil_logo.jpg', 14463, 'image/jpeg'),
(11, 'GameSetWatch', 'http://gamesetwatch.com', 'http://www.gamesetwatch.com/2011/05/blip_festival_2011_micro_report_night_1.php', 'Blip Festival 2011 Micro-Report: Night 1', 'Matthew Hawkins', '', '<p>\r\n<i>Yet it was perhaps Minusbaby who might be remembered the most, perhaps of the entire festival, when all is said and done. When he first got on stage, alongside were various other musicians, with mandolins, clarinets, tubas, and all other manners of instruments. The scene created a buzz in the audience that is simply indescribable, and the same could be said of the amazing mixture of electronic and traditional sounds that followed. Near the end, Richard Caraballo stepped aside and let the clarinetist and others take the spotlight. The crowd was completely transfixed, though in the final stretch, it was funny seeing people give each other looks that read like, "Umm... what''s going on here?" It''s definitely a performance that people will be talking about for a good while, so dare I say history was made?</i>\r\n</p>\r\n<p>\r\n<a href="http://www.gamesetwatch.com/2011/05/blip_festival_2011_micro_report_night_1.php">READ MOREâ€¦</a>', '2011-05-23 15:34:01', '2011-05-23 15:34:01', '4ddae0d9-c544-43e6-bb21-2fa6400dc0a6.jpg', 'gamesetwatch_logo.jpg', 14130, 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `press_photos`
--

DROP TABLE IF EXISTS `press_photos`;
CREATE TABLE IF NOT EXISTS `press_photos` (
  `id` int(32) NOT NULL auto_increment,
  `press_id` int(32) default '1',
  `photographer` varchar(140) default NULL,
  `photographer_url` text,
  `license` text,
  `notes` varchar(140) default NULL,
  `photo_file_path` text,
  `photo_file_name` varchar(140) default NULL,
  `photo_file_size` int(32) default NULL,
  `photo_content_type` varchar(140) default NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `press_photos`
--

INSERT INTO `press_photos` (`id`, `press_id`, `photographer`, `photographer_url`, `license`, `notes`, `photo_file_path`, `photo_file_name`, `photo_file_size`, `photo_content_type`, `created`, `modified`) VALUES
(1, 1, 'Marjorie Becker', 'http://chiptography.com', 'Copyright 2011', '2480 x 1748 &middot; 300 DPI &middot; JPG', 'minusbaby_by_marjorie_becker_(2011-02-19).jpg', 'minusbaby_by_marjorie_becker_(2011-02-19).jpg', 2270654, 'image/jpeg', '2011-03-18 08:09:39', '2011-05-05 16:52:22'),
(2, 1, 'Ben Mason', 'http://locutus.the-collective.net', 'Copyright 2011', '3504 x 2336 &middot; 300 DPI &middot; JPG', '4d8998ad-6eb4-4a06-84aa-05c2c0a80168.jpg', '2011-03-19_ben_mason.jpg', 1460779, 'image/jpeg', '2011-03-18 08:09:39', '2011-05-05 16:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(32) NOT NULL auto_increment,
  `key` text,
  `value` text,
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `description`) VALUES
(2, 'news_page_count', '5', 'Number of news posts to show per page'),
(3, 'maintenance_mode', '0', 'Only allow the webmaster to log in. Use this for making code changes to the site.');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
CREATE TABLE IF NOT EXISTS `songs` (
  `id` int(32) NOT NULL auto_increment,
  `album_id` int(32) NOT NULL default '0',
  `artist` varchar(140) NOT NULL default '',
  `title` varchar(140) NOT NULL default '',
  `url` text,
  `number` int(2) NOT NULL default '0',
  `length` varchar(5) default NULL,
  `downloads` int(32) default '0',
  `file_size` int(32) default NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=404 ;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `album_id`, `artist`, `title`, `url`, `number`, `length`, `downloads`, `file_size`, `created`, `modified`) VALUES
(1, 1, 'minusbaby', 'Eating Needles', '01-minusbaby-eating_needles.mp3', 1, '0:36', 0, 1262097, NULL, '2011-04-24 14:35:36'),
(2, 1, 'minusbaby', 'WEPAAA!', '02-minusbaby-wepaaa.mp3', 2, '1:27', 0, 2082121, NULL, '2011-04-24 14:35:37'),
(3, 1, 'minusbaby', 'So Much Bullshine', '03-minusbaby-so_much_bullshine.mp3', 3, '1:08', 0, 1774103, NULL, '2011-04-24 14:35:37'),
(4, 1, 'minusbaby', 'You Just Haven''t Earned It Yet, -baby', '04-minusbaby-you_just_havent_earned_it_yet_-baby.mp3', 4, '2:20', NULL, 2926457, NULL, '2011-04-24 14:35:37'),
(5, 1, 'minusbaby', 'Monkey Patch', '05-minusbaby-monkey_patch.mp3', 5, '2:29', 0, 3067259, NULL, '2011-04-24 14:35:37'),
(6, 1, 'minusbaby', 'Doobie Weave', '06-minusbaby-doobie_weave.mp3', 6, '1:07', 0, 1756121, NULL, '2011-04-24 14:35:37'),
(7, 1, 'minusbaby', 'Hazardous Salamander', '07-minusbaby-hazardous_salamander.mp3', 7, '0:53', 0, 1539634, NULL, '2011-04-24 14:35:37'),
(8, 1, 'minusbaby', 'Orangutangaroo', '08-minusbaby-orangutangaroo.mp3', 8, '2:00', 0, 2606254, NULL, '2011-04-24 14:35:37'),
(9, 1, 'minusbaby', 'Chipmunk Chucking Pimps', '09-minusbaby-chimpunk_chucking_pimps.mp3', 9, '0:35', 0, 1238292, NULL, '2011-04-24 14:35:37'),
(10, 1, 'minusbaby', 'Ciento Cuatro Cantasos del Mono', '10-minusbaby-ciento_cuatro_cantasos_del_mono.mp3', 10, '2:19', 0, 2904711, NULL, '2011-04-24 14:35:38'),
(11, 1, 'minusbaby', 'We Go For Monkey', '11-minusbaby-we_go_for_monkey.mp3', 11, '0:26', 0, 1102441, NULL, '2011-04-24 14:35:38'),
(12, 1, 'minusbaby', 'A Farewell to Parms', '12-minusbaby-a_farewell_to_parms.mp3', 12, '3:10', 0, 3720961, NULL, '2011-04-24 14:35:38'),
(13, 2, 'minusbaby', 'Comendo P&atilde;o e Fazendo Mal', '01-minusbaby-comendo_pao_e_fazendo_mal.mp3', 1, '5:11', 0, 7501703, NULL, '2011-04-24 13:54:56'),
(14, 2, 'minusbaby', 'El Camino de Tu Casa a la M&iacute;a', '02-minusbaby-el_camino_de_tu_casa_a_la_mia.mp3', 2, '4:55', 0, 7128055, NULL, '2011-04-24 13:54:56'),
(15, 2, 'minusbaby', 'S&atilde;o Roque (Bella/Boa)', '03-minusbaby-sao_roque_(bella-boa).mp3', 3, '3:54', 0, 5666146, NULL, '2011-04-24 13:54:56'),
(16, 2, 'minusbaby', 'Minha Caipirinha &Eacute; &Oacute;tima (Very, Very)', '04-minusbaby-minha_caipirinha_e_otima_(very_very).mp3', 4, '3:35', NULL, 5200990, NULL, '2011-04-24 13:54:56'),
(17, 2, 'minusbaby', 'Ela Chegou', '05-minusbaby-ela_chegou.mp3', 5, '2:55', 0, 4234823, NULL, '2011-04-24 13:54:56'),
(18, 3, '', 'Left', '06-minusbaby-left.mp3', 6, '2:54', 0, NULL, NULL, '2011-04-24 09:35:12'),
(19, 3, '', 'A Few Years Later', '05-minusbaby-a_few_years_later.mp3', 5, '3:17', 0, NULL, NULL, '2011-04-24 09:35:12'),
(20, 3, '', 'And Was Borne Unto My Brain', '04-minusbaby-and_was_borne_unto_my_brain.mp3', 4, '4:22', 0, NULL, NULL, '2011-04-24 09:35:12'),
(21, 3, '', 'Chilled Around for a Bit', '03-minusbaby-chilled_around_for_a_bit.mp3', 3, '2:21', 0, NULL, NULL, '2011-04-24 09:35:12'),
(22, 3, '', 'A Large Part of Your Mind Sliced', '02-minusbaby-a_large_part_of_your_mind_sliced.mp3', 2, '4:37', 0, NULL, NULL, '2011-04-24 09:35:12'),
(23, 3, '', 'Something Happened When You Were Born', '01-minusbaby-something_happened_when_you_were_born.mp3', 1, '3:33', 0, NULL, NULL, '2011-04-24 09:35:12'),
(30, 18, 'minusbaby', 'A Large Part of Your Mind Sliced [Video Edit]', '01-minusbaby-a_large_part_of_your_mind_sliced_[video_edit].mp3', 1, '4:25', 0, NULL, NULL, '2011-04-25 06:31:56'),
(31, 18, 'minusbaby', 'ã€ƒ [6955''s Loitering on Level 4 Remix]', '02-minusbaby-a_large_part_of_your_mind_sliced_[6955].mp3', 2, '4:40', 0, NULL, NULL, '2011-04-25 06:31:56'),
(32, 18, 'minusbaby', 'ã€ƒ [Rhinostrich''s Pig Mix Remix]', '03-minusbaby-a_large_part_of_your_mind_sliced_[rhinostrich].mp3', 3, '3:21', 0, NULL, NULL, '2011-04-25 06:31:56'),
(33, 18, 'minusbaby', 'ã€ƒ [8GB''s Maradgora Remix]', '04-minusbaby-a_large_part_of_your_mind_sliced_[8gb].mp3', 4, '5:56', 0, NULL, NULL, '2011-04-25 06:31:56'),
(34, 18, 'minusbaby', 'ã€ƒ [sylcmyk''s positij Remix]', '05-minusbaby=a_large_part_of_your_mind_sliced_[sylcmyk].mp3', 5, '3:23', 0, NULL, NULL, '2011-04-25 06:31:56'),
(35, 18, 'minusbaby', 'ã€ƒ [The ARE''s 1972 Monte Carlo Remix]', '06-minusbaby-a_large_part_of_your_mind_sliced_[the_are].mp3', 6, '4:02', 0, NULL, NULL, '2011-04-25 06:31:56'),
(36, 18, 'minusbaby', 'ã€ƒ [Saskrotch''s Originoo Mind Slicaz Remix]', '07-minusbaby-a_large_part_of_your_mind_sliced_[saskrotch].mp3', 7, '3:07', 0, NULL, NULL, '2011-04-25 06:31:56'),
(37, 19, 'minusbaby', 'A Few Years Later [Video Edit]', '01-minusbaby-a_few_years_later_[video_edit].mp3', 1, '3:23', 0, NULL, NULL, '2011-04-25 06:32:53'),
(38, 19, 'minusbaby', 'ã€ƒ [Awash Mix by Turing''s Apple]', '02-minusbaby-a_few_years_later_[turings_apple].mp3', 2, '5:32', 0, NULL, NULL, '2011-04-25 06:32:53'),
(39, 19, 'minusbaby', 'ã€ƒ [Tim Koch''s Nurofen Waffles Mix]', '03-minusbaby-a_few_years_later_[tim_koch].mp3', 3, '3:41', 0, NULL, NULL, '2011-04-25 06:32:53'),
(40, 19, 'minusbaby', 'ã€ƒ [BalÃºn End of Summer Reinterpretation]', '04-minusbaby-a_few_years_later_[balun].mp3', 4, '4:40', 0, NULL, NULL, '2011-04-25 06:32:53'),
(41, 19, 'minusbaby', 'AlgzÃ¨bres', '05-minusbaby-algzebres.mp3', 5, '7:38', 0, NULL, NULL, '2011-04-25 06:32:53'),
(54, 4, 'minusbaby', 'AlgzÃ¨bres, Pts. A-M', '01-minusbaby-algzebres_pts_a-m.mp3', 1, '3:53', 0, NULL, '2011-04-23 22:39:42', '2011-04-24 12:16:04'),
(55, 4, 'minusbaby', 'AlgzÃ¨bres, Pts. N-Z', '02-minusbaby-algzebres_pts_n-z.mp3', 2, '3:59', 0, NULL, '2011-04-24 08:38:25', '2011-04-24 12:16:04'),
(56, 4, 'minusbaby', 'Transmitiendo SeÃ±ales Mezcladas', '03-minusbaby-transmitiendo_senales_mezcladas.mp3', 3, '3:34', 0, NULL, '2011-04-24 08:38:25', '2011-04-24 12:16:04'),
(57, 4, 'minusbaby', 'Una Caja de los Ochentas', '04-minusbaby-una_caja_de_los_ochentas.mp3', 4, '1:02', 0, NULL, '2011-04-24 08:38:26', '2011-04-24 12:16:04'),
(58, 4, 'minusbaby', 'Fuiste Fuerte', '05-minusbaby-fuiste_fuerte.mp3', 5, '2:31', 0, NULL, '2011-04-24 08:38:26', '2011-04-24 12:16:04'),
(59, 4, 'minusbaby', 'NÃºmeros InÃºtiles', '06-minusbaby-numeros_inutiles.mp3', 6, '4:07', 0, NULL, '2011-04-24 08:38:26', '2011-04-24 12:16:04'),
(60, 8, 'minusbaby', '30 Seconds with October 15, 2003''s Migraine', '01-minusbaby-30_seconds_with_october_15_2003s_migraine.mp3', 1, '0:30', 0, 515716, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(61, 8, 'minusbaby', 'Depois de um GalÃ£o no Miramar', '02-minusbaby-depois_de_um_galao_no_miramar.mp3', 2, '2:11', 0, 2705101, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(62, 8, 'minusbaby', 'El Paseo de las Hormigas', '03-minusbaby-el_paseo_de_las_hormigas.mp3', 3, '1:06', 0, 1388343, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(63, 8, 'minusbaby', 'April 25th, 2006', '04-minusbaby-april_25th_2006.mp3', 4, '0:23', 0, 484329, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(64, 8, 'minusbaby', 'Mushroom Giggles', '05-minusbaby-mushroom_giggles.mp3', 5, '0:48', 0, 1089330, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(65, 8, 'minusbaby', 'Sortijas Negras', '06-minusbaby-sortijas_negras.mp3', 6, '1:31', 0, 2223921, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(66, 8, 'minusbaby', 'Trying All Day to Sleep All Night', '07-minusbaby-trying_all_day_to_sleep_all_night.mp3', 7, '0:37', 0, 883389, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(67, 8, 'minusbaby', 'Ohmge Patume, Pocket and Aspirin', '08-minusbaby-ohmge_patume_pocket_and_aspirin.mp3', 8, '1:33', 0, 1917056, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(68, 8, 'minusbaby', 'A Palavra NÃ£o Foi Encontrada', '09-minusbaby-a_palavra_nao_foi_encontrada.mp3', 9, '2:23', 0, 3683097, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(69, 8, 'minusbaby', 'El Borracho DoblÃ³ por el CallejÃ³n', '10-minusbaby-el_borracho_doblo_por_el_callejon.mp3', 10, '1:16', 0, 1831473, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(70, 8, 'minusbaby', 'The Stars, Fat Laces and You', '11-minusbaby-the_stars_fat_laces_and_you.mp3', 11, '1:12', 0, 1158507, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(71, 8, 'minusbaby', 'DespertÃ© Dormido', '12-minusbaby-desperte_dormido.mp3', 12, '1:32', 0, 2062535, '2011-04-24 13:44:54', '2011-04-24 13:44:54'),
(72, 7, 'minusbaby', 'Scheveningen Blue Light', '01-minusbaby-scheveningen_blue_light.mp3', 1, '3:38', 0, 5317338, '2011-04-24 14:21:46', '2011-04-26 09:29:06'),
(73, 7, 'minusbaby', 'Make Your Breasts Kiss', '02-minusbaby-make_your_breasts_kiss.mp3', 2, '2:26', 0, 3573820, '2011-04-24 14:21:46', '2011-04-26 09:29:06'),
(74, 7, 'minusbaby', 'The Mocisian', '03-minusbaby-the_mocisian.mp3', 3, '2:59', 0, 4372520, '2011-04-24 14:21:46', '2011-04-26 09:29:06'),
(75, 7, 'minusbaby', 'Very Large Reproductions of a Small Man', '04-minusbaby-very_large_reproductions_of_a_small_man.mp3', 4, '2:28', 0, 3636547, '2011-04-24 14:21:46', '2011-04-26 09:29:06'),
(76, 7, 'minusbaby', 'Philanthropology', '05-minusbaby-philanthropology.mp3', 5, '2:55', 0, 4289145, '2011-04-24 14:21:46', '2011-04-26 09:29:06'),
(77, 7, 'minusbaby', 'Bacalao Bombao', '06-minusbaby-bacalao_bombao.mp3', 6, '3:07', 0, 4581294, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(78, 7, 'minusbaby', 'Fawnosaur', '07-minusbaby-fawnosaur.mp3', 7, '2:21', 0, 3465333, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(79, 7, 'minusbaby', 'Kicking Make-Believe Pebbles Into Cars', '08-minusbaby-kicking_make-believe_pebbles_into_cars.mp3', 8, '2:23', 0, 3513722, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(80, 7, 'minusbaby', 'Wassupposed', '09-minusbaby-wassupposed.mp3', 9, '2:03', 0, 3026480, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(81, 7, 'minusbaby', 'Portable Drizzle', '10-minusbaby-portable_drizzle.mp3', 10, '3:16', 0, 4784426, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(82, 7, 'minusbaby', 'SinvergÃ¼enza', '11-minusbaby-sinverguenza.mp3', 11, '2:46', 0, 4069081, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(83, 7, 'minusbaby', 'Nada SerÃ¡ Como Antes', '12-minusbaby-nada_sera_como_antes.mp3', 12, '2:48', 0, 4123850, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(84, 7, 'minusbaby', 'Strong Arctic Winds Take Terns', '13-minusbaby-strong_arctic_winds_take_terns.mp3', 13, '3:18', 0, 4822071, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(85, 7, 'minusbaby', 'Begin Anywhere', '14-minusbaby-begin_anywhere.mp3', 14, '1:29', 0, 2222751, '2011-04-24 14:21:47', '2011-04-26 09:29:06'),
(86, 9, 'minusbaby', 'SanterÃ­a, NÂº 1', '01-minusbaby=santeria_no_1.mp3', 1, '2:18', 0, 4382638, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(87, 9, 'Chalices of the Past', 'lgpt1ch iv', '', 2, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(88, 9, 'Environmental Sound Collapse', '505 Diving', '', 3, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(89, 9, 'Fluxxin', 'Siblicide', '', 4, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(90, 9, 'Infradead', 'Sewer Lines Need Loving 2', '', 5, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(91, 9, 'Kraettz', 'High Voltage DMG', '', 6, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(92, 9, 'little-scale', 'Strange Weather', '', 7, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(93, 9, 'Krazer', 'Like Stomp on Acid', '', 8, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(94, 9, 'Motone', 'Chaos Controlled', '', 9, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(95, 9, 'Note!', '3D Beet Jam', '', 10, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(96, 9, 'Ovenrake', 'Atari Teenage Food Fight', '', 11, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(97, 9, 'Shaun Carley', 'Percursion Discussion Deploys', '', 12, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(98, 9, 'Emartransformo', 'Shoulda Coulda', '', 13, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(99, 9, 'Sparkyboy', 'Dirt', '', 14, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(100, 9, 'Tom Woxom', 'Format Disk', '', 15, '', 0, NULL, '2011-04-24 14:58:17', '2011-04-26 13:45:15'),
(101, 9, 'Swampyboy', 'Gabberfad', '', 16, '', 0, NULL, '2011-04-24 14:58:18', '2011-04-26 13:45:15'),
(102, 11, 'Mikrosopht', 'Albatross', '', 1, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:01'),
(103, 11, 'Sound', 'Boa Constrictor', '', 2, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:01'),
(104, 11, 'Invisible Public Library', 'Colossal Squid', '', 3, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:01'),
(105, 11, 'Viktoria A. Lisbet', 'D (A Dead Dog Dream)', '', 4, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:02'),
(106, 11, 'Joshua Wentz', 'Echidna', '', 5, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:02'),
(107, 11, 'Futureboots', 'Teenage Falcons', '', 6, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:02'),
(108, 11, 'The Stomach Aches', 'Gopher Bomb', '', 7, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:02'),
(109, 11, 'Rad Skeleton & Herpes', 'Hungry Hungry Hippos', '', 8, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:02'),
(110, 11, 'Rob Moore', 'Eye for Iguana', '', 9, '', 0, NULL, '2011-04-24 15:50:48', '2011-04-26 13:48:02'),
(111, 11, 'Random Animal', 'Jerboa', '', 10, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:02'),
(112, 11, 'Jeremy Simmons', 'For Those Abandoned by Kangaroos', '', 11, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:02'),
(113, 11, 'Jerohme Spye', 'Lemurs You Are the Greatest', '', 12, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:02'),
(114, 11, 'John Lasala, The Zesty Burrito, and Simian Hu Flung Pu', 'The Monkey Song', '', 13, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:02'),
(115, 11, 'Yoshi (Y. Misdaq)', 'Nile Butterfly [â€¦]', '', 14, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:02'),
(128, 10, 'facundo', 'Beatness Monster (NOTLD)', '', 1, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(116, 11, 'minusbaby', '"O" Is for "Orangutan"', '15-minusbaby=o_is_for_orangutan.mp3', 15, '4:23', 0, 7104512, '2011-04-24 15:50:49', '2011-04-26 13:48:02'),
(117, 11, 'Atomâ„¢', 'The Peacocks Say', '', 16, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:02'),
(118, 11, 'Protman', '130Quetzalcoatlus', '', 17, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:02'),
(119, 11, 'Musical Feedback', 'From Whence We Came (Rat)', '', 18, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(120, 11, 'Cold Icecream', 'Spider', '', 19, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(121, 11, 'Rad Skeleton', 'Tickle Me Tarsier', '', 20, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(122, 11, 'Ihouoniui', 'Urchin', '', 21, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(123, 11, 'The Very Us Artists', 'Vole! (Primitial A&A Mix)', '', 22, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(124, 11, 'Kemmler', 'Wolverine', '', 23, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(125, 11, 'The Darth Vader Girls', 'X-Ray Fish', '', 24, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(126, 11, 'OCP', 'Yak', '', 25, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(127, 11, 'Hibernativity Scene', 'Z Z Z (Sleeping Animal)', '', 26, '', 0, NULL, '2011-04-24 15:50:49', '2011-04-26 13:48:03'),
(129, 10, 'Suicide at World Trade Center', 'Brevity', '', 2, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(130, 10, 'AV01D', 'Brace For the Hunt', '', 3, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(131, 10, 'Four Fingers', 'Zombie', '', 4, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(132, 10, 'Red Hero', 'City of War', '', 5, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(133, 10, 'The Bloodreds', 'The War Comes Home', '', 6, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(134, 10, 'Sister Waize', 'I Hide', '', 7, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(135, 10, 'Low Faith and the Raw Intent', 'Like Pulleys on a Dead Mule', '', 8, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(136, 10, 'ChipHydra', 'Machete Decapacitate', '', 9, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(137, 10, 'Unopposed', 'Feed the Rich to the Poor', '', 10, '', 0, NULL, '2011-04-24 16:07:18', '2011-04-26 13:48:39'),
(138, 10, 'Albino Ghost Monkey', 'Laufoo 5.75', '', 11, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:39'),
(139, 10, 'Fuck Plants', 'Grudge', '', 12, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:39'),
(140, 10, 'Mecha_B.E.A.R.', 'Mechanical Harlot', '', 13, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:39'),
(141, 10, 'Rip It Up', '9.28.07', '', 14, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:39'),
(142, 10, 'VultureMoose', 'Do the Smash', '', 15, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(143, 10, 'The Robot Nothing', 'Seeds of Change Were Sown [â€¦]', '', 16, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(144, 10, 'minusbaby', 'Equipe Azul', '17-minusbaby-equipe_azul.mp3', 17, '1:44', 0, 2972004, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(145, 10, 'Interior Decorating', 'Never Let Them Take You In', '', 18, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(146, 10, 'Oxygenfad', 'Love Killer', '', 19, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(147, 10, 'The Flash Attacks', 'Sirens Go Off', '', 20, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(148, 10, 'OxygenStar', 'Made You Look', '', 21, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(149, 10, 'B.A. Pariah', 'Hindsight', '', 22, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(150, 10, 'EVILskull', 'Pleased to Meet You, I''m an Anteater', '', 23, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(151, 10, 'This Place Is Haunted', 'Castlevania 2', '', 24, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(152, 10, 'XJ', 'Working at the Pool', '', 25, '', 0, NULL, '2011-04-24 16:07:19', '2011-04-26 13:48:40'),
(153, 12, 'sbdu', '01v1', '', 1, '', 0, NULL, '2011-04-24 17:35:39', '2011-04-26 13:49:09'),
(154, 12, 'sbdu', '02v1', '', 2, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(155, 12, 'sbdu', '03v1', '', 3, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(156, 12, 'sbdu', '04v1', '', 4, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(157, 12, 'sbdu', '05v1', '', 5, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(158, 12, 'sbdu', '06v1', '', 6, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(159, 12, 'sbdu', '07v1', '', 7, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(160, 12, 'sbdu', '08v1', '', 8, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(161, 12, 'sbdu', '09v1', '', 9, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(162, 12, 'sbdu', '10v1', '', 10, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:09'),
(163, 12, 'sbdu', '11v1', '', 11, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:10'),
(164, 12, 'sbdu', '12v1', '', 12, '', 0, NULL, '2011-04-24 17:35:40', '2011-04-26 13:49:10'),
(165, 12, 'â€” 65', 'Just download the rest at godxiliary.com', '', 13, '', 0, NULL, '2011-04-24 17:37:56', '2011-04-26 13:49:10'),
(166, 17, 'Unscrew', 'Sgt Peppers Lonely Hearts Club Band', '', 1, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(167, 17, 'Wolf Sun', 'With a Little Help from My Friends', '', 2, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(168, 17, 'Yoshi', 'Lucy in the Sky with Diamonds [â€¦]', '', 3, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(169, 17, 'Billy Shatter', 'Getting Better', '', 4, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(170, 17, 'MichL Bridge', 'Fixing a Hole', '', 5, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(171, 17, 'minusbaby', 'She''s Leaving Home [â€¦]', '06-minusbaby=shes_leaving_home.mp3', 6, '2:50', 0, 4072991, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(172, 17, 'Fredo Viola', 'mr[1] kite 5 (For John Lennon)', '', 7, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(173, 17, 'Caller ID Withheld', 'Within You Without You', '', 8, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(174, 17, 'Kams', 'When I''m Sixty-four (When You''re 33 Version)', '', 9, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(175, 17, 'Mikrosopht', 'Memorita', '', 10, '', 0, NULL, '2011-04-24 17:50:46', '2011-04-26 10:00:51'),
(176, 17, 'Shitty Batter', 'Good Morning Good Morning', '', 11, '', 0, NULL, '2011-04-24 17:50:47', '2011-04-26 10:00:51'),
(177, 17, 'Secret Agent Gel', 'Sgt Peppers Lonely Hearts Club Band (Reprise)', '', 12, '', 0, NULL, '2011-04-24 17:50:47', '2011-04-26 10:00:51'),
(178, 17, 'Autistici', 'Another Day in the Life', '', 13, '', 0, NULL, '2011-04-24 17:50:47', '2011-04-26 10:00:51'),
(179, 17, 'Scrubber Fox & Futureboots', 'Inner Beatles Mover 1 Hour/Dark Beatles', '', 14, '', 0, NULL, '2011-04-24 17:50:47', '2011-04-26 10:00:51'),
(180, 13, 'Datarapist', 'Hostile Borders', '', 1, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(181, 13, 'Deathsitcom', 'exe.cution', '', 2, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(182, 13, 'Nailbomb Cults', 'Uncommonly Horny', '', 3, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(183, 13, 'Mochipet', 'Chinese Water Torture', '', 4, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(184, 13, 'Solypsis', 'Charming Pervert [Electric Company Remix]', '', 5, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(185, 13, 'minusbaby', 'Right After I Spotted the First Plane', '06-minusbaby-right_after_i_spotted_the_first_plane.mp3', 6, '2:17', 0, 3422817, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(186, 13, 'Casino Versus Japan', 'Sommery', '', 7, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(187, 13, 'Charles Atlas', 'Edith (Odessa)', '', 8, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(188, 13, 'Champions of Superior Winning feat. Pixel Defense', 'Lactose Vigilante', '', 9, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(189, 13, 'Severed Heads', 'Mong [Live]', '', 10, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(190, 13, 'Eft', 'Constricted Bandwith', '', 11, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(191, 13, 'Nvoise', 'Tightwad', '', 12, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(192, 13, 'V/Vm:', 'Wherehouse', '', 13, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(193, 13, 'Bulldozerman', 'Badsshir2', '', 14, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(194, 13, 'DJ Kos', 'Italian Difference', '', 15, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(195, 13, 'Jansky Noise', 'Drinking Cocktails with the Ladies', '', 16, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:34'),
(196, 13, 'Solypsis', 'Take the Easy Course [Machinist Noise Assault Remix]', '', 17, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:35'),
(197, 13, 'Dr. Combat', 'Projekt64', '', 18, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:35'),
(198, 13, 'My Boy Is Dead', 'I Just Wanted You to Know That', '', 19, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:35'),
(199, 13, 'Obsolete Systems', 'Life with Justin Bailey', '', 20, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:35'),
(200, 13, 'Pulverized Fontanelle', 'Speaker Grit', '', 21, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:35'),
(201, 13, 'Casino Versus Japan', 'Driamu', '', 22, '', 0, NULL, '2011-04-24 18:28:13', '2011-04-26 10:00:35'),
(202, 15, 'Blue Sky Research', 'Ending', '', 21, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(203, 15, '10 Inch CD', 'Remelathe', '', 1, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(204, 15, 'Henry', 'The Love of Her Shape', '', 2, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(205, 15, 'IermoÃ§', 'Inter-Processed 01', '', 3, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(206, 15, 'DNCN', 'Vael', '', 4, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(207, 15, 'Kid Mingus', 'New Single', '', 5, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(208, 15, 'The Lost Weekends', 'Girls of Chorlton', '', 6, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(209, 15, 'Moodsaver', 'Simple', '', 7, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(210, 15, 'Miyumi Yamisha', 'Underwater Love', '', 8, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(211, 15, 'Mudlogger', 'KGB', '', 9, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(212, 15, 'Room', 'One Nine Six Point Nine', '', 10, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(213, 15, 'minusbaby', 'St. Valentine Ails', '11-minusbaby-st_valentine_ails.mp3', 11, '2:38', 0, 3809529, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(214, 15, 'Duma Fuji', 'Scaffold 100', '', 12, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(215, 15, 'Domestication of the Dog', 'Untitled', '', 13, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(216, 15, 'Maroufleur', 'Bigmouth', '', 14, '', 0, NULL, '2011-04-24 19:20:34', '2011-04-26 10:00:02'),
(217, 15, 'IermoÃ§', 'Contort (Beatless)', '', 15, '', 0, NULL, '2011-04-24 19:20:35', '2011-04-26 10:00:02'),
(218, 15, 'DNCN', 'Ania', '', 16, '', 0, NULL, '2011-04-24 19:20:35', '2011-04-26 10:00:02'),
(219, 15, 'Sunn', 'Pretty Girls', '', 17, '', 0, NULL, '2011-04-24 19:20:35', '2011-04-26 10:00:02'),
(220, 15, 'Mikrosopht', 'Kerry', '', 18, '', 0, NULL, '2011-04-24 19:20:35', '2011-04-26 10:00:02'),
(221, 15, '-OS------{@', 'Os4sj', '', 19, '', 0, NULL, '2011-04-24 19:20:35', '2011-04-26 10:00:02'),
(222, 15, 'Oliver', 'S1', '', 20, '', 0, NULL, '2011-04-24 19:20:35', '2011-04-26 10:00:02'),
(223, 5, 'DoF', 'A Path Lights This Way', '', 1, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:42'),
(224, 5, 'Seedy', 'Cathar Priestess', '', 2, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:42'),
(225, 5, 'Ender', 'Syenite', '', 3, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(226, 5, 'Lupus Yonderboy', 'Endsummer', '', 4, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(227, 5, 'Lim', 'T for Two', '', 5, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(228, 5, 'UndaCova', 'Lost (Where Dead Droids Go)', '', 6, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(229, 5, 'minusbaby', 'Slow Motion Humid Battle Water Tank', '07-minusbaby-slow_motion_humid_battle_water_tank.mp3', 7, '4:20', 0, 5195191, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(230, 5, 'KiloWatts', 'Perfected Everything', '', 8, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(231, 5, 'Automated Reason', 'It''s Not About What You Do, But Where You Decompose', '', 9, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(232, 5, 'mXENO', 'Landscape Interlude (Nice Day)', '', 10, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(233, 5, 'Theta', 'Kaleidoscope', '', 11, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(234, 5, 'Khonnor & This Instrument', 'Mrs.Anatomy', '', 12, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(235, 5, 'Chad Cells', 'It Takes Time', '', 13, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(236, 5, 'Mista Ed', 'I''m Mista Ed', '', 14, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(237, 5, 'Moroboshi Industries', 'Tired of Sex', '', 15, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(238, 5, 'VAEG', 'One Grey Day', '', 16, '', 0, NULL, '2011-04-24 19:48:05', '2011-04-26 09:59:43'),
(239, 5, 'Barnabee Log', 'Wally Was More Like the Spot Than the Fish', '', 17, '', 0, NULL, '2011-04-24 19:48:06', '2011-04-26 09:59:43'),
(240, 5, 'Temp Sound Solutions', 'Inthamood', '', 18, '', 0, NULL, '2011-04-24 19:48:06', '2011-04-26 09:59:43'),
(241, 5, 'Bad Feng Shui', 'Animal Friends', '', 19, '', 0, NULL, '2011-04-24 19:48:06', '2011-04-26 09:59:43'),
(242, 5, 'Lars Blek', 'Tristess', '', 20, '', 0, NULL, '2011-04-24 19:48:06', '2011-04-26 09:59:43'),
(243, 6, 'nendo_ani', 'slant_input', '', 1, '', 0, NULL, '2011-04-24 20:09:00', '2011-04-26 09:59:01'),
(244, 6, 'lektrogirl', 'ganggirlz', '', 2, '', 0, NULL, '2011-04-24 20:09:00', '2011-04-26 09:59:01'),
(245, 6, 'EPN101', 'beefing', '', 3, '', 0, NULL, '2011-04-24 20:09:00', '2011-04-26 09:59:01'),
(246, 6, 'drx', 'schwebeteilchen', '', 4, '', 0, NULL, '2011-04-24 20:09:00', '2011-04-26 09:59:01'),
(247, 6, 'carl', 'last_ninja_rmx', '', 5, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(248, 6, 'psilodumputer', 'psilodumputer', '', 6, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(249, 6, 'cylob', 'grunting_lost_it', '', 7, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(250, 6, 'jerohme', 'name_another', '', 8, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(251, 6, 'synth ethic', 'elven_eleven_intro', '', 9, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(252, 6, 'future-eater', 'spooky4bit', '', 10, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(253, 6, 'Mikrosopht', 'English - !EÂµo', '', 11, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(254, 6, 'monstatruk', 'robotsoapopera', '', 12, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(255, 6, 'orpheus', 'POW', '', 13, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(256, 6, 'minusbaby', 'chasing_sunlight', '14-minusbaby-chasing_sunlight.mp3', 14, '3:26', 0, 3294578, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(257, 6, 'mart', 'illusion', '', 15, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(258, 6, 'firestarter', 'bedroom_activities', '', 16, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(259, 6, 'razfaz', 'rightism_by_.mp3', '', 17, '', 0, NULL, '2011-04-24 20:09:01', '2011-04-26 09:59:01'),
(260, 21, 'minusbaby', 'Left [Sucka MCs Mix]', '', 1, '', 0, NULL, '2011-04-24 21:02:30', '2011-04-26 13:41:34'),
(261, 21, 'Petrified Productions', 'Patience', '', 2, '', 0, NULL, '2011-04-24 21:02:30', '2011-04-26 13:41:34'),
(262, 21, 'Petrified Productions', 'Frustration', '', 3, '', 0, NULL, '2011-04-24 21:02:30', '2011-04-26 13:41:34'),
(263, 21, 'Petrified Productions', 'Anger', '', 4, '', 0, NULL, '2011-04-24 21:02:30', '2011-04-26 13:41:34'),
(264, 21, 'minusbaby', 'A Large Part of Your Mind Sliced [What Mix]', '', 5, '', 0, NULL, '2011-04-24 21:02:30', '2011-04-26 13:41:34'),
(265, 21, 'Petrified Productions', 'Pursuit', '', 6, '', 0, NULL, '2011-04-24 21:02:30', '2011-04-26 13:41:34'),
(266, 21, 'Petrified Productions', 'Sorrow', '', 7, '', 0, NULL, '2011-04-24 21:02:31', '2011-04-26 13:41:34'),
(267, 21, 'Petrified Productions', 'Truth', '', 8, '', 0, NULL, '2011-04-24 21:02:31', '2011-04-26 13:41:34'),
(268, 22, 'crashfaster', 'Insert Coin', '', 1, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:25'),
(269, 22, 'crashfaster', 'Crimson Dreams', '', 2, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(270, 22, 'Doctor Popular featuring Beefy', 'Crimson Dreams [Doctor Popular vs crashfaster]', '', 3, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(271, 22, '8bit bEtty', 'Crimson Dreams [8bit bEtty vs Doctor Popular vs crashfaster]', '', 4, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(272, 22, 'crashfaster', 'Deep Slit', '', 5, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(273, 22, '8bit bEtty', 'Deep Slit (Remix for 18 Consoles)', '', 6, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(274, 22, 'minusbaby', 'Deep Slit [Red Wings Remix]', '07-crashfaster-deep_slit_[minusbabys_red_wings_remix].mp3', 7, '3:46', 0, 5431965, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(275, 22, 'crashfaster', 'Stabbed to Life', '', 8, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(276, 22, 'crashfaster', 'Stabbed to Life [Reconstructive Symphony Remix]', '', 9, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(277, 22, 'Doctor Popular', 'Stabbed to Life (Organic)', '', 10, '', 0, NULL, '2011-04-24 21:20:41', '2011-04-26 10:02:26'),
(278, 22, 'Doctor Popular', 'Crimson Dreams (Organic)', '', 11, '', 0, NULL, '2011-04-24 21:20:42', '2011-04-26 10:02:26'),
(279, 22, 'Doctor Popular', 'Deep Slit (Organic)', '', 12, '', 0, NULL, '2011-04-24 21:20:42', '2011-04-26 10:02:26'),
(280, 23, '4mat', 'Vertical', '', 1, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:15'),
(281, 23, 'David E. Sugar', 'Temper Temper', '', 2, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:15'),
(282, 23, 'Nullsleep', 'Supernova Kiss', '', 3, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:15'),
(283, 23, 'Bubblyfish', 'From Inner Shadow to Outer Shadow', '', 4, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:15'),
(284, 23, 'x|k', 'You''re Warm', '', 5, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:15'),
(285, 23, 'Rabato', 'Simachip', '', 6, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:15'),
(286, 23, 'gwEm & Counter Reset', 'Disco Snax (06 EQ)', '', 7, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:15'),
(287, 23, 'Vim', 'Finger on the Pulsewave', '', 8, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(288, 23, 'Saitone', 'Sadboy', '', 9, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(289, 23, 'Random', 'Downstairs', '', 10, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(290, 23, 'TouchBoy', 'Beatbox Racer (Edit)', '', 11, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(291, 23, 'USK', 'Lo-Bit Gangstar', '', 12, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(292, 23, 'Pepino', 'Faster Than Time', '', 13, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(293, 23, 'Aonami', 'Namnbass', '', 14, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(294, 23, 'YMCK', 'Carving the Rock', '', 15, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(295, 23, 'Anamanaguchi', 'Blackout City', '', 16, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(296, 23, 'Kplecraft', 'Ujitori', '', 17, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(297, 23, 'David Kristian', 'Plankton Comes Alive', '', 18, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(298, 23, 'Hally', 'A Tribute to Kyohei Sada [2006 Edition]', '', 19, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(299, 23, '6955', 'Punching Machine Data 002: Cabin Attendant', '', 20, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(300, 23, 'Mark DeNardo', 'Karate Suit', '', 21, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(301, 23, 'Mesu Kasumai', 'Worm Rider', '', 22, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(302, 23, 'Tugboat', 'Never Enough', '', 23, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(303, 23, 'Receptors', 'My Satellite', '', 24, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(304, 23, 'Rugar', 'TÃ¶m Mina Joggers FrÃ¢n SnÃ¶', '', 25, '', 0, NULL, '2011-04-24 22:01:04', '2011-04-26 10:01:16'),
(305, 23, 'Neil Voss', 'End If', '', 26, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(306, 23, 'Bud Melvin', '62 Miles', '', 27, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(307, 23, 'Covox', 'Switchblade Squadron', '', 28, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(308, 23, 'Coova', 'Ainochor', '', 29, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(309, 23, 'Chesterfield', 'Yodogawa Acid Rain', '', 30, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(310, 23, 'Bit Shifter', 'Edit Friends', '', 31, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(311, 23, 'Goto80', 'Spill', '', 32, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(312, 23, 'Jeroen Tel', 'Alternative Fuel', '', 33, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(313, 23, 'Starpause', 'Miss Pepper Mitt Pause Micromusic Edit', '', 34, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(314, 23, 'Herbert Weixelbaum', 'Beige Thistle Pop', '', 35, '', 0, NULL, '2011-04-24 22:10:18', '2011-04-26 10:01:16'),
(315, 23, '8GB', 'Lemon Prize', '', 36, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(316, 23, 'Maru', 'Electric Machine Forces', '', 37, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(317, 23, 'BodenstÃ¤ndig 2000', 'Lichtjare Von Daheim', '', 38, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(318, 23, 'glomag', 'Peoples Git Reddy', '', 39, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(319, 23, 'Virt', 'Staring at My Spaceship', '', 40, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(320, 23, 'The Depreciation Guild', 'Kickle''s Processional', '', 41, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(321, 23, 'Twilight Electric', 'Foreigner''s Journey', '', 42, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(322, 23, 'Quarta330', 'Chip Dub Express', '', 43, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(323, 23, 'Naruto', 'Artificial Intelligence Bomb', '', 44, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(324, 23, 'Tristan Perich', 'For Argeo', '', 45, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(325, 23, 'Lo-bat.', 'Sorting Riding Boots', '', 46, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(326, 23, 'Paza Rahm', '13v31n3v3r (3m1x)', '', 47, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(327, 23, 'minusbaby', 'Friquidiqui NÂº 1', '', 48, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(328, 23, 'RushJet1', 'Our Revolution', '', 49, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(329, 23, 'Crazy Q', 'G-Spot (Dirt Edit)', '', 50, '', 0, NULL, '2011-04-24 22:10:19', '2011-04-26 10:01:17'),
(330, 24, '8-Bit Operators', 'Tomorrow Never Knows [Megamix]', '', 1, '', 0, NULL, '2011-04-24 22:23:55', '2011-04-26 13:51:19'),
(331, 24, '8 Bit Weapon with ComputeHer', 'Eleanor Rigby', '', 2, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(332, 24, 'glomag', 'h3lt3r_sk3lt3r', '', 3, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(333, 24, 'Bacalao', 'Blackbird', '', 4, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(334, 24, 'Burnkit 2600', 'Being for the Benefit of Mr Kite!', '', 5, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(335, 24, 'Saskrotch', 'Paperback Writer', '', 6, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(336, 24, 'Psilodump', 'All You Need Is Love', '', 7, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(337, 24, 'minusbaby', 'Flying [El Barrio Mix]', '', 8, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(338, 24, 'Anamanaguchi', 'I Will', '', 9, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(339, 24, 'The Depreciation Guild', 'Because', '', 10, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(340, 24, 'Aonami', 'Back in the USSR', '', 11, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(341, 24, 'Bubblyfish', 'Piggies', '', 12, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(342, 24, 'Poke-1,170', 'When I''m 64', '', 13, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(343, 24, 'GOTO80', 'Come Together', '', 14, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(344, 24, 'Sloopygoop', 'Sgt. Pepper''s Lonely Hearts Club Band', '', 15, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(345, 24, 'Herbert Weixelbaum', 'Sie Liebt Dich (She Loves You)', '', 16, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(346, 24, 'Rabato', 'Revolution 8', '', 17, '', 0, NULL, '2011-04-24 22:23:56', '2011-04-26 13:51:19'),
(347, 25, 'minusbaby', 'The Oracle [Shake Your Oraculo]', 'minusbaby-the_oracle_[shake_your_oraculo].mp3', 1, '3:49', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(348, 25, 'DJ MasterKohta & BIG BROTHER, featuring Asaka Tomoko', 'Path of Scylla', '', 2, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(349, 25, 'Eiko Ishiwata', 'Black Gate Descent', '', 3, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(350, 25, 'Videogame Orchestra', 'Biogothic Grave', '', 4, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(351, 25, 'Matheus Manente', 'Rubinia', '', 5, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(352, 25, 'The Plasmas', 'Berserk', '', 6, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(353, 25, 'crashfaster', 'Somet Nac', '', 7, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(354, 25, 'Mattias HÃ¤ggstrÃ¶m Gerdt', 'Cyclades - Confrontation', '', 8, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(355, 25, 'GOTO80', 'Robot Chase', '', 9, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(356, 25, '(Pocket Groovy (Yoshi Miyamoto', 'Dunarys', '', 10, '', 0, NULL, '2011-04-24 22:49:16', '2011-04-26 14:13:49'),
(357, 25, 'Jacobo Garcia', 'No Mercy', '', 11, '', 0, NULL, '2011-04-24 22:49:17', '2011-04-26 14:13:49'),
(358, 25, 'Gryzor87', 'Path of Scylla', '', 12, '', 0, NULL, '2011-04-24 22:49:17', '2011-04-26 14:13:49'),
(359, 25, 'Magnus "SoulEye" PÃ¥lsson', 'Untulia', '', 13, '', 0, NULL, '2011-04-24 22:49:17', '2011-04-26 14:13:49'),
(360, 25, 'Tatsuhico', 'Storm Eye [Under Taker Remix]', '', 14, '', 0, NULL, '2011-04-24 22:49:17', '2011-04-26 14:13:49'),
(361, 27, 'noteNdo', 'Spelling Numbers [Live]', '', 1, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(362, 27, 'Graffiti Monsters', 'Letter B', '', 2, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(363, 27, 'IAYD', 'Acute Monocular Beam [Live]', '', 3, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(364, 27, 'Zabutom', 'Endroll [Live]', '', 4, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(365, 27, 'Tonylight', 'Happy End [Live]', '', 5, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(366, 27, 'm-.-n', 'Mangash [Live]', '', 6, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(367, 27, 'Sidabitball', 'Kids on Acid [Live]', '', 7, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(368, 27, 'Unicorn Dream Attack', '4l0n3 [Live]', '', 8, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(369, 27, 'Animal Style', '2 of 9 [Live]', '', 9, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(370, 27, 'Low-Gain', 'Summer Fun [Live]', '', 10, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(371, 27, 'Cheap Dinosaurs', 'Hot Plate [Live]', '', 11, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(372, 27, 'Role Model', 'Pop5 [Live]', '', 12, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(373, 27, 'glomag', '4shame [Live]', '', 13, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(374, 27, 'Bit Shifter', 'Easy Prey [Live]', '', 14, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(375, 27, 'minusbaby', 'Minha Caipirinha Ã‰ Ã“tima [â€¦]', '15-minusbaby-minha_caipirinha_e_otima_(very_very)_[live].mp3', 15, '3:58', 0, 7071259, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(376, 27, 'MeNeO', 'Fica la Figa [Live]', '', 16, '', 0, NULL, '2011-04-25 06:58:29', '2011-04-26 13:44:55'),
(377, 27, 'Jellica', 'Man Two (Waves of Fear) [Live]', '', 17, '', 0, NULL, '2011-04-25 07:27:48', '2011-04-26 13:44:55'),
(378, 27, 'Mr. Spastic', 'FXLP [Live]', '', 18, '', 0, NULL, '2011-04-25 07:27:48', '2011-04-26 13:44:55'),
(379, 27, 'Bubblyfish', 'Metaphysical Dreams [Live]', '', 19, '', 0, NULL, '2011-04-25 07:27:48', '2011-04-26 13:44:55'),
(380, 27, 'Sulumi', 'Sweetly [Live]', '', 20, '', 0, NULL, '2011-04-25 07:27:48', '2011-04-26 13:44:55'),
(381, 27, 'Cow''p', 'Stush Boy [Live]', '', 21, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(382, 27, 'Nullsleep', 'Limit Break [Live]', '', 22, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(383, 27, 'STu', 'Singing Robot/MYMelody [Live]', '', 23, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(384, 27, 'Dubmood', 'SaturÃ© Nights Part.1 [Live]', '', 24, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(385, 27, 'Starscream', 'Andrew Jackson [Live]', '', 25, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(386, 27, 'Lissajou', 'Blibdoolpoolp [Excerpt] [Live]', '', 26, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(387, 27, 'Syphus', 'Pennies/Fuelship [Live]', '', 27, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(388, 27, 'nordloef', 'The Ugliest Boy in the Class [â€¦]', '', 28, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(389, 27, 'Ikuma', 'Jealous [Live]', '', 29, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(390, 27, 'Anamanaguchi', 'Dawn Metropolis [Live]', '', 30, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(391, 27, 'USK', 'Boot Up [Live]', '', 31, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(392, 27, 'Trash80', 'Missing You [Live]', '', 32, '', 0, NULL, '2011-04-25 07:27:49', '2011-04-26 13:44:55'),
(393, 28, 'Tettix', 'A New Challenger!', '', 1, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(394, 28, 'Tettix', 'Disasterpeace vs. Dragon Punch!', '', 2, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(395, 28, 'Tettix', 'HÃ©las Techne vs. Carotid Restraint!', '', 3, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(396, 28, 'Tettix', 'Tettix vs. One Inch Dragon Punch!', '', 4, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(397, 28, 'Tettix', 'Continue?', '', 5, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(398, 28, 'Tettix', 'minusbaby vs. Clothesline!', '06-tettix-clothesline_[minusbaby_remix].mp3', 6, '3:49', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(399, 28, 'Tettix', 'Alex Mauer vs. Flying Butt Pliers!', '', 7, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(400, 28, 'Tettix', 'Derris-Kharlan vs. Exploding Heart Technique!', '', 8, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(401, 28, 'Tettix', 'Tettix vs. Demon Knuckle!', '', 9, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(402, 28, 'Tettix', 'Game Over.', '', 10, '', 0, NULL, '2011-04-25 09:51:28', '2011-04-26 13:39:51'),
(403, 29, 'fasterbaby', 'Grandmaster Chief', 'fasterbaby-grandmaster_chief.mp3', 1, '3:32', 0, 5098049, '2011-04-25 10:23:31', '2011-04-26 14:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
CREATE TABLE IF NOT EXISTS `tweets` (
  `id` int(32) NOT NULL auto_increment,
  `twitter_id` bigint(20) NOT NULL default '0',
  `posted` int(32) NOT NULL default '0',
  `tweet` varchar(160) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`id`, `twitter_id`, `posted`, `tweet`) VALUES
(1, 79987899059277824, 1307930219, 'â€¢ Happy Puerto Rican Day! I''m going to stay far away from the parade while listening to Ray Barretto, Willie ColÃ³n and BalÃºn albums all day.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `group_id` int(11) NOT NULL default '0',
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `group_id`, `created`, `modified`) VALUES
(1, 'openback', '9020f819bd893216d3efaa86fefd5d669f126d14', 0, '2011-03-19 15:39:48', '2011-03-19 15:39:48'),
(2, 'minusbaby', '1032571865d6d8f09675c2444a9292e86a785720', 0, '2011-03-19 15:40:51', '2011-03-19 15:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
CREATE TABLE IF NOT EXISTS `venues` (
  `id` int(32) NOT NULL auto_increment,
  `name` varchar(140) NOT NULL default '',
  `address1` varchar(140) NOT NULL default '',
  `address2` varchar(140) default NULL,
  `city` varchar(140) NOT NULL default '',
  `state` varchar(140) default NULL,
  `zip` varchar(140) default NULL,
  `country` varchar(2) default NULL,
  `url` text,
  `map` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`id`, `name`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `url`, `map`) VALUES
(1, 'Studio 34', '4522 Baltimore Avenue', '', 'Philadelphia', 'Pennsylvania', '19143', 'US', 'http://studio34yoga.com/', 'http://goo.gl/s1ShO'),
(2, 'The Tank', '354 West 45th Street', '', 'New York', 'New York', '10036', 'US', 'http://thetanknyc.org/', 'http://goo.gl/F8TQU'),
(3, 'Fat Buddha', '212 Avenue A', '', 'New York', 'New York', '10009', 'US', 'http://www.google.com/maps/place?cid=8884496948534234422&q=fat+buddha+nyc&fb=1&gl=us&hq=fat+buddha&hnear=New+York,+NY', 'http://goo.gl/BSXDd'),
(5, 'Plano B', 'Rua Francisco Muratori, 2A', '', 'Lapa', 'Rio de Janeiro', '20230', 'BR', 'http://planob.net', 'http://goo.gl/UOBjd'),
(6, 'Oi Futuro', 'Rua Visconde de PirajÃ¡, 54', '', 'Ipanema', 'Rio de Janeiro', '22410-000', 'BR', 'http://www.oifuturo.org.br/cultura/oi-futuro-ipanema', 'http://goo.gl/qZQHT'),
(7, 'The Times Center', '242 West 41st Street', '', 'New York', 'New York', '10018', 'US', 'http://thetimescenter.com', 'http://goo.gl/d8UKF'),
(11, 'Babycastles @ Showpaper', '217 E 42nd Street', '', 'New York', 'New York', '10017', 'US', 'http://www.babycastles.com', 'http://goo.gl/wsTUo'),
(12, 'Showcase Live at Patriot Place', '23 Patriot Place', '', 'Foxborough', 'Massachusetts', '02035', 'US', 'http://www.showcaselive.com', 'http://goo.gl/qWedU'),
(13, 'Kokoro Studio', '682 Geary Street', '', 'San Francisco', 'California', '94102', 'US', 'http://kokorostudio.us', 'http://goo.gl/0mK36'),
(14, 'Washington State Convention Center', '800 Convention Place', '', 'Seattle', 'Washington', '98101', 'US', 'http://www.wsctc.com', 'http://goo.gl/cUtmH'),
(15, 'DNA Lounge', '375 Eleventh Street', '', 'San Francisco', 'California', '94103', 'US', 'http://www.dnalounge.com', 'http://goo.gl/Niokj'),
(16, 'Livraria da Esquina', 'Rua do Bosque, 1254', '', 'Barra Funda', 'SÃ£o Paulo', '', 'BR', 'http://www.livrariadaesquina.com.br', 'http://goo.gl/eJI2I'),
(17, 'Sesi-SP', 'Avenida Paulista, 1313', '', 'Bela Vista', 'SÃ£o Paulo', '01311', 'BR', 'http://www.sesisp.org.br', 'http://goo.gl/w0jTl'),
(18, 'Hotel Pennsylvania', '401 7th Avenue', '', 'New York', 'New York', '10001', 'US', 'http://www.hotelpenn.com/', 'http://goo.gl/razW9'),
(19, 'LoFi Loft', '1410 Rue Wolfe', '', 'MontrÃ©al', 'QuÃ©bec', 'H1W1R7', 'CA', '', 'http://goo.gl/yEuR0'),
(20, 'The High Line', 'Washington St & Gansevoort St', '', 'New York', 'New York', '10014', 'US', 'http://www.thehighline.org/', 'http://goo.gl/9vTQR'),
(21, 'La Kueva', '39-31 Queens Boulevard', '', 'Queens', 'New York', '11104', 'US', 'http://www.lakueva.com', 'http://goo.gl/Mf6sm'),
(23, 'Bar Passeport', '2037 Rue Saint-Denis', '', 'MontrÃ©al', 'QuÃ©bec', 'H2X 3K8', 'CA', 'http://www.barpasseport.com', 'http://goo.gl/h9U4S'),
(24, 'Niagara Bar', '112 Avenue A', '', 'New York', 'New York', '10009', 'US', 'http://www.niagarabar.com', 'http://goo.gl/MbMvf'),
(25, 'The Middle East Â· Upstairs', '480 Massachusetts Avenue', '', 'Cambridge', 'Massachusetts', '02139', 'US', 'http://www.mideastclub.com', 'http://goo.gl/Djub6'),
(26, 'The Bell House', '149 7th Street', '', 'Brooklyn', 'New York', '11215', 'US', 'http://www.thebellhouseny.com', 'http://goo.gl/nTKG8'),
(27, 'Grey Gallery & Lounge', '1122 E Pike Street', 'Box 1495', 'Seattle', 'Washington', '98122', 'US', 'http://www.greygalleryandlounge.com', 'http://goo.gl/BZFVF'),
(28, 'Ground Kontrol', '511 NW Couch Street', '', 'Portland', 'Oregon', '97209', 'US', 'http://www.groundkontrol.com', 'http://goo.gl/wnjNe'),
(29, 'Chop Suey Cafe & Lounge', '347 East 1st Street', '', 'Los Angeles', 'California', '90012', 'US', 'http://www.chopsueycafeandlounge.com', 'http://goo.gl/j5BP5'),
(30, 'The Studio at Webster Hall', '125 E 11th Street', '', 'New York', 'New York', '10003', 'US', 'http://www.websterhall.com/thestudio', 'http://goo.gl/Ytg4S'),
(31, 'Pilam', '3914 Spruce Street', '', 'Philadelphia', 'Pennsylvania', '19104', 'US', 'http://www.myspace.com/thepilam', 'http://goo.gl/YZm3y'),
(32, 'No Malice Palace', '197 E. 3rd Street', '', 'New York', 'New York', '10009', 'US', 'http://www.nomalice.com', 'http://goo.gl/G5Xya'),
(33, 'Otto''s Shrunken Head', '538 E. 14th Street', '', 'New York', 'New York', '10009', 'US', 'http://www.ottosshrunkenhead.com', 'http://goo.gl/6TEKp'),
(34, 'Sonotheque', '1444 West Chicago Avenue', '', 'Chicago', 'Illinois', '60612', 'US', 'http://www.sonotheque.net', 'http://goo.gl/foMlX'),
(35, 'The Annex', '', '', 'New York', 'New York', '', 'US', '', NULL),
(36, 'TÅ±zraktÃ©r', 'Budapest VI. ker. HegedÅ± u. 3.', '', 'Budapest', '', '', 'HU', 'http://tuzrakter.hu', 'http://goo.gl/VRtCv'),
(37, 'Teatr Polski', '', NULL, 'Wroc&#0322;aw', '', NULL, 'PL', 'http://www.teatrpolski.wroc.pl', NULL),
(38, 'Arsenal', '', NULL, 'Wroc&#0322;aw', '', NULL, 'PL', 'http://www.muzeum.miejskie.wroclaw.pl', NULL),
(39, 'Platform4', '', NULL, 'Aalborg', '', NULL, 'DK', 'http://platform4.dk', NULL),
(40, 'Korova', '', NULL, 'Liverpool', 'England', NULL, 'GB', 'http://www.korova-liverpool.com', NULL),
(41, 'The Courtyard Theatre', '', NULL, 'London', 'England', NULL, 'GB', 'http://www.thecourtyard.org.uk', NULL),
(42, 'Santos Party House', '96 Lafayette Street', '', 'New York', 'New York', '10013', 'US', 'http://www.santospartyhouse.com', 'http://goo.gl/obaVL'),
(43, 'Don Pedro', '', '', 'New York', 'New York', '', 'US', 'http://www.myspace.com/donpedrobar', NULL),
(44, 'Wicked Willy''s', '149 Bleecker Street', '', 'New York', 'New York', '10012', 'US', 'http://3.ly/kec', 'http://goo.gl/jxzIq'),
(45, 'Liberty Lands Park', '913-961 N 3rd Street', '', 'Philadelphia', 'Pennsylvania', '19176', 'US', '', 'http://goo.gl/Pv9om'),
(46, 'Public Assembly', '70 North 6th Street', '', 'Brooklyn', 'NY', '11211', 'US', 'http://www.publicassemblynyc.com/', 'http://goo.gl/xiSMv'),
(47, 'Some Warehouse', '', NULL, 'St. Louis', 'MO', NULL, 'US', '', NULL),
(48, 'Eyebeam', '540 W. 21st Street', '', 'New York', 'NY', '10011', 'US', 'http://eyebeam.org', 'http://goo.gl/0By6z'),
(49, 'Union Pool', '484 Union Avenue', '', 'Brooklyn', 'New York', '11211', 'US', 'http://unionpool.blogspot.com/', 'http://goo.gl/wkiWp'),
(50, 'The Foundry', '84-86 Great Eastern Street', '', 'London', 'England', 'EC2', 'GB', 'http://www.foundry.tv', 'http://goo.gl/Iv9e7'),
(51, 'Vertexlist', '138 Bayard Street', '', 'Brooklyn', 'New York', '11222', 'US', 'http://www.vertexlist.net', 'http://goo.gl/jFeLf'),
(52, 'OpenAir', '', '', 'New York', 'New York', '', 'US', '', NULL),
(53, 'Limehouse Town Hall', '646 Commercial Road', '', 'London', 'England', 'E14 7HA', 'GB', 'http://twenteenthcentury.com/lth', 'http://goo.gl/GnmE6'),
(54, 'Remote Lounge', '327 Bowery', '', 'New York', 'New York', '10003', 'US', '', 'http://goo.gl/fuiP4'),
(55, 'Warsaw', '261 Driggs Avenue', '', 'Brooklyn', 'New York', '11222', 'US', 'http://www.polishnationalhome.com/warsaw.html', 'http://goo.gl/yAUfT'),
(56, 'FUN', '130 Madison Street', '', 'New York', 'New York', '10002', 'US', '', 'http://goo.gl/Bhhvl'),
(57, 'The Lookout', '3600 16th Street', '', 'San Francisco', 'California', '94114', 'US', 'http://lookoutsf.com', 'http://goo.gl/jzr0o'),
(58, 'Plano B', 'Rua CÃ¢ndido dos Reis nÂº 30', '', 'Porto', '', '4050', 'PT', 'http://www.planobporto.com', 'http://goo.gl/Hbvp3'),
(59, 'DogCaffÃ¨', 'Rua Texas, 605', '', 'Brooklin', 'SÃ£o Paulo', '04557-000', 'BR', 'http://dog.tv.br/dogcaffe', 'http://goo.gl/ypuSZ');

