-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: newsland
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Economics'),(2,'Sports'),(3,'Culture'),(4,'Entertainment'),(5,'Lifestyle');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `comment_details`
--

DROP TABLE IF EXISTS `comment_details`;
/*!50001 DROP VIEW IF EXISTS `comment_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `comment_details` AS SELECT 
 1 AS `commentid`,
 1 AS `newsid`,
 1 AS `userid`,
 1 AS `fname`,
 1 AS `commentcontent`,
 1 AS `commenttime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `newsid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `commentcontent` text COLLATE utf8_unicode_ci NOT NULL,
  `commenttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentid`),
  KEY `fk_userid_idx_idx` (`userid`),
  KEY `fk_newsid_idx` (`newsid`),
  CONSTRAINT `fk_newsid` FOREIGN KEY (`newsid`) REFERENCES `news` (`newsid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,4,1,'Go, go Maryland! I am your biggest fan!','2016-11-29 22:14:17'),(4,5,1,'You guys are so not important to me.','2016-11-29 22:17:21'),(5,3,1,'Interesting topic.','2016-11-29 22:23:45'),(8,7,3,'Ha very interesting :)','2016-11-30 00:24:00');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `categoryid` int(11) NOT NULL,
  `publishtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`newsid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Scepticism about a Brexit apocalypse looks increasingly justified','In the months leading up to the EU referendum in June, George Osborne had two people he could always rely on to back the argument that Brexit would have immediate, dire consequences for the UK economy. One was Christine Lagarde, the managing director of the International Monetary Fund. The other was Ángel Gurría, the secretary general of the Organisation for Economic Co-operation and Development.','brexit.jpg','In the months leading up to the EU referendum in June, George Osborne had two people he could always rely on to back the argument that Brexit would have immediate, dire consequences for the UK economy. One was Christine Lagarde, the managing director of the International Monetary Fund. The other was Ángel Gurría, the secretary general of the Organisation for Economic Co-operation and Development. There has been another retreat to a new fallback position. Yes, the IMF and the OECD admit, we were taken by surprise by the strength of the economy in the months after the Brexit vote and we have been forced to revise up our growth forecasts for 2016. But, take it from us, the outlook for the UK is still grim. The downturn is coming – it is simply a matter of time.',1,'2016-11-28 18:03:58'),(2,'New Amazon Echo will comes with this HUGE upgrade','New Amazon Echo will comes with this HUGE upgrade  This remorseless drive to overturn','amazon1.jpg','Amazon is preparing a major update for the next edition of its Echo smart speaker.\r\nThe online retail giant is set to reveal an upgraded version of the Amazon Echo featuring a seven-inch touchscreen display with the next few months, reports have claimed.\r\nThis premium version of the Echo should be released early next year as Amazon looks to take the fight to larger rivals.\r\nThe news comes from a report in Bloomberg, which says that Amazon is keen to capitalise on the success of its first generation smart home device.\r\n\r\nThe source says the device will offer a seven inch high-definition touchscreen in order to give users a better look at the information provided by the Alexa smart assistant.\r\n\r\nThis includes getting more details on services such as weather forecasts, calendar appointments, and news headlines.\r\n\r\nThe screen will also be able to be angled, allowing users to view information if they are standing or sitting.\r\nThe next Amazon Echo will also get a major update in sound quality, the reports claim.\r\n\r\nThe new \'high-grade\' speakers will let users enjoy better quality audio.\r\n\r\nAmazon revealed that the Echo would be getting an on-demand music streaming service to compete with the likes of Spotify and Apple Music.\r\nThe news comes as Amazon continues to roll out updates to the first edition of Echo, which was officially launched in September.\r\n\r\nThe product\'s Alexa smart assistant is capable of over 3,000 services, called skills, and will understand and respond to naturalistic voice commands.\r\n\r\nThis includes playing music, reading novels from Audible, ordering a cab with Uber and your favourite takeaway with Just Eat, it can tune into local radio stations, answer queries about sports teams, weather, traffic conditions, and more.',5,'2016-11-29 18:40:22'),(3,'Pushchair essentials for busy parents','There are so many factors to consider when picking a pushchair or pram. Our guide to getting the most out of your baby’s first ride will make this big decision a walk in the park…','baby1.jpg','Making eyes. Babies love knowing that mummy or daddy is close by, so eye contact is really important. The Stokke Xplory allows baby to not only be facing you but its innovative high seating position means you’ll be able to pull faces, smile and interact with your baby at the same level. Hungry baby. Newborn babies have tiny stomachs so need eat often. If you’re planning a trip out make sure you’re fully prepared with everything you might need for feeding time and give them something to eat before you leave the house. The Stokke Xplory has plenty of storage to keep those goodies safe until they’re needed. Your baby is never too small for toys that will stimulate and delight them. Black and white books, rattles and toys with different textures or sounds are perfect for a young baby and can be attached to the pram so you don’t have to worry about packing one every time you head out. Even though they can’t respond, babies love it when they’re talked to, especially by their parents as they will recognise your voices best from their time in the womb. The Stokke Xplory has been designed like no other pram, focusing on maintaining a very close connection between parent and baby. The Stokke Xplory has adjustable height meaning you and your baby can discover the world together. Point out trees, plants, flowers, animals, a bus, a car… as your baby learns about the world you can enjoy seeing it through their eyes, too. When your baby is a little older they might enjoy sitting in a different position for a whole new sensory experience. The Stokke Xplory has a number of different parent- and forward-facing options (sleep, rest or active) to suit every little explorer so you can easily turn them to face outwards or back to you if they prefer. You want to make sure that your baby is comfortable and secure in their pram to fully enjoy trips out. A big part of this is choosing a pram that can provide a smooth ride and is easier to steer. The Stokke Xplory features a two-wheel function that makes it easy to walk over uneven surfaces like pebbles. Plus, the easy swivel front wheels make manoeuvring through tight spaces a breeze.',5,'2016-11-29 18:40:48'),(4,'Maryland prepared for Pittsburgh\'s size, physicality','Maryland’s two wins in the Barclays Classic last weekend, including a 69-68 nailbiter over a Kansas State team that is built quite similarly to Pittsburgh, are something Terps head coach Mark Turgeon believes will help his team Nov. 29 against the Panthers.','maryland1.jpg','COLLEGE PARK, Md. -- When looking at Maryland’s ACC-Big Ten Challenge opponent, Pittsburgh, it’s not the statistics or 5-1 record that jump out. Rather, the overriding characteristics of the Panthers are their size and experience.\r\nBut Maryland’s two wins in the Barclays Classic last weekend, including a 69-68 nailbiter over a Kansas State team that is built quite similarly to Pittsburgh, are something Terps head coach Mark Turgeon believes will help his team Nov. 29 against the Panthers.\r\n\r\n“We’re going to have to deal with their size,” Turgeon said.. “You thought we looked small against Towson, imagine how we’re going to look [Tuesday] night against this group. But we’ve gotten a lot more physical this weekend. I think we played two really good teams (Richmond and Kansas State). We got a little bit tougher this weekend and we rebounded better so that will help us going into Pittsburgh.”\r\n\r\nIn his first season as Pittsburgh’s head coach, Kevin Stallings, is deploying a starting lineup that has an average height of 6-foot-8 and includes four seniors. The Panthers backcourt alone could cause some problems for the Terps on Tuesday night. Senior guards Jamel Artis and Chris Jones are 6-foot-7 and 6-foot-6, respectively, and will be guarded most of the game by Maryland’s 6-foot Anthony Cowan and 6-foot-3 Melo Trimble.\r\nBut defending taller players doesn’t bother Cowan, who cited his high school career at Washington (D.C.) St. John’s College when he had to guard fellow DMV standouts V.J. King (now with Louisville) and Markelle Fultz (now with Washington), who are both much bigger than he is.\r\n\r\n“Whenever I see a tall player, I prefer it actually,” Cowan said. “I like the challenge. So when I play a taller player I don’t shy away or anything, I make sure I go at him also.”\r\n\r\nThe matchup with Pittsburgh could also give Turgeon a good opportunity to test true freshman Kevin Huerter at the two in a bigger lineup. Maryland’s health and therefore its depth are improving, which could allow Turgeon to slide Trimble to point guard, insert Huerter at shooting guard, use L.G. Gill’s size at the three and then play any combination of Michal Cekovsky, Damonte Dodd and Ivan Bender in the post.\r\n\r\nBut whoever is on the floor for the Terps at any given time should know what is expected of them from their coaches, who have been preaching to their team the importance of being physical against the Panthers.\r\n\r\n“One word that the coaching staff has been stressing this game has been toughness,” Huerter said. “Last game we knew Kansas State was going to be big and athletic and like to offensive rebound. The coaches drew on the board before the game the word: Toughness. So we had a bunch of guys that we’re going to be ready to scrap and be tough and battle out there. And I think that’s going to be important moving forward too.”\r\n\r\nThe Terps’ frontcourt is finally starting to take form with the return of 7-footers Michal Cekovsky (foot) and Damonte Dodd (concussion) from injuries, and while Pittsburgh’s bigs don’t necessarily have the length that Maryland’s post players have, 6-foot-8, 230-pound Sheldon Jeter and 6-foot-9, 235-pound Michael Young bring enough beef and physicality down low to be effective for the Panthers.\r\n\r\nAll the more reason why Turgeon could opt to go big at times, but a small-ball lineup with Gill potentially guarding Young could also be in the works because of their familiarity with one another.\r\n\r\nGill’s former school Duquesne plays against Pittsburgh every season because of the proximity of the two universities, so he knows Young’s game. Now that Gill can be utilized at several different positions for Maryland, he might become one of the Terps’ best weapons on defense.\r\n\r\n“I think [Gill] had some really good minutes in the second half against Kansas State the other night and we just now moved him back to his natural position so I think he’ll feel comfortable playing against Pittsburgh,” Turgeon said. “This Michael Young kid, wow is he a load. We haven’t seen anything like him yet this year. I know [Gill] has matched up against him in the past, so we’ll see how it goes.”\r\n\r\nTurgeon also knows that his team’s ability to go small and use its quickness could also be one of its biggest advantages over the Panthers on Tuesday night.\r\n\r\n“They can give us some matchup problems but they have to chase us too,” Turgeon said. “They’re switching everything and don’t really care about matchups, so we’re going to have to adjust to that quickly and then take advantage of those matchups.”\r\n\r\nTip-off between Maryland and Pittsburgh is set for 7 p.m. EST at Xfinity Center in College Park. The game will be televised on ESPN2.',2,'2016-11-29 18:53:08'),(5,'Rob Kardashian Has Moved In with Blac Chyna: Daughter Dream \'Has Changed His Life!\'','His daughter Dream is less than three weeks old, but already Rob Kardashian is happily settled into life as a dad.','dbaby1.jpg','His daughter Dream is less than three weeks old, but already Rob Kardashian is happily settled into life as a dad.\r\n\r\n“Rob is super hands on with Dream,” says an insider. “She’s changed his life. She makes him want to be better. And he’s spending a lot more time with his family.”\r\n\r\n\r\nAnd after a rocky few months, the reality star, 29, is also in a good place with fiancée Blac Chyna. Though the pair were living apart up until Dream’s birth, the insider says the new parents are now living together in her home so that Kardashian can spend as much time as possible with his daughter.\r\n\r\n“Rob wants to live with Chyna and spend every day with Dream,” says a Kardashian source. “He is making a big effort to get along with Chyna. She seems very happy with him. They are getting along great and enjoying parenting together.”\r\n\r\nAnd if Kardashian’s gushy social media posts about fatherhood are any indication, the once troubled star is finally content. “Rob is so much happier now,” says the insider. “He is obsessed with his baby girl!”\r\n\r\nAfter welcoming his daughter into the world, Kardashian took to Instagram to celebrate the arrival of Dream.',4,'2016-11-29 19:40:18'),(7,'Museum Cafeteria Serves Black History and a Bit of Comfort','Chefs talk about pressure all the time: brutal shifts when the wait for a table is an hour long, an important critic is in the restaurant and your best sous-chef just sliced her finger to the bone.','african1.jpg','WASHINGTON — Chefs talk about pressure all the time: brutal shifts when the wait for a table is an hour long, an important critic is in the restaurant and your best sous-chef just sliced her finger to the bone.\r\n\r\nBut they don’t know pressure like the cooks here at the Sweet Home Café inside the National Museum of African American History and Culture.\r\n\r\nFirst, consider the sheer volume of work. Some days, nearly 2,000 people walk through the cafe door. Waits for tables can stretch to two hours in a restaurant that essentially serves only lunch. It’s been that way ever since the museum, the Smithsonian’s newest, opened two months ago.\r\n\r\nCrowds aren’t the biggest problem, though. Cooks here have the weight of history on their shoulders. They are trying to tell the story of the African diaspora through food that customers grew up eating and have deeply held opinions about.\r\n\r\nContinue reading the main story\r\nRELATED COVERAGE\r\n\r\n\r\nEdgar Chase Jr., Purveyor of Creole Cuisine, Dies at 88 NOV. 23, 2016\r\nrecipe\r\nCOOKING\r\nCreole Gumbo By Matt Lee And Ted Lee 2 hours 30 minutes\r\nrecipe\r\nCOOKING\r\nSouthern Pan-Fried Chicken By Kim Severson 1 hour 15 minutes, plus about 24 hours for brining and soaking\r\nrecipe\r\nCOOKING\r\nCalas By Kim Severson 20 minutes\r\nrecipe\r\nCOOKING\r\nBrooklyn-Style Hoppin’ John By Kim Severson two hours\r\n“It’s extremely intense,” said Jerome Grant, the executive chef at the cafe, which is managed by Restaurant Associates along with Thompson Hospitality, the largest black-owned food service company in America.\r\n\r\nMr. Grant recently sat down at a table where a church group from Houston was having lunch. A woman he estimates was in her 70s gave him a tough critique of the cafe’s smoked meats. Mr. Grant explained that the restaurant used a smoker that can hold 800 pounds of meat, built by a company in Oklahoma.\r\n\r\n“Oh, that’s where you’ve gone wrong,” she told the chef. “People in Oklahoma don’t know anything about barbecuing or smoking nothing.”\r\n\r\nMr. Grant had been the chef at the Mitsitam Cafe in the National Museum of the American Indian, which opened in 2004 and was the Smithsonian’s first attempt to embrace the idea that a museum’s cafeteria was as important to understanding culture as the art, literature and historical documents on display.\r\n\r\nSweet Home Café is intended to both expand the understanding of the black experience in America and comfort museumgoers who spend hours exploring a collection that is both painful and powerful.\r\n\r\n“That’s why the name works,” said Mallory Bowen, one of the lead cooks. “We want people to feel comforted and feel at home after seeing some harsh things. We tell people: ‘You’re home now. Welcome home.’”\r\n\r\nOf course, a cafeteria line is not the most comforting setting, but once you pick up a tray and start wandering from station to station, the history lessons start looking delicious.\r\n\r\nDiners who take the time can learn how pan-roasted trout glazed in hazelnut butter and stuffed with mustard greens or a bowl of beefy son-of-a-gun stew with barley and root vegetables tells the story of freed slaves who headed west to work as ranch hands.\r\n\r\nBoth the trout and the stew are in the Western Range section of the cafeteria. It’s one of four stations attempting to categorize the culinary history of a group of people who cooked in everybody’s kitchens and so have an outsize influence on the American diet.\r\n\r\n“It’s a dining style that transcends race and region,” said Albert Lukas, a supervising chef who for two years traveled the country like an anthropologist, seeking recipes and advice from black home cooks and professional chefs.\r\n\r\nThe intellectual architecture for the cafe sprang from the work of Dr. Jessica B. Harris, the food writer and scholar who provided a research paper on the food of the African diaspora to the museum’s scholarly committee three years ago. She narrated parts of the museum’s culinary exhibition and donated personal items, and even hand-carried a chef’s jacket from Leah Chase, the New Orleans Creole cook, to give to the curators.\r\n\r\nDr. Harris proposed dividing the cafeteria into five sections. Four made it, including the Agricultural South station, with its emphasis on familiar dishes like fried chicken, chopped pork barbecue and Gullah-style hoppin’ John made with the small, ruddy Sea Island red peas that were an essential crop in the antebellum rice culture of South Carolina.\r\n\r\nThe Creole Coast station features Gulf shrimp over Anson Mills grits, as well as a catfish po’ boy and Alabama-style barbecued chicken, with its white sauce built from apple cider vinegar and mayonnaise.\r\n\r\nPicking exactly which version of which dish to serve remains a challenge, and the menu will continue to evolve, Mr. Lukas said. Early debates included whether the Caribbean pepper pot served with a piece of oxtail on the bone should reflect a style more common in Jamaica or in Guyana, whether the cornbread should have sugar, and whether the collard greens should be seasoned with pork, smoked turkey or no meat at all. (They went with the Guyanese, the cornbread with sugar, and the collards with turkey.)\r\n\r\nMr. Lukas also had to be mindful of what diners may want, or not want, to eat. “Obviously, chitterlings would be wildly significant in terms of dining culture, but it would be a tough thing to sell,” he said.\r\n\r\nThe balance between authenticity and palatability is the biggest challenge with museum food, said Gillian Clark, a former Washington chef who now lives in Alabama and is developing a menu for the Mobile Museum of Art.\r\n\r\n“Think about a hoe cake,” Ms. Clark said. “I’m in a field with water and cornbread, and I am starving, and I am going to wipe my sweaty handkerchief on this dirty hoe and rub it with this piece of meat that was in my pocket. That’s authentic. But if I serve that in my restaurant, people are going to run out of here.”\r\n\r\nAt Sweet Home Café, the back story is often a bigger factor than the recipe. Thomas Downing was the son of freed slaves who became an oysterman in New York in the early 1800s and went on to operate one of the plushest oyster restaurants in New York, join the Underground Railroad and help form the city’s antislavery society. His story is represented with a proper New York City oyster pan roast, which sells for $12.95 in the North States section.\r\n\r\nA fifth station, Dr. Harris had suggested, should be called Culinary Cousins. The idea was to more clearly underscore the connection with Africa. For example, diners might eat the food of Senegal as a way to understand the rice culture of the Carolinas.\r\n\r\n“Africa had an enormous influence everywhere, and the whole notion is that the food we eat here and now is not monolithic,” she said.\r\n\r\nBut Dr. Harris is mindful that she is an academic and not a restaurant designer, and that only so much culture can be reflected in a kitchen that serves hundreds of people a day.\r\n\r\nEven with all the scholarly thoughtfulness and culinary skill brought to bear on the rest of the menu, the buttermilk-soaked chicken, which sells for $14.95 with two side dishes, remains the most popular order. It sometimes accounts for more than a third of all sales, leaving the chefs a little forlorn that people are missing out on the other offerings.\r\n\r\nWhat’s the attraction? People have their theories. Carla Hall, the television personality who runs a fried chicken restaurant in Brooklyn, has signed on as a culinary ambassador for the museum. She’s an advocate for vegetables in the cafe, because she thinks too many people think of Southern food as pork and macaroni and cheese. But she gets why fried chicken is so popular.\r\n\r\n“Fried chicken is the one thing I would never want to make at home,” she said, “so that becomes that celebratory item.”\r\n\r\nEven Dr. Harris, who visited the cafeteria this month for the first time, after hosting a discussion with Pierre Thiam about his book “Senegal: Modern Senegalese Recipes From the Source to the Bowl,” took a box of chicken to go.\r\n\r\n“It’s portable,” she said. “I don’t want to carry son-of-a-gun stew in a box on a plane.”\r\n',3,'2016-11-29 20:57:27');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Danny','Brown','danny@brown.com','123456',1),(2,'Monica','Williams','monica@williams.com','789654',1),(3,'Daniel','Smith','daniel@smith.com','852369',1),(4,'Johnny','Walker','johnny@walker.com','007007',9);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'newsland'
--

--
-- Final view structure for view `comment_details`
--

/*!50001 DROP VIEW IF EXISTS `comment_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `comment_details` AS select `comments`.`commentid` AS `commentid`,`comments`.`newsid` AS `newsid`,`comments`.`userid` AS `userid`,`users`.`fname` AS `fname`,`comments`.`commentcontent` AS `commentcontent`,`comments`.`commenttime` AS `commenttime` from (`comments` join `users` on((`users`.`userid` = `comments`.`userid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-30  0:52:50
