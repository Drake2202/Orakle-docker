-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2016 at 12:47 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meh`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`CloudAccess`@`%` PROCEDURE `GET_ITEMS` (IN `p_userid` INT(10))  BEGIN
	SELECT * FROM meh_users_items WHERE userid=p_userid;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `meh_achievements`
--

CREATE TABLE `meh_achievements` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Description` text NOT NULL,
  `Badge` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meh_achievements`
--

INSERT INTO `meh_achievements` (`id`, `Name`, `Description`, `Badge`) VALUES
(1, 'Founder', 'Special Member in Legend of Valor! (Awarded to those who supported the server during beta)', 'founderb.jpg'),
(2, 'Elaroin Slain', 'Awarded to those whom were able to successfuly slay Elaroin and turn in his head!', 'ElaroinAchieve.png');

-- --------------------------------------------------------

--
-- Table structure for table `meh_classes`
--

CREATE TABLE `meh_classes` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `Name` varchar(60) CHARACTER SET latin1 NOT NULL,
  `Skills` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Passives` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '9801,9802',
  `Stats` varchar(100) CHARACTER SET latin1 NOT NULL,
  `ClassCat` char(2) CHARACTER SET latin1 NOT NULL DEFAULT 'M1',
  `Desc` text CHARACTER SET latin1 NOT NULL,
  `MRM` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `meh_classes`
--

INSERT INTO `meh_classes` (`id`, `Name`, `Skills`, `Passives`, `Stats`, `ClassCat`, `Desc`, `MRM`) VALUES
(1, 'Knight', '1,2,3,4,5,6', '1,2', 'Warriors favor Strength, Endurance, and Dexterity', 'M1', 'Knights are quintessential melee fighters.  Simple, direct, and effective, they are masters of armed combat, and quite durable.', 'Knights gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(2, 'Warlock', '1,7,8,9,10,6', '1,2', 'Mages favor Intellect and Wisdom', 'C1', 'Warlocks are the quintessential magic user. They attack from a distance, able to cause great harm or restrict a target''s actions.', 'Warlocks\n gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.'),
(3, 'Assassian', '1,11,12,13,14,6', '1,2', 'Rogues favor Dexterity and Strength', 'M2', 'Assassins are quick-moving, deadly fighters. They prey on any weakness in their opponent, while using poisons and evasive footwork to their advantage.', 'Assassins gain mana when they:,-Strike an enemy in combat (more effective on crits),-Dodge any attack (restores HP as well)'),
(4, 'Acolyte', '1,15,16,18,17,6', '1,2', 'Healers favor Intellect, Endurance, and Wisdom', 'C2', 'Healers are passionately devoted to improving the condition of the world around them. They are perhaps the most valuable allies, able to mend wounds and turn the tide of battle.', 'Healers regain mana through two of their abilities:,-When "Healing Word" is cast on a friendly target, any damage taken by that target returns mana to the Healer,-When "Energy Flow" is cast on a hostile target, any strike that lands on this target returns mana to the Healer'),
(5, 'Elemental Dracomancer', '1,26,24,27,25,6', '1,2', 'Dracomancers favor Intellect and Wisdom', 'C1', 'Dracomancers are the spirit kin of the dragons and Elemental Dracomancers are the spirit kin of the Elemental Prime Dragons. Their spiritual connection allows them to call upon the dragon''s magic powers at will.', 'Dracomancers gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.'),
(6, 'Alpha Omega', '1,28,29,30,31,6', '1,2', 'Alpha Omegans favor Strength, Endurance, and Dexterity.', 'M1', 'Become the Alpha AND the Omega! The beginning and the end of all your battles starts with... YOU!', 'Alpha Omegans gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(7, 'Blood Titan', '1,32,33,34,35,6', '1,2', 'Blood Titans favor Strength, Endurance, and Dexterity', 'M1', 'There is power in blood. Coming from a long line of titans, your blood is especially potent. You have mastered the ability of calling on the power running through your veins to bring devastation to your foes.', 'Blood Titans gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(8, 'Blood Ancient', '1,36,37,38,39,6', '1,2', 'BLOOD ANCIENT favor Strength, Endurance, and Dexterity', 'M1', 'You drank of the distilled essence of several great vampire warriors, and now their STRENGTH is yours to use.', 'BLOOD ANCIENT gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(9, 'Royal BattleMage', '1,40,41,42,43,6', '1,2', 'Battlemages favor Intellect and Wisdom to maximize his spells.', 'C3', 'The Battlemage focuses on taking down his opponents as quickly as possible. He is capable of focusing greater amounts of mana into each spell for the maximum effect. He specializes in wearing heavy armor for defense in order to spend all of his mana on offensive spells.', 'Battlemages are rejuvenated by their Arcane Strike granting them bonus mana with every successful blow.'),
(10, 'Darkblood StormKing', '1,44,45,46,47,6', '1,2', 'Stormkings favor Intellect and Wisdom', 'C1', 'You have been elevated above other Dreadwatch soldiers due to your skill in both melee combat and magical control of the elements. You blend both fighting styles together and use the never-ending storms of Thunderforge as your weapon.', 'Stormkings gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.'),
(11, 'Necromancer', '1,48,49,50,51,6', '1,2', 'Necromancers favor Intellect and Wisdom', 'C1', 'Necromancers are powerful, but twisted magic users who command undead minions. They gain power from death and decay.', 'Necromancers gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(12, 'Paladin', '1,52,53,54,108,6', '1,2', 'Paladins favor Strength, Intellect, and Endurance', 'M3', 'Paladins are noble, strictly honorable fighters, who defend the weak and destroy the wicked. They fight with exceptional physical strength and healing power.', 'Paladins gain mana when they:,-Strike an enemy in combat while Zeal is active,-Are struck by an enemy in combat while Zeal is active'),
(13, 'Dragonlord', '1,56,57,58,59,6', '1,2', 'Dragonlords favor Strength and Dexterity', 'M4', 'Dragonlords are aggressive front-line soldiers. They are skilled in an ancient school of enchanted combat arts.', 'Dragonlords gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.'),
(14, 'Beast Warrior', '1,60,61,62,63,6', '1,2', 'Warriors favor Strength, Endurance, and Dexterity', 'M1', 'Warriors are quintessential melee fighters.  Simple, direct, and effective, they are masters of armed combat, and quite durable.', 'Warriors gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(15, 'UndeadSlayer', '1,64,65,66,67,6', '1,2', 'Undead Slayers favor Strength, Endurance, and Dexterity', 'C1', 'Undead slayers absorb spirit orbs from undead enemies and use that spirit power to improve their ability to defeat undead enemies.', 'Undead Slayers gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(16, 'Chaos Shaper', '1,68,69,70,71,6', '1,2', 'Chaos Shapers favor Strength, Endurance and Dexterity', 'S1', 'Chaos Shapers use the power of chaos to fight battles. Due to the unpredictable nautre of chaos the exact effect of an attack is never known.', 'Chaos Shapers gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(17, 'DeathKnight', '1,72,73,74,75,6', '1,2', 'Death Knights favor Strength, Endurance, and Dexterity', 'M1', 'Have you have been pulled from the cold comfort of death to serve a new master or has your own will pulled you back to the land of the living to continue fighting?', 'Death Knights gain mana whenever an enemy takes damage from one of the Death Knight''s skills.'),
(18, 'Chunin', '1,76,77,78,79,6', '1,2', 'Chunin favor Strength, Endurance, and Dexterity', 'M1', 'A chunin is a ninja field commander. Highly trained to attack from stealth but focusing on strength and power rather than agility and speed. A chunin can handle multiple enemies at once.', 'Chunin gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(19, 'SkyGuard Grenadier', '1,80,81,82,83,6', '1,2', 'Grenadier''s favor strength and endurance.', 'M1', 'The Grenadiers are the toughest and most fearless soldiers that the Skyguard has to offer. They often lead assaults breaking through enemy lines with brute force and military weaponry.', 'Grenadier gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(20, 'Vindicator Of They ', '1,84,85,86,87,6', '1,2', 'Vindicator of They favors Strength, Intellect, and Endurance', 'M3', 'A Vindicator Of They is a powerful magical warrior using skills named after They Might Be Giants songs and lyrics. Best for solo battles.', 'Vindicator of They gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(21, 'Paladin High Lord', '1,88,89,90,91,6', '1,2', 'Paladin Highlords favor Strength, Intellect, and Endurance', 'M3', 'You are a champion of light and serve all good causes. You help the helpless and are a leader of the Paladin order! The Paladin High Lord is a Fighter type class, using its strength to slay undead foes and defeat evil at every turn.', 'Paladin Highlords gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(22, 'DoomKnight Overlord Class', '1,92,93,94,95,6', '1,2', 'Doomknight Overlords favor Strength, Intellect, and Endurance', 'M3', 'You are the enemy of light. You are the unliving embodiment of all things dark. The Doomknight Overlord is a Fighter type class who prizes strength.', 'Doomknight Overlord gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(23, 'Master Ranger', '1,96,97,98,99,6', '1,2', 'Rangers favor Dexterity and Strength', 'M2', 'Rangers are stealthy, wealthy and wise to the ways of their opponents. Able to take down tyrants without blinking an eye or breaking a bowstring, you?ll range far and wide in this armor, gaining gold and glory!', 'Rangers gain mana when they:,-Strike an enemy in combat (more effective on crits),-Dodge any attack (restores HP as well)'),
(24, 'Darkside', '1,100,101,102,103,6', '1,2', 'Darksiders favor Intellect and Wisdom', 'C1', 'You have embraced your own dark side. Fueled by rage, you magically focus your anger through your companion and battle as one!', 'Darksiders gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.'),
(25, 'Troll Spellsmith', '1,104,105,106,107,6', '1,2', 'Troll Spellsmiths favor Intellect and Wisdom', 'C1', 'The Trolls are masters of magics and logic and the SpellSmith has mastered these arts to give them a major advantage in battle.', 'Troll Spellsmiths gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.'),
(26, 'TimeKiller', '623,10010,4529,5947,2963,8050', '1,2', 'TimeKillers favor Strength, Intellect, and Endurance', 'M3', 'You are a rare breed of hunter who travels the breadth of space and time hunting your prey. Are you a bounty hunter? Do you hunt the most dangerous monsters in history? Do you track down history''s greatest treasures?', 'TimerKillers gain mana when they:,-Strike an enemy in combat (more effective on crits),-Dodge any attack (restores HP as well)'),
(27, 'Soul Cleaver', '4290,5931,5675,1343,6578,5474', '1,2', 'The Soul Cleaver mixes both physical and magical attacks to rip the soul from his victims.', 'M3', 'Vowing loyalty to the legion has it''s perks. The Soul Cleaver fights best on the brink of death where he can channel his magical abilities to shred his opponent... starting with it''s soul.', 'Soul Cleavers gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total. The lower your health the more you will get.'),
(28, 'Elemental Archmage', '6163,9494,5547,9707,1566,2345', '1,2', 'Dracomancers favor Intellect and Wisdom', 'C1', 'Dracomancers are the spirit kin of the dragons and Elemental Dracomancers are the spirit kin of the Elemental Prime Dragons. Their spiritual connection allows them to call upon the dragon''s magic powers at will.', 'Dracomancers gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.'),
(29, 'Paladin Slayer', '3722,1889,6543,5219,2960,6932', '1,2', 'Paladin Slayers favor Strength, Intellect, and Endurance', 'M3', 'Paladin Slayers are dark warriors trained to fight and destroy paladins. Their techniques are used to neutralize a paladin''s abilities and defeat them.', 'Paladin Slayers gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat'),
(30, 'Pirate', '1,110,111,112,113,6', '1,2', 'Rogues favor Dexterity and Strength', 'M2', 'Rogues are quick-moving, deadly fighters. They prey on any weakness in their opponent, while using poisons and evasive footwork to their advantage.', 'Rogues gain mana when they:,-Strike an enemy in combat (more effective on crits),-Dodge any attack (restores HP as well)'),
(31, 'Pyromancer', '1,114,115,116,117,6', '1,2', 'Pyromancers favor Intellect and Wisdom', 'C1', 'For as long as you can recall, you have been drawn to fire. The heat, the light, the destructive and life-giving properties, it called to you. Now you have mastered your control over the fire magic burning within you!', 'Pyromancers gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.'),
(32, 'Bard', '118,119,120,121,122,6', '1,2', 'Bards favor Intellect, Endurance, and Wisdom', 'C2', 'Bards are musicians who have a dramatic effect on the tide of battle.  They are valuable allies in a strong group.', 'Bards gain mana from all hits landed in combat, and especially on crits.  The amount depends on damage relative to *their own* HP total.');

-- --------------------------------------------------------

--
-- Table structure for table `meh_codes`
--

CREATE TABLE `meh_codes` (
  `id` int(11) NOT NULL,
  `Code` varchar(254) NOT NULL,
  `GoldReward` int(11) NOT NULL DEFAULT '0',
  `XPReward` int(11) NOT NULL DEFAULT '0',
  `CPReward` int(11) NOT NULL DEFAULT '0',
  `ValorReward` int(11) NOT NULL DEFAULT '0',
  `ItemRewards` varchar(254) NOT NULL DEFAULT '0:0:0',
  `AmountLeft` int(11) NOT NULL DEFAULT '0',
  `SingleUse` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meh_codes`
--

INSERT INTO `meh_codes` (`id`, `Code`, `GoldReward`, `XPReward`, `CPReward`, `ValorReward`, `ItemRewards`, `AmountLeft`, `SingleUse`) VALUES
(1, 'FreeGold', 1500, 0, 0, 0, '0:0:0', 0, 1),
(2, 'FreeXP', 0, 1500, 0, 0, '0:0:0', 0, 1),
(3, '3rdPeriod', 933, 933, 933, 93, '0:0:0', 10, 1),
(4, 'Sorryforresetacc', 15000, 15000, 15000, 120, '0:0:0', 97, 1);

-- --------------------------------------------------------

--
-- Table structure for table `meh_codes_redemeed`
--

CREATE TABLE `meh_codes_redemeed` (
  `id` int(11) NOT NULL,
  `Code` varchar(254) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meh_codes_redemeed`
--

INSERT INTO `meh_codes_redemeed` (`id`, `Code`, `UserID`) VALUES
(1, 'freexp', 391),
(201, 'sorryforresetacc', 9199),
(202, 'sorryforresetacc', 9209),
(203, 'sorryforresetacc', 9218);

-- --------------------------------------------------------

--
-- Table structure for table `meh_enhancements`
--

CREATE TABLE `meh_enhancements` (
  `id` int(4) UNSIGNED NOT NULL,
  `Name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `PatternID` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `Rty` smallint(4) NOT NULL DEFAULT '1',
  `Rng` smallint(4) NOT NULL DEFAULT '100',
  `DPS` smallint(6) NOT NULL DEFAULT '100',
  `Lvl` smallint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_enhancements`
--

INSERT INTO `meh_enhancements` (`id`, `Name`, `PatternID`, `Rty`, `Rng`, `DPS`, `Lvl`) VALUES
(1, 'Basic Enhancement', 1, 1, 10, 40, 1),
(2, 'Basic Enhancement', 1, 1, 10, 43, 2),
(3, 'Basic Enhancement', 1, 1, 10, 46, 3),
(4, 'Basic Enhancement', 1, 1, 10, 49, 4),
(5, 'Basic Enhancement', 1, 1, 10, 52, 5),
(6, 'Basic Enhancement', 1, 1, 10, 55, 6),
(7, 'Basic Enhancement', 1, 1, 10, 58, 7),
(8, 'Basic Enhancement', 1, 1, 10, 61, 8),
(9, 'Basic Enhancement', 1, 1, 10, 64, 9),
(10, 'Basic Enhancement', 1, 1, 10, 67, 10),
(11, 'Basic Enhancement', 1, 1, 10, 70, 11),
(12, 'Basic Enhancement', 1, 1, 10, 73, 12),
(13, 'Basic Enhancement', 1, 1, 10, 76, 13),
(14, 'Basic Enhancement', 1, 1, 10, 79, 14),
(15, 'Basic Enhancement', 1, 1, 10, 82, 15),
(16, 'Basic Enhancement', 1, 1, 10, 85, 16),
(17, 'Basic Enhancement', 1, 1, 10, 88, 17),
(18, 'Basic Enhancement', 1, 1, 10, 91, 18),
(19, 'Basic Enhancement', 1, 1, 10, 94, 19),
(20, 'Basic Enhancement', 1, 1, 10, 97, 20),
(21, 'Basic Enhancement', 1, 1, 10, 100, 21),
(22, 'Basic Enhancement', 1, 1, 10, 103, 22),
(23, 'Basic Enhancement', 1, 1, 10, 106, 23),
(24, 'Basic Enhancement', 1, 1, 10, 109, 24),
(25, 'Basic Enhancement', 1, 1, 10, 112, 25),
(26, 'Basic Enhancement', 1, 1, 10, 115, 26),
(27, 'Basic Enhancement', 1, 1, 10, 118, 27),
(28, 'Basic Enhancement', 1, 1, 10, 121, 28),
(29, 'Basic Enhancement', 1, 1, 10, 124, 29),
(30, 'Basic Enhancement', 1, 1, 10, 127, 30),
(31, 'Basic Enhancement', 1, 1, 10, 130, 31),
(32, 'Basic Enhancement', 1, 1, 10, 133, 32),
(33, 'Basic Enhancement', 1, 1, 10, 136, 33),
(34, 'Basic Enhancement', 1, 1, 10, 139, 34),
(35, 'Basic Enhancement', 1, 1, 10, 142, 35),
(36, 'Basic Enhancement', 1, 1, 10, 145, 36),
(37, 'Basic Enhancement', 1, 1, 10, 148, 37),
(38, 'Basic Enhancement', 1, 1, 10, 151, 38),
(39, 'Basic Enhancement', 1, 1, 10, 154, 39),
(40, 'Basic Enhancement', 1, 1, 10, 157, 40),
(41, 'Basic Enhancement', 1, 1, 10, 160, 41),
(42, 'Basic Enhancement', 1, 1, 10, 163, 42),
(43, 'Basic Enhancement', 1, 1, 10, 166, 43),
(44, 'Basic Enhancement', 1, 1, 10, 169, 44),
(45, 'Basic Enhancement', 1, 1, 10, 172, 45),
(46, 'Basic Enhancement', 1, 1, 10, 175, 46),
(47, 'Basic Enhancement', 1, 1, 10, 178, 47),
(48, 'Basic Enhancement', 1, 1, 10, 181, 48),
(49, 'Basic Enhancement', 1, 1, 10, 184, 49),
(50, 'Basic Enhancement', 1, 1, 10, 187, 50),
(51, 'Basic Enhancement', 1, 1, 10, 190, 51),
(52, 'Basic Enhancement', 1, 1, 10, 193, 52),
(53, 'Basic Enhancement', 1, 1, 10, 196, 53),
(54, 'Basic Enhancement', 1, 1, 10, 199, 54),
(55, 'Basic Enhancement', 1, 1, 10, 202, 55),
(56, 'Basic Enhancement', 1, 1, 10, 205, 56),
(57, 'Basic Enhancement', 1, 1, 10, 208, 57),
(58, 'Basic Enhancement', 1, 1, 10, 211, 58),
(59, 'Basic Enhancement', 1, 1, 10, 214, 59),
(60, 'Basic Enhancement', 1, 1, 10, 217, 60),
(61, 'Basic Enhancement', 1, 1, 10, 220, 61),
(62, 'Basic Enhancement', 1, 1, 10, 223, 62),
(63, 'Basic Enhancement', 1, 1, 10, 226, 63),
(64, 'Basic Enhancement', 1, 1, 10, 229, 64),
(65, 'Basic Enhancement', 1, 1, 10, 232, 65),
(66, 'Basic Enhancement', 1, 1, 10, 235, 66),
(67, 'Basic Enhancement', 1, 1, 10, 238, 67),
(68, 'Basic Enhancement', 1, 1, 10, 241, 68),
(69, 'Basic Enhancement', 1, 1, 10, 244, 69),
(70, 'Basic Enhancement', 1, 1, 10, 247, 70),
(71, 'Basic Enhancement', 1, 1, 10, 250, 71),
(72, 'Basic Enhancement', 1, 1, 10, 253, 72),
(73, 'Basic Enhancement', 1, 1, 10, 256, 73),
(74, 'Basic Enhancement', 1, 1, 10, 259, 74),
(75, 'Basic Enhancement', 1, 1, 10, 262, 75),
(76, 'Basic Enhancement', 1, 1, 10, 265, 76),
(77, 'Basic Enhancement', 1, 1, 10, 268, 77),
(78, 'Basic Enhancement', 1, 1, 10, 271, 78),
(79, 'Basic Enhancement', 1, 1, 10, 274, 79),
(80, 'Basic Enhancement', 1, 1, 10, 277, 80),
(81, 'Basic Enhancement', 1, 1, 10, 280, 81),
(82, 'Basic Enhancement', 1, 1, 10, 283, 82),
(83, 'Basic Enhancement', 1, 1, 10, 286, 83),
(84, 'Basic Enhancement', 1, 1, 10, 289, 84),
(85, 'Basic Enhancement', 1, 1, 10, 292, 85),
(86, 'Basic Enhancement', 1, 1, 10, 295, 86),
(87, 'Basic Enhancement', 1, 1, 10, 298, 87),
(88, 'Basic Enhancement', 1, 1, 10, 301, 88),
(89, 'Basic Enhancement', 1, 1, 10, 304, 89),
(90, 'Basic Enhancement', 1, 1, 10, 307, 90),
(91, 'Basic Enhancement', 1, 1, 10, 310, 91),
(92, 'Basic Enhancement', 1, 1, 10, 313, 92),
(93, 'Basic Enhancement', 1, 1, 10, 316, 93),
(94, 'Basic Enhancement', 1, 1, 10, 319, 94),
(95, 'Basic Enhancement', 1, 1, 10, 322, 95),
(96, 'Basic Enhancement', 1, 1, 10, 325, 96),
(97, 'Basic Enhancement', 1, 1, 10, 328, 97),
(98, 'Basic Enhancement', 1, 1, 10, 331, 98),
(99, 'Basic Enhancement', 1, 1, 10, 334, 99),
(100, 'Basic Enhancement', 1, 1, 10, 337, 100),
(101, 'Basic Enhancement', 1, 1, 10, 340, 101),
(102, 'Basic Enhancement', 1, 1, 10, 343, 102),
(103, 'Basic Enhancement', 1, 1, 10, 346, 103),
(104, 'Basic Enhancement', 1, 1, 10, 349, 104),
(105, 'Basic Enhancement', 1, 1, 10, 352, 105),
(106, 'Basic Enhancement', 1, 1, 10, 355, 106),
(107, 'Basic Enhancement', 1, 1, 10, 358, 107),
(108, 'Basic Enhancement', 1, 1, 10, 361, 108),
(109, 'Basic Enhancement', 1, 1, 10, 364, 109),
(110, 'Basic Enhancement', 1, 1, 10, 367, 110),
(111, 'Basic Enhancement', 1, 1, 10, 370, 111),
(112, 'Basic Enhancement', 1, 1, 10, 373, 112),
(113, 'Basic Enhancement', 1, 1, 10, 376, 113),
(114, 'Basic Enhancement', 1, 1, 10, 379, 114),
(115, 'Basic Enhancement', 1, 1, 10, 382, 115),
(116, 'Basic Enhancement', 1, 1, 10, 385, 116),
(117, 'Basic Enhancement', 1, 1, 10, 388, 117),
(118, 'Basic Enhancement', 1, 1, 10, 391, 118),
(119, 'Basic Enhancement', 1, 1, 10, 394, 119),
(120, 'Basic Enhancement', 1, 1, 10, 397, 120),
(121, 'Basic Enhancement', 1, 1, 10, 400, 121),
(122, 'Basic Enhancement', 1, 1, 10, 403, 122),
(123, 'Basic Enhancement', 1, 1, 10, 406, 123),
(124, 'Basic Enhancement', 1, 1, 10, 409, 124),
(125, 'Basic Enhancement', 1, 1, 10, 412, 125),
(126, 'Basic Enhancement', 1, 1, 10, 415, 126),
(127, 'Basic Enhancement', 1, 1, 10, 418, 127),
(128, 'Basic Enhancement', 1, 1, 10, 421, 128),
(129, 'Basic Enhancement', 1, 1, 10, 424, 129),
(130, 'Basic Enhancement', 1, 1, 10, 427, 130),
(131, 'Basic Enhancement', 1, 1, 10, 430, 131),
(132, 'Basic Enhancement', 1, 1, 10, 433, 132),
(133, 'Basic Enhancement', 1, 1, 10, 436, 133),
(134, 'Basic Enhancement', 1, 1, 10, 439, 134),
(135, 'Basic Enhancement', 1, 1, 10, 442, 135),
(136, 'Basic Enhancement', 1, 1, 10, 445, 136),
(137, 'Basic Enhancement', 1, 1, 10, 448, 137),
(138, 'Basic Enhancement', 1, 1, 10, 451, 138),
(139, 'Basic Enhancement', 1, 1, 10, 454, 139),
(140, 'Basic Enhancement', 1, 1, 10, 457, 140),
(141, 'Basic Enhancement', 1, 1, 10, 460, 141),
(142, 'Basic Enhancement', 1, 1, 10, 463, 142),
(143, 'Basic Enhancement', 1, 1, 10, 466, 143),
(144, 'Basic Enhancement', 1, 1, 10, 469, 144),
(145, 'Basic Enhancement', 1, 1, 10, 472, 145),
(146, 'Basic Enhancement', 1, 1, 10, 475, 146),
(147, 'Basic Enhancement', 1, 1, 10, 478, 147),
(148, 'Basic Enhancement', 1, 1, 10, 481, 148),
(149, 'Basic Enhancement', 1, 1, 10, 484, 149),
(150, 'Basic Enhancement', 1, 1, 10, 487, 150),
(151, 'Basic Enhancement', 1, 1, 10, 490, 151),
(152, 'Basic Enhancement', 1, 1, 10, 493, 152),
(153, 'Basic Enhancement', 1, 1, 10, 496, 153),
(154, 'Basic Enhancement', 1, 1, 10, 499, 154),
(155, 'Basic Enhancement', 1, 1, 10, 502, 155),
(156, 'Basic Enhancement', 1, 1, 10, 505, 156),
(157, 'Basic Enhancement', 1, 1, 10, 508, 157),
(158, 'Basic Enhancement', 1, 1, 10, 511, 158),
(159, 'Basic Enhancement', 1, 1, 10, 514, 159),
(160, 'Basic Enhancement', 1, 1, 10, 517, 160),
(161, 'Basic Enhancement', 1, 1, 10, 520, 161),
(162, 'Basic Enhancement', 1, 1, 10, 523, 162),
(163, 'Basic Enhancement', 1, 1, 10, 526, 163),
(164, 'Basic Enhancement', 1, 1, 10, 529, 164),
(165, 'Basic Enhancement', 1, 1, 10, 532, 165),
(166, 'Basic Enhancement', 1, 1, 10, 535, 166),
(167, 'Basic Enhancement', 1, 1, 10, 538, 167),
(168, 'Basic Enhancement', 1, 1, 10, 541, 168),
(169, 'Basic Enhancement', 1, 1, 10, 544, 169),
(170, 'Basic Enhancement', 1, 1, 10, 547, 170),
(171, 'Basic Enhancement', 1, 1, 10, 550, 171),
(172, 'Basic Enhancement', 1, 1, 10, 553, 172),
(173, 'Basic Enhancement', 1, 1, 10, 556, 173),
(174, 'Basic Enhancement', 1, 1, 10, 559, 174),
(175, 'Basic Enhancement', 1, 1, 10, 562, 175),
(176, 'Basic Enhancement', 1, 1, 10, 565, 176),
(177, 'Basic Enhancement', 1, 1, 10, 568, 177),
(178, 'Basic Enhancement', 1, 1, 10, 571, 178),
(179, 'Basic Enhancement', 1, 1, 10, 574, 179),
(180, 'Basic Enhancement', 1, 1, 10, 577, 180),
(181, 'Basic Enhancement', 1, 1, 10, 580, 181),
(182, 'Basic Enhancement', 1, 1, 10, 583, 182),
(183, 'Basic Enhancement', 1, 1, 10, 586, 183),
(184, 'Basic Enhancement', 1, 1, 10, 589, 184),
(185, 'Basic Enhancement', 1, 1, 10, 592, 185),
(186, 'Basic Enhancement', 1, 1, 10, 595, 186),
(187, 'Basic Enhancement', 1, 1, 10, 598, 187),
(188, 'Basic Enhancement', 1, 1, 10, 601, 188),
(189, 'Basic Enhancement', 1, 1, 10, 604, 189),
(190, 'Basic Enhancement', 1, 1, 10, 607, 190),
(191, 'Basic Enhancement', 1, 1, 10, 610, 191),
(192, 'Basic Enhancement', 1, 1, 10, 613, 192),
(193, 'Basic Enhancement', 1, 1, 10, 616, 193),
(194, 'Basic Enhancement', 1, 1, 10, 619, 194),
(195, 'Basic Enhancement', 1, 1, 10, 622, 195),
(196, 'Basic Enhancement', 1, 1, 10, 625, 196),
(197, 'Basic Enhancement', 1, 1, 10, 628, 197),
(198, 'Basic Enhancement', 1, 1, 10, 631, 198),
(199, 'Basic Enhancement', 1, 1, 10, 634, 199),
(200, 'Basic Enhancement', 1, 1, 10, 637, 200),
(201, 'Basic Enhancement', 1, 1, 10, 640, 201),
(202, 'Basic Enhancement', 1, 1, 10, 643, 202),
(203, 'Basic Enhancement', 1, 1, 10, 646, 203),
(204, 'Basic Enhancement', 1, 1, 10, 649, 204),
(205, 'Basic Enhancement', 1, 1, 10, 652, 205),
(206, 'Basic Enhancement', 1, 1, 10, 655, 206),
(207, 'Basic Enhancement', 1, 1, 10, 658, 207),
(208, 'Basic Enhancement', 1, 1, 10, 661, 208),
(209, 'Basic Enhancement', 1, 1, 10, 664, 209),
(210, 'Basic Enhancement', 1, 1, 10, 667, 210),
(211, 'Basic Enhancement', 1, 1, 10, 670, 211),
(212, 'Basic Enhancement', 1, 1, 10, 673, 212),
(213, 'Basic Enhancement', 1, 1, 10, 676, 213),
(214, 'Basic Enhancement', 1, 1, 10, 679, 214),
(215, 'Basic Enhancement', 1, 1, 10, 682, 215),
(216, 'Basic Enhancement', 1, 1, 10, 685, 216),
(217, 'Basic Enhancement', 1, 1, 10, 688, 217),
(218, 'Basic Enhancement', 1, 1, 10, 691, 218),
(219, 'Basic Enhancement', 1, 1, 10, 694, 219),
(220, 'Basic Enhancement', 1, 1, 10, 697, 220),
(221, 'Basic Enhancement', 1, 1, 10, 700, 221),
(222, 'Basic Enhancement', 1, 1, 10, 703, 222),
(223, 'Basic Enhancement', 1, 1, 10, 706, 223),
(224, 'Basic Enhancement', 1, 1, 10, 709, 224),
(225, 'Basic Enhancement', 1, 1, 10, 712, 225),
(226, 'Basic Enhancement', 1, 1, 10, 715, 226),
(227, 'Basic Enhancement', 1, 1, 10, 718, 227),
(228, 'Basic Enhancement', 1, 1, 10, 721, 228),
(229, 'Basic Enhancement', 1, 1, 10, 724, 229),
(230, 'Basic Enhancement', 1, 1, 10, 727, 230),
(231, 'Basic Enhancement', 1, 1, 10, 730, 231),
(232, 'Basic Enhancement', 1, 1, 10, 733, 232),
(233, 'Basic Enhancement', 1, 1, 10, 736, 233),
(234, 'Basic Enhancement', 1, 1, 10, 739, 234),
(235, 'Basic Enhancement', 1, 1, 10, 742, 235),
(236, 'Basic Enhancement', 1, 1, 10, 745, 236),
(237, 'Basic Enhancement', 1, 1, 10, 748, 237),
(238, 'Basic Enhancement', 1, 1, 10, 751, 238),
(239, 'Basic Enhancement', 1, 1, 10, 754, 239),
(240, 'Basic Enhancement', 1, 1, 10, 757, 240),
(241, 'Basic Enhancement', 1, 1, 10, 760, 241),
(242, 'Basic Enhancement', 1, 1, 10, 763, 242),
(243, 'Basic Enhancement', 1, 1, 10, 766, 243),
(244, 'Basic Enhancement', 1, 1, 10, 769, 244),
(245, 'Basic Enhancement', 1, 1, 10, 772, 245),
(246, 'Basic Enhancement', 1, 1, 10, 775, 246),
(247, 'Basic Enhancement', 1, 1, 10, 778, 247),
(248, 'Basic Enhancement', 1, 1, 10, 781, 248),
(249, 'Basic Enhancement', 1, 1, 10, 784, 249),
(250, 'Basic Enhancement', 1, 1, 10, 787, 250),
(251, 'Basic Enhancement', 1, 1, 10, 790, 251),
(252, 'Basic Enhancement', 1, 1, 10, 793, 252),
(253, 'Basic Enhancement', 1, 1, 10, 796, 253),
(254, 'Basic Enhancement', 1, 1, 10, 799, 254),
(255, 'Basic Enhancement', 1, 1, 10, 802, 255),
(256, 'Basic Enhancement', 1, 1, 10, 805, 256),
(257, 'Basic Enhancement', 1, 1, 10, 808, 257),
(258, 'Basic Enhancement', 1, 1, 10, 811, 258),
(259, 'Basic Enhancement', 1, 1, 10, 814, 259),
(260, 'Basic Enhancement', 1, 1, 10, 817, 260),
(261, 'Basic Enhancement', 1, 1, 10, 820, 261),
(262, 'Basic Enhancement', 1, 1, 10, 823, 262),
(263, 'Basic Enhancement', 1, 1, 10, 826, 263),
(264, 'Basic Enhancement', 1, 1, 10, 829, 264),
(265, 'Basic Enhancement', 1, 1, 10, 832, 265),
(266, 'Basic Enhancement', 1, 1, 10, 835, 266),
(267, 'Basic Enhancement', 1, 1, 10, 838, 267),
(268, 'Basic Enhancement', 1, 1, 10, 841, 268),
(269, 'Basic Enhancement', 1, 1, 10, 844, 269),
(270, 'Basic Enhancement', 1, 1, 10, 847, 270),
(271, 'Basic Enhancement', 1, 1, 10, 850, 271),
(272, 'Basic Enhancement', 1, 1, 10, 853, 272),
(273, 'Basic Enhancement', 1, 1, 10, 856, 273),
(274, 'Basic Enhancement', 1, 1, 10, 859, 274),
(275, 'Basic Enhancement', 1, 1, 10, 862, 275),
(276, 'Basic Enhancement', 1, 1, 10, 865, 276),
(277, 'Basic Enhancement', 1, 1, 10, 868, 277),
(278, 'Basic Enhancement', 1, 1, 10, 871, 278),
(279, 'Basic Enhancement', 1, 1, 10, 874, 279),
(280, 'Basic Enhancement', 1, 1, 10, 877, 280),
(281, 'Basic Enhancement', 1, 1, 10, 880, 281),
(282, 'Basic Enhancement', 1, 1, 10, 883, 282),
(283, 'Basic Enhancement', 1, 1, 10, 886, 283),
(284, 'Basic Enhancement', 1, 1, 10, 889, 284),
(285, 'Basic Enhancement', 1, 1, 10, 892, 285),
(286, 'Basic Enhancement', 1, 1, 10, 895, 286),
(287, 'Basic Enhancement', 1, 1, 10, 898, 287),
(288, 'Basic Enhancement', 1, 1, 10, 901, 288),
(289, 'Basic Enhancement', 1, 1, 10, 904, 289),
(290, 'Basic Enhancement', 1, 1, 10, 907, 290),
(291, 'Basic Enhancement', 1, 1, 10, 910, 291),
(292, 'Basic Enhancement', 1, 1, 10, 913, 292),
(293, 'Basic Enhancement', 1, 1, 10, 916, 293),
(294, 'Basic Enhancement', 1, 1, 10, 919, 294),
(295, 'Basic Enhancement', 1, 1, 10, 922, 295),
(296, 'Basic Enhancement', 1, 1, 10, 925, 296),
(297, 'Basic Enhancement', 1, 1, 10, 928, 297),
(298, 'Basic Enhancement', 1, 1, 10, 931, 298),
(299, 'Basic Enhancement', 1, 1, 10, 934, 299),
(300, 'Basic Enhancement', 1, 1, 10, 937, 300);

-- --------------------------------------------------------

--
-- Table structure for table `meh_enhance_info`
--

CREATE TABLE `meh_enhance_info` (
  `id` tinyint(2) UNSIGNED NOT NULL,
  `Name` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `Desc` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `WIS` smallint(10) UNSIGNED NOT NULL DEFAULT '0',
  `STR` smallint(10) UNSIGNED NOT NULL DEFAULT '0',
  `LCK` smallint(10) UNSIGNED NOT NULL DEFAULT '0',
  `DEX` smallint(10) UNSIGNED NOT NULL DEFAULT '0',
  `END` smallint(10) UNSIGNED NOT NULL DEFAULT '0',
  `INT` smallint(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_enhance_info`
--

INSERT INTO `meh_enhance_info` (`id`, `Name`, `Desc`, `WIS`, `STR`, `LCK`, `DEX`, `END`, `INT`) VALUES
(1, 'Adventurer', 'M1', 17, 14, 3, 16, 18, 15),
(2, 'Fighter', 'M1', 0, 44, 0, 13, 43, 0),
(3, 'Thief', 'M2', 0, 30, 0, 45, 25, 0),
(5, 'Hybrid', 'M3', 0, 28, 0, 20, 25, 27),
(6, 'Wizard', 'C1', 0, 0, 20, 0, 30, 50),
(7, 'Healer', 'C2', 15, 0, 0, 0, 40, 45),
(9, 'Lucky', 'S1', 0, 5, 70, 10, 15, 0),
(10, 'Awe', 'M1', 60, 60, 60, 60, 60, 60),
(11, 'Ungodly', 'S1', 130, 130, 130, 130, 130, 130),
(12, 'Infinite', 'C1', 900, 900, 900, 900, 900, 900);

-- --------------------------------------------------------

--
-- Table structure for table `meh_factions`
--

CREATE TABLE `meh_factions` (
  `id` mediumint(2) UNSIGNED NOT NULL,
  `Name` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_factions`
--

INSERT INTO `meh_factions` (`id`, `Name`) VALUES
(1, 'None'),
(2, 'Hero'),
(3, 'Neutral'),
(4, 'Blood Elf'),
(5, 'Black Smith'),
(6, 'Fairy'),
(7, 'Vampyre'),
(8, 'Yoshino'),
(9, 'Bounty Hunter'),
(10, 'Arcane'),
(11, 'Forsaken');

-- --------------------------------------------------------

--
-- Table structure for table `meh_hairs`
--

CREATE TABLE `meh_hairs` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `File` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Gender` char(1) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `meh_hairs`
--

INSERT INTO `meh_hairs` (`id`, `File`, `Name`, `Gender`) VALUES
(4, 'hair/M/bald.swf', 'Bald', 'M'),
(5, 'hair/F/bald.swf', 'Bald', 'F'),
(6, 'hair/F/Bangs1.swf', 'Bangs1', 'F'),
(7, 'hair/F/Bangs2.swf', 'Bangs2', 'F'),
(8, 'hair/F/Bangs3.swf', 'Bangs3', 'F'),
(9, 'hair/F/Braid2.swf', 'Braid2', 'F'),
(10, 'hair/F/Braid2Bangs1.swf', 'Braid2Bangs1', 'F'),
(11, 'hair/F/Braid3.swf', 'Braid3', 'F'),
(12, 'hair/F/Braid3Bangs1.swf', 'Braid3Bangs1', 'F'),
(13, 'hair/F/Braid3Bangs2.swf', 'Braid3Bangs2', 'F'),
(14, 'hair/F/Pig1Bangs1.swf', 'Pig1Bangs1', 'F'),
(15, 'hair/F/Pig1Bangs2.swf', 'Pig1Bangs2', 'F'),
(16, 'hair/F/Pig2.swf', 'Pig2', 'F'),
(17, 'hair/F/Pig2Bangs1.swf', 'Pig2Bangs1', 'F'),
(18, 'hair/F/Pig2Bangs2.swf', 'Pig2Bangs2', 'F'),
(19, 'hair/F/Pob.swf', 'Pob', 'F'),
(20, 'hair/F/Pony1Bangs1.swf', 'Pony1Bangs1', 'F'),
(21, 'hair/F/Pony1Bangs2.swf', 'Pony1Bangs2', 'F'),
(22, 'hair/F/Pony1Bangs2Long.swf', 'Pony1Bangs2Long', 'F'),
(23, 'hair/F/Pony1Long.swf', 'Pony1Long', 'F'),
(24, 'hair/F/Pony2.swf', 'Pony2', 'F'),
(25, 'hair/F/Pony2Bangs1.swf', 'Pony2Bangs1', 'F'),
(26, 'hair/F/Pony2Bangs2.swf', 'Pony2Bangs2', 'F'),
(27, 'hair/F/Pony3.swf', 'Pony3', 'F'),
(28, 'hair/F/Pony3Bangs1.swf', 'Pony3Bangs1', 'F'),
(29, 'hair/F/Pony3Bangs2.swf', 'Pony3Bangs2', 'F'),
(30, 'hair/F/Pony4.swf', 'Pony4', 'F'),
(31, 'hair/F/Pony4Bangs1.swf', 'Pony4Bangs1', 'F'),
(32, 'hair/F/Pony4Bangs2.swf', 'Pony4Bangs2', 'F'),
(34, 'hair/F/Pony5.swf', 'Pony5', 'F'),
(35, 'hair/F/Pony5Bangs2.swf', 'Pony5Bangs2', 'F'),
(36, 'hair/F/Spike1.swf', 'Spike1', 'F'),
(37, 'hair/F/Spike2.swf', 'Spike2', 'F'),
(38, 'hair/M/BaldBeard.swf', 'BaldBeard', 'M'),
(39, 'hair/M/BaldStache.swf', 'BaldStache', 'M'),
(40, 'hair/M/Bangs22.swf', 'Bangs22', 'M'),
(41, 'hair/M/Bangs22Beard.swf', 'Bangs22Beard', 'M'),
(42, 'hair/M/Bangs22Stache.swf', 'Bangs22Stache', 'M'),
(43, 'hair/M/Bob.swf', 'Bob', 'M'),
(44, 'hair/M/BobBeard.swf', 'BobBeard', 'M'),
(45, 'hair/M/BobStache.swf', 'BobStache', 'M'),
(46, 'hair/M/Braid1.swf', 'Braid1', 'M'),
(47, 'hair/M/Braid1Beard.swf', 'Braid1Beard', 'M'),
(48, 'hair/M/Braid1Stache.swf', 'Braid1Stache', 'M'),
(49, 'hair/M/Curl.swf', 'Curl', 'M'),
(50, 'hair/M/CurlBeard.swf', 'CurlBeard', 'M'),
(51, 'hair/M/CurlStache.swf', 'CurlStache', 'M'),
(52, 'hair/M/Default.swf', 'Default', 'M'),
(53, 'hair/M/DefaultBeard.swf', 'DefaultBeard', 'M'),
(54, 'hair/M/DefaultStache.swf', 'DefaultStache', 'M'),
(55, 'hair/M/Goku1.swf', 'Goku1', 'M'),
(56, 'hair/M/Goku1Beard.swf', 'Goku1Beard', 'M'),
(57, 'hair/M/Goku1Stache.swf', 'Goku1Stache', 'M'),
(58, 'hair/M/Goku2.swf', 'Goku2', 'M'),
(59, 'hair/M/Goku2Beard.swf', 'Goku2Beard', 'M'),
(60, 'hair/M/Goku2Stache.swf', 'Goku2Stache', 'M'),
(61, 'hair/M/Normal.swf', 'Normal', 'M'),
(62, 'hair/M/NormalBeard.swf', 'NormalBeard', 'M'),
(63, 'hair/M/NormalStache.swf', 'NormalStache', 'M'),
(64, 'hair/M/Normal2.swf', 'Normal2', 'M'),
(65, 'hair/M/Normal2Beard.swf', 'Normal2Beard', 'M'),
(66, 'hair/M/Normal2Stache.swf', 'Normal2Stache', 'M'),
(67, 'hair/M/Pompadour.swf', 'Pompadour', 'M'),
(68, 'hair/M/PompadourBeard.swf', 'PompadourBeard', 'M'),
(69, 'hair/M/PompadourStache.swf', 'PompadourStache', 'M'),
(70, 'hair/M/Spikedown.swf', 'Spikedown', 'M'),
(71, 'hair/M/SpikedownBeard.swf', 'SpikedownBeard', 'M'),
(72, 'hair/M/SpikedownStache.swf', 'SpikedownStache', 'M'),
(73, 'hair/M/Tonsure.swf', 'Tonsure', 'M'),
(74, 'hair/M/TonsureBeard.swf', 'TonsureBeard', 'M'),
(75, 'hair/M/TonsureStache.swf', 'TonsureStache', 'M'),
(76, 'hair/M/Wavy.swf', 'Wavy', 'M'),
(77, 'hair/M/WavyBeard.swf', 'WavyBeard', 'M'),
(78, 'hair/M/WavyStache.swf', 'WavyStache', 'M'),
(79, 'hair/M/Zhoom.swf', 'Zhoom', 'M'),
(80, 'hair/M/ZhoomBeard.swf', 'ZhoomBeard', 'M'),
(81, 'hair/M/ZhoomStache.swf', 'ZhoomStache', 'M'),
(82, 'hair/F/Bangs1Long.swf', 'Bangs1Long', 'F'),
(83, 'hair/F/Bangs2Long.swf', 'Bangs2Long', 'F'),
(84, 'hair/F/Bangs3Long.swf', 'Bangs3Long', 'F'),
(92, 'hair/M/Ponytail8.swf', 'Ponytail8', 'M'),
(93, 'hair/M/Ponytail7.swf', 'Ponytail7', 'M'),
(94, 'hair/M/Ponytail6.swf', 'Ponytail6', 'M'),
(95, 'hair/M/Ponytail5.swf', 'Ponytail5', 'M'),
(96, 'hair/M/Ponytail4.swf', 'Ponytail4', 'M'),
(98, 'hair/M/EmoxHipHop1.swf', 'EmoxHipHop1', 'M'),
(101, 'hair/M/Slickback1.swf', 'Slickback1', 'M'),
(102, 'hair/M/Mohawk1.swf', 'Mohawk1', 'M'),
(103, 'hair/M/Mohawk2.swf', 'Mohawk2', 'M'),
(104, 'hair/M/Mohawk3.swf', 'Mohawk3', 'M'),
(105, 'hair/M/Conan1.swf', 'Conan1', 'M'),
(106, 'hair/M/Ponytail3.swf', 'Ponytail3', 'M'),
(107, 'hair/M/Conan2.swf', 'Conan2', 'M'),
(108, 'hair/M/Conan3.swf', 'Conan3', 'M'),
(109, 'hair/M/Ponytail.swf', 'Ponytail', 'M'),
(110, 'hair/M/Slickback2.swf', 'Slickback2', 'M'),
(111, 'hair/M/Feathered1.swf', 'Feathered1', 'M'),
(112, 'hair/M/Feathered2.swf', 'Feathered2', 'M'),
(114, 'hair/M/Halo1.swf', 'Halo1', 'M'),
(115, 'hair/F/Ponytail1.swf', 'Ponytail1', 'F'),
(117, 'hair/F/Halo1.swf', 'Halo1', 'F'),
(118, 'hair/F/Halo2.swf', 'Halo2', 'F'),
(120, 'hair/F/Halo3.swf', 'Halo3', 'F'),
(121, 'hair/F/Ponytail2.swf', 'Ponytail2', 'F'),
(122, 'hair/F/Ponytail3.swf', 'Ponytail3', 'F'),
(123, 'hair/F/Ponytail4.swf', 'Ponytail4', 'F'),
(124, 'hair/F/Braid1.swf', 'Braid1', 'F'),
(125, 'hair/F/Ponytail5.swf', 'Ponytail5', 'F'),
(126, 'hair/F/Ponytail6.swf', 'Ponytail6', 'F'),
(127, 'hair/F/Ponytail7.swf', 'Ponytail7', 'F'),
(128, 'hair/M/Fro1.swf', 'Fro1', 'M'),
(129, 'hair/F/Fro1.swf', 'Fro1', 'F'),
(130, 'hair/F/Fro2.swf', 'Fro2', 'F'),
(131, 'hair/M/Fro2.swf', 'Fro2', 'M'),
(139, 'hair/M/Mohawk4.swf', 'Mohawk4', 'M'),
(192, 'hair/M/Glowingeyes1.swf', 'Glowingeyes1', 'M'),
(193, 'hair/F/Glowingeyes1.swf', 'Glowingeyes1', 'F'),
(194, 'hair/M/Glowingeyes2.swf', 'Glowingeyes2', 'M'),
(195, 'hair/M/Miltonius.swf', 'Miltonius', 'M'),
(201, 'hair/M/Ponytail9.swf', 'Ponytail9', 'M'),
(206, 'hair/F/cat1.swf', 'cat1', 'F'),
(210, 'hair/F/Glowingeyes2.swf', 'Glowingeyes2', 'F'),
(211, 'hair/F/Curls.swf', 'Curls', 'F'),
(212, 'hair/F/Bang22.swf', 'Bang22', 'F'),
(221, 'hair/M/Beard2.swf', 'Beard1', 'M'),
(222, 'hair/M/Beard2.swf', 'Beard2', 'M'),
(223, 'hair/M/Beard3.swf', 'Beard3', 'M'),
(232, 'hair/F/formal.swf', 'Formal', 'F'),
(233, 'hair/M/Widowspeak1.swf', 'Widowspeak1', 'M'),
(234, 'hair/F/saf1.swf', 'Saf1', 'F'),
(235, 'hair/F/betty1.swf', 'Betty1', 'F'),
(236, 'hair/F/saf2.swf', 'Saf2', 'F'),
(237, 'hair/M/Wildbeard2.swf', 'Wildbeard2', 'M'),
(238, 'hair/M/Wildbeard2.swf', 'Wildbeard2', 'M'),
(239, 'hair/F/Long1.swf', 'Long1', 'F'),
(240, 'hair/M/Long1.swf', 'Long1', 'M'),
(241, 'hair/F/Braided3.swf', 'Braided3', 'F'),
(242, 'hair/F/Braided2.swf', 'Braided2', 'F'),
(243, 'hair/F/Braided1.swf', 'Braided1', 'F'),
(244, 'hair/M/Braided1.swf', 'Braided1', 'M'),
(245, 'hair/M/Rennhair1.swf', 'Rennhair1', 'M'),
(246, 'hair/F/Rennhair1.swf', 'Rennhair1', 'F'),
(247, 'hair/M/Ziohair1.swf', 'Ziohair1', 'M'),
(248, 'hair/F/Ziohair1.swf', 'Ziohair1', 'F'),
(249, 'hair/F/Cute1.swf', 'Cute1', 'F'),
(250, 'hair/M/DageScene.swf', 'DageScene', 'M'),
(275, 'hair/M/FauxHawk3.swf', 'FauxHawk3', 'M'),
(277, 'hair/F/Dragonhawk.swf', 'Dragonhawk', 'F'),
(284, 'hair/M/SandBoy.swf', 'SandBoy', 'M'),
(285, 'hair/F/SandHairGirl.swf', 'SandHairGirl', 'F'),
(324, 'hair/M/Troll3Human.swf', 'Troll3Human', 'M'),
(328, 'hair/F/TrollFem1HumanFix.swf', 'TrollFem1HumanFix', 'F'),
(330, 'hair/F/TrollFem3Human.swf', 'TrollFem3Human', 'F'),
(349, 'hair/M/SuggestedHair.swf', 'SuggestedHair', 'M'),
(375, 'hair/F/AQCasual.swf', 'AQCasual', 'F'),
(379, 'hair/F/MQGalaxyBuns.swf', 'MQGalaxyBuns', 'F'),
(380, 'hair/F/MQRibbon.swf', 'MQRibbon', 'F'),
(383, 'hair/M/AQDemonHunter1.swf', 'AQDemonHunter1', 'M'),
(390, 'hair/M/DFWarStyle.swf', 'DFWarStyle', 'M'),
(396, 'hair/M/MQElegant.swf', 'MQElegant', 'M'),
(398, 'hair/M/MQSwift.swf', 'MQSwift', 'M'),
(399, 'hair/M/DarkbloodPony.swf', 'DarkbloodPony', 'M'),
(400, 'hair/M/DarkbloodRam2.swf', 'DarkbloodRam2', 'M'),
(401, 'hair/M/DarkbloodSleek.swf', 'DarkbloodSleek', 'M'),
(402, 'hair/M/DarkbloodRam.swf', 'DarkbloodRam', 'M'),
(403, 'hair/M/DarkbloodWispy.swf', 'DarkbloodWispy', 'M'),
(404, 'hair/M/DarkbloodTwist.swf', 'DarkbloodTwist', 'M'),
(405, 'hair/M/DarkbloodLong.swf', 'DarkbloodLong', 'M'),
(406, 'hair/M/DarkbloodMessy.swf', 'DarkbloodMessy', 'M'),
(407, 'hair/M/Spikes1.swf', 'Spikes1', 'M'),
(408, 'hair/M/Thorns.swf', 'Thorns', 'M'),
(409, 'hair/M/Battlefield.swf', 'Battlefield', 'M'),
(410, 'hair/M/Rockhawk.swf', 'Rockhawk', 'M'),
(411, 'hair/M/Crew.swf', 'Crew', 'M'),
(412, 'hair/M/Funsies.swf', 'Funsies', 'M'),
(413, 'hair/M/Skunking.swf', 'Skunking', 'M'),
(414, 'hair/M/ElvenBangs.swf', 'ElvenBangs', 'M'),
(415, 'hair/M/Soulpatch.swf', 'Soulpatch', 'M'),
(416, 'hair/M/ElvenHang.swf', 'ElvenHang', 'M'),
(417, 'hair/M/ElvenLocks.swf', 'ElvenLocks', 'M'),
(418, 'hair/M/ShortSwoop.swf', 'ShortSwoop', 'M'),
(419, 'hair/M/SwoopTails.swf', 'SwoopTails', 'M'),
(420, 'hair/M/LittleSpikes.swf', 'LittleSpikes', 'M'),
(421, 'hair/M/PowerShortcut.swf', 'PowerShortcut', 'M'),
(422, 'hair/M/NecroMohawk.swf', 'NecroMohawk', 'M'),
(423, 'hair/F/EmoHair1.swf', 'EmoHair1', 'F'),
(424, 'hair/F/MythsongJett.swf', 'MythsongJett', 'F'),
(425, 'hair/F/Rapper1.swf', 'Rapper1', 'F'),
(426, 'hair/F/Rapper2.swf', 'Rapper2', 'F'),
(427, 'hair/F/DarkbloodPony.swf', 'DarkbloodPony', 'F'),
(428, 'hair/F/DarkbloodRam2.swf', 'DarkbloodRam2', 'F'),
(429, 'hair/F/DarkbloodSleek.swf', 'DarkbloodSleek', 'F'),
(430, 'hair/F/DarkbloodRam.swf', 'DarkbloodRam', 'F'),
(431, 'hair/F/DarkbloodWispy.swf', 'DarkbloodWispy', 'F'),
(432, 'hair/F/DarkbloodTwist.swf', 'DarkbloodTwist', 'F'),
(433, 'hair/F/DarkbloodLong.swf', 'DarkbloodLong', 'F'),
(434, 'hair/F/DarkbloodMessy.swf', 'DarkbloodMessy', 'F'),
(435, 'hair/F/Spikes1.swf', 'Spikes1', 'F'),
(436, 'hair/F/Thorns.swf', 'Thorns', 'F'),
(437, 'hair/F/Rockhawk.swf', 'Rockhawk', 'F'),
(438, 'hair/F/Battlefield.swf', 'Battlefield', 'F'),
(439, 'hair/F/Crew.swf', 'Crew', 'F'),
(440, 'hair/F/Funsies.swf', 'Funsies', 'F'),
(441, 'hair/F/Skunking.swf', 'Skunking', 'F'),
(442, 'hair/F/ElvenBangs.swf', 'ElvenBangs', 'F'),
(443, 'hair/F/Soulpatch.swf', 'Soulpatch', 'F'),
(444, 'hair/F/ElvenHang.swf', 'ElvenHang', 'F'),
(445, 'hair/F/ElvenLocks.swf', 'ElvenLocks', 'F'),
(446, 'hair/F/ShortSwoop.swf', 'ShortSwoop', 'F'),
(447, 'hair/F/SwoopTails.swf', 'SwoopTails', 'F'),
(448, 'hair/F/LittleSpikes.swf', 'LittleSpikes', 'F'),
(449, 'hair/F/PowerShortcut.swf', 'PowerShortcut', 'F'),
(450, 'hair/F/NecroMohawk.swf', 'NecroMohawk', 'F'),
(451, 'hair/M/DarkbloodPony2.swf', 'DarkbloodPony2', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `meh_hairshop`
--

CREATE TABLE `meh_hairshop` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `M` text NOT NULL,
  `F` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `meh_hairshop`
--

INSERT INTO `meh_hairshop` (`id`, `M`, `F`) VALUES
(1, '78,110,111,112,114,128,131,139,192,194,195,201,221,222,223,233,237,109,79,80,81,92,93,94,95,96,101,102,103,104,105,106,107,238,240,422,405,406,408,410,411,413,415,420,404,403,244,245,247,250,284,324,349,383,390,396,399,400,401,402,38,50,52,53,54,48,55,56,57,49,47,46,39,41,42,43,51,40,44,45,58,59,60,73,66,67,75,68,69,74,4,70,71,72,65,76,64,77,61,62,63,451', '5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,34,35,36,37,82,83,84,115,117,118,120,121,122,123,124,125,126,127,129,130,193,206,210,211,212,232,234,235,236,239,241,242,243,246,248,249,277,285,328,330,375,379,380,427,428,429,430,431,432,433,434,436,437,438,440,441,442,444,445,446,447,449,450'),
(2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `meh_items`
--

CREATE TABLE `meh_items` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `Coins` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Diamonds` int(11) NOT NULL,
  `Staff` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `House` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Temp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Upg` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ClassID` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `EnhID` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `FactionID` mediumint(2) UNSIGNED NOT NULL DEFAULT '1',
  `Cost` mediumint(10) UNSIGNED NOT NULL DEFAULT '0',
  `DPS` smallint(3) UNSIGNED NOT NULL DEFAULT '100',
  `Lvl` smallint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Qty` smallint(3) UNSIGNED NOT NULL DEFAULT '1',
  `QtyRemain` mediumint(10) UNSIGNED NOT NULL DEFAULT '0',
  `ReqClass` mediumint(10) NOT NULL DEFAULT '-1',
  `ReqCP` mediumint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ReqRep` mediumint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ReqItems` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `ReqFItems` varchar(245) NOT NULL,
  `Rty` smallint(3) UNSIGNED NOT NULL DEFAULT '10',
  `Stk` smallint(4) UNSIGNED NOT NULL DEFAULT '1',
  `Desc` text CHARACTER SET latin1 NOT NULL,
  `Elmt` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT 'None',
  `ES` char(6) CHARACTER SET latin1 NOT NULL DEFAULT 'None',
  `Type` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `File` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `Icon` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `Link` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `Name` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `SkillID` int(5) NOT NULL DEFAULT '0',
  `PTR` smallint(1) NOT NULL DEFAULT '0',
  `ProcID` smallint(4) NOT NULL DEFAULT '-1',
  `ReqQuests` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `QSindex` smallint(4) NOT NULL DEFAULT '-1',
  `Meta` varchar(50) NOT NULL DEFAULT 'undefined',
  `QSvalue` smallint(4) NOT NULL DEFAULT '0',
  `Rng` smallint(2) UNSIGNED NOT NULL DEFAULT '100',
  `EnhPatternID` int(11) NOT NULL DEFAULT '1',
  `Class` int(11) NOT NULL DEFAULT '0',
  `Faction` int(11) NOT NULL DEFAULT '0',
  `bForgeRecipe` int(11) NOT NULL DEFAULT '0',
  `ForgeProduct` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_items`
--

INSERT INTO `meh_items` (`id`, `Coins`, `Diamonds`, `Staff`, `House`, `Temp`, `Upg`, `ClassID`, `EnhID`, `FactionID`, `Cost`, `DPS`, `Lvl`, `Qty`, `QtyRemain`, `ReqClass`, `ReqCP`, `ReqRep`, `ReqItems`, `ReqFItems`, `Rty`, `Stk`, `Desc`, `Elmt`, `ES`, `Type`, `File`, `Icon`, `Link`, `Name`, `SkillID`, `PTR`, `ProcID`, `ReqQuests`, `QSindex`, `Meta`, `QSvalue`, `Rng`, `EnhPatternID`, `Class`, `Faction`, `bForgeRecipe`, `ForgeProduct`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'co', 'Armor', 'AxelTroll.swf', 'iwarmor', 'AxelTroll', 'Axel Trollus', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 500, 30, 1, 1, 0, 0, 0, 0, '', '', 10, 1, 'The heart of a warrior is filled with courage and strength. Your skills with weapons in close combat makes you a powerful force on the battlefield.', 'None', 'ar', 'Class', 'AJArmor3.swf', 'iibook', 'AJArmor3', 'Knight', 0, 0, 0, '', 0, '0', 0, 50, 2, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0, 0, 2, 1, 0, 500, 20, 1, 1, 0, 0, 0, 0, '', '', 10, 1, 'Magic courses through your veins. Your arcane powers enable you to cast powerful spells', 'None', 'ar', 'Class', 'BakaMage.swf', 'iibook', 'DarkCaster2014', 'Warlock', 0, 0, 0, '', 0, '0', 0, 42, 6, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 0, 3, 1, 0, 500, 20, 1, 1, 0, 0, 0, 0, '', '', 10, 1, 'Rogues follow their own set of rules. With a combination of speed, cunning and poisons you take your enemies by surprise.', 'None', 'ar', 'Class', 'BakaRogue.swf', 'iibook', 'LegionArcher2', 'Assassin', 0, 0, 0, '', 0, '0', 0, 32, 3, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 0, 0, 4, 1, 0, 500, 15, 1, 1, 0, 0, 0, 0, '', '', 10, 1, 'Healers are servants of good who use their powers to aid the sick, weak, and injured. Their powerful healing magic is often the difference between a groups victory or doom.', 'None', 'ar', 'Class', 'ArcaneHunter.swf', 'iibook', 'ArcaneHunter', 'Acolyte', 0, 0, 0, '', 0, '0', 0, 31, 2, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 0, 0, 1, 0, 100, 35, 1, 1, 0, 0, 0, 0, '', '', 10, 1, 'The most basic sword you will ever find.', 'None', 'Weapon', 'Sword', 'items/swords/sword01.swf ', 'iwsword', '', 'First Sword', 0, 0, 0, '', 0, '0', 0, 25, 2, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 0, 1, 0, 80, 25, 1, 1, 0, 0, 0, 0, '', '', 10, 1, 'These daggers are battered and worn. ', 'None', 'Weapon', 'Dagger', 'items/daggers/dagger01.swf ', 'iwdagger', '', 'First Daggers', 0, 0, 0, '', 0, '0', 0, 20, 3, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 0, 0, 1, 0, 75, 19, 1, 1, 0, 0, 0, 0, '', '', 10, 1, 'This isn''t even a staff. It''s a stick!', 'None', 'Weapon', 'Staff', 'items/staves/staff01.swf ', 'iwstaff', '', 'First Staff', 0, 0, 0, '', 0, '0', 0, 21, 6, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 1, 0, 0, 3, 0, 0, 100, 3, 1, 0, 0, 0, 0, '', '', 10, 2, 'Slime Ball... That''s disturbing.', 'None', 'None', 'Quest Item', '', 'iibag', '', 'Slime ball', 0, 0, 0, '1', 0, '0', 0, 100, 2, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 0, 0, 0, 7, 0, 5427, 40, 7, 1, 0, 0, 0, 0, '', '', 120, 1, 'Emoxus forged this blade out of dark gems, and the bones of his fallen enemies', 'None', 'Weapon', 'Sword', 'items/swords/OrnateBoneBlad.swf', 'iwsword', 'OrnateBoneBlade1Valty', 'Ornate Bone Blade', 0, 0, 0, '', 0, '0', 0, 48, 2, 0, 0, 0, 0),
(11, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '*The bag wiggles wildly*', 'None', 'None', 'Quest Item', '', '', '', 'Boss Captured', 0, 0, -1, '2', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(12, 1, 0, 0, 0, 0, 0, 0, 1, 0, 600, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Grim, grimy, and graven... this Undead Paladinslayer is out to slay ALL who have wronged them.', 'None', 'co', 'Armor', 'UndeadPaladinslayer.swf', 'iwarmor', 'UndeadPaladinslayer', 'Undead Paladinslayer', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2500, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Don''t let the simple design fool you, what it lacks in detail it makes up for in power.', 'None', 'ba', 'Cape', 'items/capes/ArcaneHunterCape.swf', 'iicape', 'ArcaneHunterCape', 'Acolyte Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(14, 1, 0, 0, 0, 0, 0, 0, 1, 0, 100, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Grim, grimy, and graven... this Undead Paladinslayer is out to slay ALL who have wronged them.', 'None', 'ba', 'Cape', 'items/capes/UndeadPaladinslayerCape.swf', 'iicape', 'UndeadPaladinslayerCape', 'Paladinslayer''s Rotted Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 0, 0, 0, 1, 0, 100000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'The gold for this was mined from Dwarfhold so it is of the highest quailty.', 'Nature', 'Weapon', 'Dagger', 'items/swords/GoldenKatana.swf', 'iwdagger', 'GoldenKatana', 'Dual Unstable Katanas +5', 0, 0, -1, '', -1, 'undefined', 0, 25, 1, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2265, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Relic''s are so important to Acolytes''s they have been fashioned into masks.', 'None', 'he', 'Helm', 'items/helms/ArcaneVestigeFem.swf', 'iihelm', 'ArcaneVestigeFem', 'Acolytess Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2265, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Relic''s are so important to Acolytes''s they have been fashioned into masks.', 'None', 'he', 'Helm', 'items/helms/ArcaneMaskFem.swf', 'iihelm', 'ArcaneMaskFem', 'Acolytess Mask', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2265, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Relic''s are so important to Acolyte''s they have been fashioned into masks.', 'None', 'he', 'Helm', 'items/helms/ArcaneMaskGuy.swf', 'iihelm', 'ArcaneMaskGuy', 'Acolyte Mask', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2265, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Relic''s are so important to Acolytes''s they have been fashioned into masks.  However, some like to keep them hidden from sight.', 'None', 'he', 'Helm', 'items/helms/ArcaneVestigeGuy.swf', 'iihelm', 'ArcaneVestigeGuy', 'Acolyte Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(20, 1, 0, 0, 0, 0, 0, 0, 1, 0, 100, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Grim, grimy, and graven... this Undead Paladinslayer is out to slay ALL who have wronged them.', 'None', 'he', 'Helm', 'items/helms/UndeadPaladinslayerHelm.swf', 'iihelm', 'UndeadPaladinslayerHelm', 'Horned Paladinslayer Helmet', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 0, 0, 0, 25, 0, 15000, 100, 25, 1, 0, -1, 0, 0, '', '', 10, 1, 'Grim, grimy, and graven... this Undead Paladinslayer is out to slay ALL who have wronged them.', 'None', 'he', 'Helm', 'items/helms/UndeadPaladinslayerHelm.swf', 'iihelm', 'UndeadPaladinslayerHelm', 'Horned Paladinslayer Helmet', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 0, 0, 0, 1, 0, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'All that glitters may be gold and having this beauty definitely adds to your bling stats.', 'None', 'Weapon', 'Polearm', 'items/polearms/AbraxosScythe.swf', 'iwpolearm', 'AbraxosScythe', 'Gilded Dread Scythe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(23, 1, 0, 0, 0, 0, 0, 0, 1, 0, 100, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Since Acolytes use both strength and intelligence, you should always have an elegant weapon at your side.', 'Light', 'Weapon', 'Sword', 'items/swords/ArcaneSword2-12.swf', 'iwsword', 'ArcaneSword2', 'Greater Acolyte Blade', 0, 0, -1, '', -1, 'undefined', 0, 20, 1, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Since Acolytes use both strength and intelligence, you should always have an elegant weapon at your side.', 'Light', 'Weapon', 'Sword', 'items/swords/ArcaneSword12.swf', 'iwsword', 'ArcaneSword', 'Acolyte Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(25, 1, 0, 0, 0, 0, 0, 0, 1, 0, 350, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Grim, grimy, and graven... this Undead Paladinslayer is out to slay ALL who have wronged them.', 'None', 'Weapon', 'Sword', 'items/swords/UndeadPaladinslayerSword.swf', 'iwsword', 'UndeadPaladinslayerSword', 'Ancient PaladinSlayer Claymore', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 0, 0, 0, 5, 0, 15000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'This sword has a powerful flame for it''s blade! Melt through metal with this mighty weapon.', 'Fire', 'Weapon', 'Sword', 'items/swords/RagingFireR.swf', 'iwsword', 'RagingFire', 'Raging Fire', 0, 0, -1, '', -1, 'undefined', 0, 100, 5, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 0, 0, 0, 5, 0, 7500, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'A blade capable of slicing through stone and rock. It''s power knows no bounds.', 'Nature', 'Weapon', 'Sword', 'items/swords/StoneCutter.swf', 'iwsword', 'StoneCutter', 'Stone Cutter', 0, 0, -1, '', -1, 'undefined', 0, 100, 5, 0, 0, 0, 0),
(28, 0, 0, 0, 0, 0, 0, 0, 10, 0, 17500, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'One of the mighty Elemental Katanas. Rolling thunder and fierce lightning courses through this sword.', 'Lightening', 'Weapon', 'Sword', 'items/swords/EnergyKatanaR.swf', 'iwsword', 'EnergyKatana', 'Energy Katana', 0, 0, -1, '', -1, 'undefined', 0, 100, 5, 0, 0, 0, 0),
(29, 0, 0, 0, 0, 0, 0, 0, 10, 0, 17500, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'Become one of the mighty Asgirs! Never feel fear again as you soar through the heavens and feel the might of wind in your hands.', 'Wind', 'Weapon', 'Polearm', 'items/polearms/AsgirTrident.swf', 'iwpolearm', 'AsgirTrident', 'Asgir Trident', 0, 0, -1, '', -1, 'undefined', 0, 100, 5, 0, 0, 0, 0),
(30, 1, 0, 0, 0, 0, 0, 0, 5, 0, 350, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'This weapon is ancient.. and still very recognizable. The dark overlords used these blades to bury their foes.', 'Dark', 'Weapon', 'Sword', 'items/swords/GraveCrowderR.swf', 'iwsword', 'GraveCrowder', 'Grave Crowder', 0, 0, -1, '', -1, 'undefined', 0, 100, 5, 0, 0, 0, 0),
(31, 0, 0, 0, 0, 0, 0, 0, 15, 0, 35000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'This weapon was held by the Dragon King himself. One of his personal axes, used for slaughter.', 'Dark', 'Weapon', 'Axe', 'items/axes/DragonKingAxe.swf', 'iwaxe', 'DragonKingAxe', 'Dragon King Axe', 0, 0, -1, '', -1, 'undefined', 0, 100, 5, 0, 0, 0, 0),
(32, 1, 0, 0, 0, 0, 0, 0, 5, 0, 1000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'With this type of power in your hand, others look at you as if you''re a god.', 'Lightening', 'Weapon', 'Dagger', 'items/swords/GodHandR1.swf', 'iwdagger', 'GodHand', 'Hands of God', 0, 0, -1, '', -1, 'undefined', 0, 100, 5, 0, 0, 0, 0),
(33, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'This is the blade most knights keep on their hip. Beautifully crafted.', 'Nature', 'Weapon', 'Sword', 'items/swords/KnightBlade.swf', 'iwsword', 'KnightBlade', 'Knight Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(34, 1, 0, 0, 0, 0, 0, 0, 1, 0, 100, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'This is the blade powerful knights keep on their hip. Beautifully crafted.', 'Lightening', 'Weapon', 'Sword', 'items/swords/MadKnightBlade.swf', 'iwsword', 'MadKnightBlade', 'Greater Knight Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(35, 1, 0, 0, 0, 0, 0, 0, 5, 0, 1000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'With this type of power in your hand, others look at you as if you''re death.', 'Dark', 'Weapon', 'Dagger', 'items/swords/DeathHand.swf', 'iwdagger', 'DeathHand', 'Hands of Death', 0, 0, -1, '', -1, 'undefined', 0, 100, 5, 0, 0, 0, 0),
(36, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'An assassin always keeps his trusty daggers within a milliseconds grasp.', 'Dark', 'Weapon', 'Dagger', 'items/swords/GutripperDaggers.swf', 'iwdagger', 'GutripperDaggers', 'Assassin''s Daggers', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(37, 1, 0, 0, 0, 0, 0, 0, 1, 0, 100, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The more nimble assassins ditch their daggers and carry a powerful katana, swift but savage.', 'Dark', 'Weapon', 'Sword', 'items/swords/GutripperKatana1.swf', 'iwsword', 'GutripperKatana', 'Assassin''s Katana', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(38, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2265, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'An assassin must be unseen, wrapped in cloak to hide his identity.', 'None', 'he', 'Helm', 'items/helms/AssassinHood.swf', 'iihelm', 'AssassinHood', 'Assassin Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(39, 1, 0, 0, 0, 0, 0, 0, 1, 0, 100, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'More powerful warlocks don''t even use weapons, they just funnel their magic into their palms.', 'Dark', 'Weapon', 'Dagger', 'items/daggers/BakaCasterHands3.swf', 'iwdagger', 'BakaCasterHands', 'Warlock''s Orbs', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(40, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Most warlocks prefer killing their enemies with a nice scythe...', 'Dark', 'Weapon', 'Polearm', 'items/polearms/BakaScythe.swf', 'iwpolearm', 'BakaScythe', 'Warlock''s Scythe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(41, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Madafi''s favorite hairstyle <3.', 'None', 'he', 'Helm', 'items/helms/AranxHair.swf', 'iihelm', 'AranxHair', 'Madafi''s Hairstyle', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(42, 0, 0, 0, 0, 0, 0, 0, 1, 1, 13000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This reinforced axe conceals dark energy.', 'Dark', 'Weapon', 'Axe', 'items/axes/blackknightaxe1a.swf', 'iwaxe', 'blackknightaxe1a', 'Axe of the Black Knight', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(43, 0, 0, 0, 0, 0, 0, 0, 1, 1, 14320, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This cruel weapon steals the souls of it''s victims. Only the destruction of this blade could ever hope to free the trapped spirits.', 'Dark', 'Weapon', 'Sword', 'items/swords/blackknightblade1a.swf', 'iwsword', 'blackknightblade1a', 'Blade of the Wicked', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(44, 0, 0, 0, 0, 0, 0, 0, 1, 1, 12302, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A deadly weapon for knights strike from a distance.', 'Dark', 'Weapon', 'Polearm', 'items/polearms/Blackknightpolearm1.swf', 'iwpolearm', 'Blackknightpolearm1', 'Blade of Corruption', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(45, 0, 0, 0, 0, 0, 0, 0, 1, 1, 17300, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The magical armor of the Black Knight. Legend speaks of an evil curse that lingers inside….', 'Dark', 'co', 'Armor', 'knight2_skin.swf', 'iwarmor', 'knight2', 'Black Knight Armor', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(46, 0, 0, 0, 0, 0, 0, 0, 1, 1, 5000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The Black Knight''s Helm', 'Dark', 'he', 'Helm', 'items/helms/BlackKnighthelm1.swf', 'iihelm', 'BlackKnighthelm1', 'Black Knight Helm', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(47, 0, 0, 0, 0, 0, 0, 0, 1, 1, 5602, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This cloak is bettered but seems to have a life of its own. (color custom)', 'None', 'ba', 'Cape', 'items/capes/Blackknightcape1.swf', 'iicape', 'Blackknightcape1', 'Underworld Cloak', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(48, 0, 0, 0, 0, 0, 0, 0, 2, 1, 2000, 100, 2, 1, 0, -1, 0, 100, '', '', 10, 1, 'Krom! These barbarians work as mercenaries and look to create their own kingdom. Their loyalties lie with no one but their own.', 'None', 'co', 'Armor', 'barbarian1_skin.swf', 'iwarmor', 'Barbarian1', 'Samarian', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(49, 0, 0, 0, 0, 0, 0, 0, 8, 1, 5500, 100, 8, 1, 0, -1, 0, 0, '', '', 10, 1, 'Many of the Vanguard use this mighty hammer to crush their foes.', 'Stone', 'Weapon', 'Mace', 'items/maces/mace06.swf', 'iwmace', '', 'Vanguard''s Hammer', 0, 0, -1, '', -1, 'undefined', 0, 0, 1, 0, 0, 0, 0),
(50, 1, 0, 0, 0, 0, 0, 0, 5, 1, 900, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'Beast Masters tend to like this pet.', 'None', 'pe', 'Pet', 'items/pets/ferret1.swf', 'iipet', 'Ferret1', 'Ferret', 0, 0, -1, '', -1, 'undefined', 0, 103, 0, 0, 0, 0, 0),
(51, 0, 0, 0, 0, 0, 0, 0, 3, 1, 2500, 100, 3, 1, 0, -1, 0, 0, '', '', 10, 1, 'An ancient weapon from a time long ago. Made with such skill that the blade still holds its edge!', 'Nature', 'Weapon', 'Sword', 'items/swords/vorpalsword.swf', 'iwsword', '', 'Vorpal Sword', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(52, 0, 0, 0, 0, 0, 0, 0, 8, 1, 3500, 100, 8, 1, 0, -1, 0, 0, '', '', 35, 1, 'This weapon was made for hunting the most fearsome beasts of Lore! And we aren''t talking about Sneevils or Zards here...', 'None', 'Weapon', 'Sword', 'items/swords/sword26.swf', 'iwsword', '', 'Dragon Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(53, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 8, 'Wow, this is a really nice pelt.', 'None', 'None', 'Quest Item', '', 'iibag', '', 'Bear Pelt', 0, 0, -1, '3', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(54, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 5, 'An Imp wildly squirms in the bag.', 'None', 'None', 'Quest Item', '', 'iibag', '', 'Imp Caputred', 0, 0, -1, '4', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(55, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, '', 'None', 'None', 'Quest Item', '', 'iibag', '', 'Bandit Defeated', 0, 0, -1, '5', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(56, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'None', 'Quest Item', '', 'iibag', '', 'Black Knight Defeated', 0, 0, -1, '6', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(57, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Captain Karr''s Shop key in nebwie.', 'None', 'None', 'Item', '', 'iibag', '', 'Newbie Shop Key', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(58, 0, 0, 0, 0, 0, 0, 0, 7, 1, 3500, 100, 7, 1, 0, -1, 0, 0, '', '', 35, 1, 'Gasparian Knights use these iconic swords to defend their keep.', 'Fire', 'Weapon', 'Sword', 'items/swords/GasparianBlade.swf', 'iwsword', 'GasparianBlade', 'Gasparian Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(59, 0, 0, 0, 0, 0, 0, 0, 9, 1, 4500, 100, 9, 1, 0, -1, 0, 0, '', '', 35, 1, 'This is a great blade known as NightSlayer. used by hunters to slay monsters in the dark.', 'Dark', 'Weapon', 'Sword', 'items/swords/NightSlayer.swf', 'iwsword', 'NightSlayer', 'NightSlayer Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(60, 0, 0, 0, 0, 0, 0, 0, 12, 1, 7500, 100, 12, 1, 0, -1, 0, 0, '', '', 35, 1, 'The Grim Vestige is the blade used by Grim Drows, undead elves from the dark forests.', 'Dark', 'Weapon', 'Sword', 'items/swords/GrimVestige.swf', 'iwsword', 'GrimVestige', 'Grim Vestige', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(61, 0, 0, 0, 0, 0, 0, 0, 12, 1, 4005, 100, 12, 1, 0, -1, 0, 0, '', '', 35, 1, 'This mighty glaive is capable of melting through the corpses of your foes.', 'Fire', 'Weapon', 'Polearm', 'items/polearms/FlameGlaive1.swf', 'iwpolearm', 'FlameGlaive', 'Flame Glaive', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(62, 0, 0, 0, 0, 0, 0, 0, 10, 1, 4500, 100, 10, 1, 0, -1, 0, 0, '', '', 35, 1, 'The moon''s powerful rays are absorbed by the hulking blade.', 'Light', 'Weapon', 'Sword', 'items/swords/FullSilver.swf', 'iwsword', 'FullSilver', 'Full Silver', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(63, 0, 0, 0, 0, 0, 0, 0, 6, 1, 2000, 100, 6, 1, 0, -1, 0, 0, '', '', 35, 1, 'The edge of this sword is that of the sharpest in the world. Even staring at it can cause small paper cuts to form on your body.', 'Wind', 'Weapon', 'Sword', 'items/swords/VorpalEdge1.swf', 'iwsword', 'VorpalEdge', 'Vorpal Edge', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(64, 1, 0, 0, 0, 0, 0, 0, 15, 1, 350, 100, 15, 1, 0, -1, 0, 0, '', '', 35, 1, 'The doomknights aren''t all capable of holding such a powerful weapon. Only Doom Shoguns can use this blade to it''s full potential.', 'Dark', 'Weapon', 'Sword', 'items/swords/DoomKatanaWep1.swf', 'iwsword', 'DoomKatana', 'Doom Katana', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(65, 0, 0, 0, 0, 0, 0, 0, 0, 1, 27500, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'The Necromancer Emperor Is a term used to describe an adept of the order. Emperor''s usually hold positions of power and leadership in these cults.', 'None', 'co', 'Armor', 'NecromancerEmperor.swf', 'iwarmor', 'NecromancerEmperor', 'Necromancer Emperor', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(66, 0, 0, 0, 0, 0, 0, 0, 15, 1, 4000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'Arcana the Mage Trainer''s preferred element is fire.She gives her students an elemental staff of a different nature.', 'Ice', 'Weapon', 'Staff', 'items/staves/staffMageTrainer.swf', 'iwstaff', '', 'Arcana''s Disciple', 0, 0, -1, '', -1, 'undefined', 0, 32, 1, 0, 0, 0, 0),
(67, 1, 0, 0, 0, 0, 0, 0, 1, 1, 350, 100, 1, 1, 0, -1, 0, 0, '', '', 5, 1, 'Noted weaponsmith Darkondrago has ventured deep into the Underworld and valiantly vanquished a rogue demon. Conscripting the corpse for his crafting needs, Drago then made his way home to begin forging this epic scythe!', 'Dark', 'Weapon', 'Staff', 'items/staves/DemonicRevenge1.swf', 'iwstaff', 'DemonicRevenge1', 'Demonic Revenge', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(68, 0, 0, 0, 0, 0, 0, 0, 0, 1, 17500, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, ' A set of regal robes that reflect your expertise in the ever-expanding field of magic. Only true magi have the honor of wearing such an armor.\nNote: The gem on the head is Color Custom to Accessory Color.', 'None', 'co', 'Armor', 'MiltonPoolMageLord_skin.swf', 'iwarmor', 'MageLord', 'Mage Lord', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(69, 0, 0, 0, 0, 0, 0, 0, 15, 1, 2500, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'What''s an emperor without a crown?', 'None', 'he', 'Helm', 'items/helms/NecromancerEmperorCrownfix.swf', 'iihelm', 'NecromancerEmperorCrownfix', 'Necromancer Emperor Crown', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(70, 0, 0, 0, 0, 0, 0, 0, 15, 1, 2500, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'Don your traditional garb. Class is in session.', 'None', 'he', 'Helm', 'items/helms/NecromancerEmperorHoodfix.swf', 'iihelm', 'NecromancerEmperorHoodfix', 'Necromancer Emperor Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(71, 0, 0, 0, 0, 0, 0, 0, 15, 1, 15000, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'These staves are made by submitting a special request to a council of Necromancers. Should they find you worthy, this is what they reward you with.', 'None', 'Weapon', 'Staff', 'items/staves/NecromancerEmperorStaff.swf', 'iwstaff', 'NecromancerEmperorStaff', 'Necromancer Emperor Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(72, 0, 0, 0, 0, 0, 0, 0, 0, 1, 32500, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'During the expedition to Fotia, new and fascinating ways to work with lava and magma were discovered. Cinder mages explore these new avenues of magic.', 'None', 'co', 'Armor', 'MageOfCinders.swf', 'iwarmor', 'MageOfCinders', 'Mage Of Cinders', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(73, 0, 0, 0, 0, 0, 0, 0, 0, 1, 30000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'Druids beseech the earth for their power. Those silly fools. The earth only responds to someone who is powerful enough to take control, instead of asking for it.', 'None', 'co', 'Armor', 'NaturalMage.swf', 'iwarmor', 'NaturalMage', 'Naturalist Mage', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(74, 0, 0, 0, 0, 0, 0, 0, 0, 1, 31000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'The natural power of the Northlandic Fjords runs deeply in the very core of this armor. It is spelled to protect the wearer from the biting cold that comes from donning this garment.', 'Ice', 'co', 'Armor', 'MageFrosty.swf', 'iwarmor', 'MageFrosty', 'Fjord Magi', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(75, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8500, 100, 10, 1, 0, -1, 0, 0, '', '', 13, 1, 'Modeled after samples obtained from the Lore of DragonFable, the Shadow Mages conjure shadows and use them to vanquish their enemies.', 'Dark', 'co', 'Armor', 'DFShadowMage.swf', 'iwarmor', 'DFShadowMage', 'Shadow Mage', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(76, 0, 0, 0, 0, 0, 0, 0, 15, 1, 17000, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'Modeled after samples of a mace, obtained from the Lore of AdventureQuest, this vicious and powerful mace was wielded by Nemesis and was designed to lacerate flesh from bone!', 'Dark', 'Weapon', 'Mace', 'items/maces/NemesisMaceTomix.swf', 'iwmace', 'NemesisMaceTomix', 'Nemesis Mace', 0, 0, -1, '', -1, 'undefined', 0, 30, 1, 0, 0, 0, 0),
(77, 0, 0, 0, 0, 0, 0, 0, 20, 1, 27000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'Deep under Falconreach in the DragonFable timeline, the ChaosWeavers raged. Those who felt pity or empathy for them took their side in the war for Ravenloss. This scythe was awarded to those who battled so valiantly for those who needed aid.', 'Dark', 'Weapon', 'Polearm', 'items/polearms/ChaosWDefenderVen.swf', 'iwpolearm', 'ChaosWDefenderVen', 'ChaosWeaver Defender', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(78, 0, 0, 0, 0, 0, 0, 0, 10, 1, 7000, 100, 10, 1, 0, -1, 0, 0, '', '', 13, 1, 'This magical spear was wielded by the same warrior over many generations. If he was ever struck down in battle, he rose again as a new fighter to wield his spear once again.', 'None', 'Weapon', 'Polearm', 'items/polearms/KalhiSpear.swf', 'iwpolearm', 'KalhiSpear', 'Legacy Spear', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(79, 0, 0, 0, 0, 0, 0, 0, 5, 1, 7000, 100, 5, 1, 0, -1, 0, 0, '', '', 13, 1, 'ICE ICE BABY.. Rock.. Rock baby...?', 'None', 'Weapon', 'Axe', 'items/axes/LichEarthAxe.swf', 'iwaxe', 'LichEarthAxe', 'Lich''s Earth Axe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(80, 1, 0, 0, 0, 0, 0, 0, 1, 1, 550, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These bilge rat''s fly under the colors of the Shadowscythe. Instead of "shiver me timbers", they cry "LONG BE UN-LIVIN'' THE SHADOWSCYTHE!"', 'Dark', 'co', 'Armor', 'DoomKnightNavalCom.swf', 'iwarmor', 'DoomKnightNaval', 'DoomKnight Naval', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(81, 1, 0, 0, 0, 0, 0, 0, 1, 1, 300, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Dark', 'Weapon', 'Sword', 'items/swords/starsworddoom_r2.swf', 'iwsword', 'starsworddoom_r2', 'DoomKnight Starsword', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(82, 0, 0, 0, 0, 0, 0, 0, 0, 1, 250000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'co', 'Armor', 'EliteAsgardian.swf', 'iwarmor', 'EliteAsgardian', 'Elite Asgardian', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(83, 0, 0, 0, 0, 0, 0, 0, 50, 1, 200000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'Weapon', 'Dagger', 'items/daggers/EliteAsgardianHammerShield.swf', 'iwdagger', 'EliteAsgardianHammerShield', 'Elite Asgardian Hammer And Shield', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(84, 0, 0, 0, 0, 0, 0, 0, 50, 1, 175000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'he', 'Helm', 'items/helms/EliteAsgardianHelmet.swf', 'iihelm', 'EliteAsgardianHelmet', 'Elite Asgardian Helmet', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(85, 0, 0, 0, 0, 0, 0, 0, 15, 1, 175000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'he', 'Helm', 'items/helms/BrilliantNavalHatM.swf', 'iihelm', 'BrilliantNavalHatM', 'Brilliant Naval Hat (M)', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(86, 0, 0, 0, 0, 0, 0, 0, 0, 1, 275000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'co', 'Armor', 'BrilliantNavalCommander.swf', 'iwarmor', 'BrightNavalCommander', 'Brilliant Naval Commander', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(87, 0, 0, 0, 0, 0, 0, 0, 15, 1, 150000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'ba', 'Cape', 'items/capes/BrilliantParrotCape.swf', 'iicape', 'BrilliantParrotCape', 'Brilliant Parrot Cape', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(88, 0, 0, 0, 0, 0, 0, 0, 15, 1, 200000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'Weapon', 'Sword', 'items/swords/starswordBrilliant2_r1.swf', 'iwsword', 'starswordBrilliant2_r1', 'Brilliant Starsword', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(89, 0, 0, 0, 0, 0, 0, 0, 0, 1, 250000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Dark', 'co', 'Armor', 'LegionNavalBlue.swf', 'iwarmor', 'LegionNavalBlue', 'Azure Legion Naval', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(90, 0, 0, 0, 0, 0, 0, 0, 15, 1, 200000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Dark', 'Weapon', 'Sword', 'items/swords/starswordskull.swf', 'iwsword', 'starswordskull', 'Legion Starsword', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(91, 0, 0, 0, 0, 0, 0, 0, 15, 1, 175000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'he', 'Helm', 'items/helms/MaleLegionNavalHat.swf', 'iihelm', 'MaleLegionNavalHat', 'Legion Naval Hate (M)', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(92, 0, 0, 0, 0, 0, 0, 0, 15, 1, 175000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'he', 'Helm', 'items/helms/FemaleLegionNavalHat.swf', 'iihelm', 'FemaleLegionNavalHat', 'Legion Naval Hat (F)', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(93, 0, 0, 0, 0, 0, 0, 0, 15, 1, 175000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'he', 'Helm', 'items/helms/UndeadLegionBandanna.swf', 'iihelm', 'UndeadLegionBandanna', 'Undead Legion Bandanna', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(94, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The original Pirate.', 'Nature', 'co', 'Armor', 'Pirate2_skin.swf', 'iwarmor', 'Pirate2', 'Alpha Pirate', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(95, 1, 0, 0, 0, 0, 0, 0, 1, 1, 250, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The very first starsword! a powerful items capable of shattering planets', 'Light', 'Weapon', 'Sword', 'items/swords/sword23.swf', 'iwsword', '', 'Blue Starsword', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(96, 1, 0, 0, 0, 0, 0, 0, 5, 1, 250, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'Weapon', 'Sword', 'items/swords/starswordgold.swf', 'iwsword', '', 'Golden Starsword', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(97, 0, 0, 0, 0, 0, 0, 0, 15, 1, 250000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Nature', 'co', 'Armor', 'TheWolfVariant.swf', 'iwarmor', 'TheWolfVariant', 'The Wolf Variant', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(98, 0, 0, 0, 0, 0, 0, 0, 15, 1, 200000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'he', 'Helm', 'items/helms/TheWolvesCrownGlow.swf', 'iihelm', 'TheWolvesCrownGlow', 'The Wolves Crown Glow', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(99, 0, 0, 0, 0, 0, 0, 0, 15, 1, 175000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'ba', 'Cape', 'items/capes/TheWolvesCape.swf', 'iicape', 'TheWolvesCape', 'The Wolves Cape', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(100, 0, 0, 0, 0, 0, 0, 0, 50, 1, 300000, 100, 50, 1, 0, -1, 0, 0, '', '', 100, 1, '', 'Dark', 'Weapon', 'Sword', 'items/swords/TheWicked.swf', 'iwsword', 'TheWicked', 'The Wicked', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(102, 1, 0, 0, 0, 0, 0, 0, 0, 1, 450, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'This armor is part of the Spectre Set. A wonder of technology, this armor can enhance strength, speed, endurance and your senses. It might even add a few senses you never had before.', 'Light', 'co', 'Armor', 'Spectre2.swf', 'iwarmor', 'Spectre2', 'Overclocked Techsuit', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(103, 1, 0, 0, 0, 0, 0, 0, 5, 1, 75, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'This helm is part of the Spectre Set. The Built in HUD (Head''s Up Display) gives real-time tactical information in 360 degrees at a distance of 1km. Also comes with an on-board MP3 player.', 'None', 'he', 'Helm', 'items/helms/Spectre2.swf', 'iihelm', 'Spectre', 'Overclocked Faceplate', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(104, 0, 0, 0, 0, 0, 0, 0, 30, 1, 50000, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'The murmur of low chanting fills the air, the ground begins to breakaway.  Undead crawl from their tombs ready to bow before their master.  This is the power of the Necromancer!', 'Dark', 'co', 'Armor', 'RisingNecro.swf', 'iwarmor', 'RisingNecro', 'Necromancer Rising', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(105, 0, 0, 0, 0, 0, 0, 0, 30, 1, 23500, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'You raise the dead, best to hide your face from scorn.', 'None', 'he', 'Helm', 'items/helms/RisingNecroHood.swf', 'iihelm', 'RisingNecroHood', 'Rising Necromancer Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(106, 0, 0, 0, 0, 0, 0, 0, 30, 1, 23500, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'Just because you raise the dead doesn''t mean you can''t be a necromancer extraordinaire.', 'None', 'he', 'Helm', 'items/helms/RisingNecroHelm.swf', 'iihelm', 'RisingNecroHelm', 'Rising Necromancer Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(107, 0, 0, 0, 0, 0, 0, 0, 30, 1, 44000, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'Evoke the dead and bring them back to serve under you!', 'Dark', 'Weapon', 'Staff', 'items/staves/RisingNecroStaff.swf', 'iwstaff', 'RisingNecroStaff', 'Rising Necromancer Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(108, 0, 0, 0, 0, 0, 0, 0, 20, 1, 20000, 100, 20, 1, 0, -1, 0, 0, '', '', 35, 1, 'Hard as dragon scales and just as sharp, these magi of the Jade Dragon continue their conquest knowledge.', 'Light', 'co', 'Armor', 'DragonMage.swf', 'iwarmor', 'DragonMage', 'Jade Dragon Mage', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(109, 0, 0, 0, 0, 0, 0, 0, 20, 1, 8500, 100, 20, 1, 0, -1, 0, 0, '', '', 35, 1, 'Crafted to look like the wings of a dragon at rest.', 'None', 'ba', 'Cape', 'items/capes/DragonMageCape.swf', 'iicape', 'DragonMageCape', 'Jade Dragon Mage Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(110, 0, 0, 0, 0, 0, 0, 0, 20, 1, 8500, 100, 20, 1, 0, -1, 0, 0, '', '', 35, 1, 'It''s the eye of the Dragon, it''s the thrill of the fight!', 'None', 'he', 'Helm', 'items/helms/DragonMageHelm.swf', 'iihelm', 'DragonMageHelm', 'Jade Dragon Mage Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(111, 0, 0, 0, 0, 0, 0, 0, 20, 1, 15000, 100, 20, 1, 0, -1, 0, 0, '', '', 35, 1, 'The Dragon protects the orb that gives this staff its power.', 'Nature', 'Weapon', 'Staff', 'items/staves/DragonMageStaff.swf', 'iwstaff', 'DragonMageStaff', 'Jade Dragon Mage Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(112, 0, 0, 0, 0, 0, 0, 0, 30, 1, 33000, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'An incredibly old group of dragon lords.', 'Light', 'co', 'Armor', 'DSInquisitor2.swf', 'iwarmor', 'DSInquisitor', 'DragonSlayer Inquisitor', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(113, 0, 0, 0, 0, 0, 0, 0, 30, 1, 17500, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'Following the blessing of Inquisitor high priests, not even the flames and fangs of the Red Dragon can tear this cape apart.', 'None', 'ba', 'Cape', 'items/capes/DSICape.swf', 'iicape', 'DSICape', 'Inquisitor''s Wrap', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(114, 0, 0, 0, 0, 0, 0, 0, 30, 1, 17500, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'Helmet hair is an inevitable problem all DragonSlayers face. At Least your helmet isn’t model after the thing you’re fighting.', 'None', 'he', 'Helm', 'items/helms/DSIHelm2.swf', 'iihelm', 'DSIHelm2', 'Inquisitor''s Mask', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(115, 0, 0, 0, 0, 0, 0, 0, 30, 1, 17500, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'Helmet hair is an inevitable problem all DragonSlayers face. At Least your helmet isn’t model after the thing you’re fighting.', 'None', 'he', 'Helm', 'items/helms/DSITravelerHat2.swf', 'iihelm', 'DSITravelerHat2', 'Inquisitor''s Faceplate', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(116, 0, 0, 0, 0, 0, 0, 0, 30, 1, 17500, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'Helmet hair is an inevitable problem all DragonSlayers face. At Least your helmet isn’t model after the thing you’re fighting.', 'None', 'he', 'Helm', 'items/helms/DSIHat2.swf', 'iihelm', 'DSIHat2', 'Inquisitor''s Hat', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(117, 0, 0, 0, 0, 0, 0, 0, 0, 1, 25000, 100, 15, 1, 0, -1, 0, 0, '', '', 35, 1, 'The frozen tundra of the Northlands is home to these nomadic rogues.', 'Ice', 'co', 'Armor', 'CryoRogue.swf', 'iwarmor', 'CryoRogue', 'Bitterblade Rogue', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(118, 0, 0, 0, 0, 0, 0, 0, 15, 1, 10000, 100, 15, 1, 0, -1, 0, 0, '', '', 35, 1, 'Though it appears light, it warm the body well.', 'None', 'ba', 'Cape', 'items/capes/CryoRogueCape.swf', 'iicape', 'CryoRogueCape', 'Bitterblade Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(119, 0, 0, 0, 0, 0, 0, 0, 15, 1, 10000, 100, 15, 1, 0, -1, 0, 0, '', '', 35, 1, '', 'None', 'he', 'Helm', 'items/helms/CryoRogueHood.swf', 'iihelm', 'CryoRogueHood', 'Bitterblade Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(120, 0, 0, 0, 0, 0, 0, 0, 15, 1, 12000, 100, 15, 1, 0, -1, 0, 0, '', '', 35, 1, 'Be one with the wind and sky.', 'Wind', 'Weapon', 'Staff', 'items/staves/CryoRogueStaff.swf', 'iwstaff', 'CryoRogueStaff', 'Bitterblade Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(121, 0, 0, 0, 0, 0, 0, 0, 30, 1, 50000, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'They''ll be no foolish wand waving for this skilled magic users.  Their arcane powers fool the eye and confuse the spectator.', 'Light', 'co', 'Armor', 'Illusionist.swf', 'iwarmor', 'Illusionist', 'Illusionist', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(122, 0, 0, 0, 0, 0, 0, 0, 30, 1, 20000, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'Formed of pure mana, this is the Illusionist source of power.', 'None', 'ba', 'Cape', 'items/capes/IllusionistMight.swf', 'iicape', 'IllusionistMight', 'Illusionist''s Might', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(123, 0, 0, 0, 0, 0, 0, 0, 30, 1, 20000, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'The eyes are the windows to the soul, so of course the Illusionist covers them...', 'None', 'he', 'Helm', 'items/helms/IllusionistHelmFem.swf', 'iihelm', 'IllusionistHelmFem', 'Female Illusionist Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(124, 0, 0, 0, 0, 0, 0, 0, 30, 1, 20000, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'The eyes are the windows to the soul, so of course the Illusionist covers them...', 'None', 'he', 'Helm', 'items/helms/IllusionistHelm.swf', 'iihelm', 'IllusionistHelm', 'Illusionist Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(125, 0, 0, 0, 0, 0, 0, 0, 30, 1, 32000, 100, 30, 1, 0, -1, 0, 0, '', '', 35, 1, 'Formed of pure mana this sword conducts the illusions.', 'Light', 'Weapon', 'Sword', 'items/swords/IllusionistChannel.swf', 'iwsword', 'IllusionistChannel', 'Illusionist''s Channel', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(126, 1, 0, 0, 0, 0, 0, 0, 0, 1, 500, 100, 10, 1, 0, -1, 0, 0, '', '', 35, 1, 'Loyal to the TRUE ruler and to Shadowfall.  Dedicated champions of the Empress and the Shadowscythe.  (5% chance to do the Meteor Shower attack animation, 15% XP boost)', 'Dark', 'co', 'Armor', 'GravelynMiltonius1_skin.swf', 'iwarmor', 'GravelynMiltonius1', 'Gravelyn''s Champion', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(127, 1, 0, 0, 0, 0, 0, 0, 10, 1, 100, 100, 10, 1, 0, -1, 0, 0, '', '', 35, 1, 'Red and black, the colors of the Shadowscythe. (5% chance to do the Meteor Shower attack animation, 15% XP boost)', 'None', 'ba', 'Cape', 'items/capes/GravelynMiltoniusCape.swf', 'iicape', 'GravelynMiltoniusCape', 'Gravelyn''s Champion Cloak', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(128, 1, 0, 0, 0, 0, 0, 0, 10, 1, 100, 100, 10, 1, 0, -1, 0, 0, '', '', 35, 1, 'Strike fear into the hearts of your foes and exclaim LONG UN-LIVE THE SHADOWSCYTHE!  (5% chance to do the Meteor Shower attack animation, 15% XP boost)', 'None', 'he', 'Helm', 'items/helms/GravelynMiltoniusHelm.swf', 'iihelm', 'GravelynMiltoniusHelm', 'Gravelyn''s Champion Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(129, 1, 0, 0, 0, 0, 0, 0, 10, 1, 200, 100, 10, 1, 0, -1, 0, 0, '', '', 35, 1, 'Crafted by Gravelyn''s own weaponsmith, this blade grants it''s wielder powers of the Shadowscythe not given to just any follower.  Use it well.  (5% chance to do the Meteor Shower attack animation, 15% XP boost)', 'Dark', 'Weapon', 'Sword', 'items/swords/GravelynMiltoniusSword.swf', 'iwsword', 'GravelynMiltoniusSword', 'Gravelyn''s Champion Claymore', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(130, 1, 0, 0, 0, 0, 0, 0, 0, 1, 600, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Brethren to the DoomKnight BattleMages, the ShadowMage dives deeper into the macabre and otherworldly styles of enchanting.  (3% chance to do the smokebomb animation, and 5% XP boost)', 'Dark', 'co', 'Armor', 'BlackDoomMage.swf', 'iwarmor', 'BlackDoomMage', 'Doomknight Shadowmage', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(131, 1, 0, 0, 0, 0, 0, 0, 5, 1, 125, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Cloaked in darkness. (3% chance to do the smokebomb animation, and 5% XP boost)', 'None', 'ba', 'Cape', 'items/capes/BlackDoomMageCape.swf', 'iicape', 'BlackDoomMageCape', 'ShadowMage Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(132, 1, 0, 0, 0, 0, 0, 0, 5, 1, 500, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Burn, baby, burn. (3% chance to do the smokebomb animation, and 5% XP boost)', 'Fire', 'Weapon', 'Dagger', 'items/daggers/GoldDoomFlame.swf', 'iwdagger', 'GoldDoomFlame', 'Golden DoomFlame', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(133, 1, 0, 0, 0, 0, 0, 0, 5, 1, 450, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Combine fire and doom and voila! (3% chance to do the smokebomb animation, and 5% XP boost)', 'Fire', 'Weapon', 'Dagger', 'items/daggers/GoldDoomFlameSword.swf', 'iwdagger', 'GoldDoomFlameSword', 'ShadowFlame Rapier', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(134, 1, 0, 0, 0, 0, 0, 0, 5, 1, 100, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Shadows conceal something sinister. (3% chance to do the smokebomb animation, and 5% XP boost)', 'None', 'he', 'Helm', 'items/helms/BlackDoomMageHelmet.swf', 'iihelm', 'BlackDoomMageHelmet', 'ShadowMage Helmet', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(135, 1, 0, 0, 0, 0, 0, 0, 5, 1, 100, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Shadows conceal something sinister. (3% chance to do the smokebomb animation, and 5% XP boost)', 'None', 'he', 'Helm', 'items/helms/BlackDoomMageHood.swf', 'iihelm', 'BlackDoomMageHood', 'Plated ShadowMage Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(136, 1, 0, 0, 0, 0, 0, 0, 5, 1, 150, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Shadows conceal something sinister. (3% chance to do the smokebomb animation, and 5% XP boost)', 'None', 'he', 'Helm', 'items/helms/BlackDoomMageHood2.swf', 'iihelm', 'BlackDoomMageHood2', 'ShadowMage Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(137, 1, 0, 0, 0, 0, 0, 0, 5, 1, 150, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Shadows conceal something sinister. (3% chance to do the smokebomb animation, and 5% XP boost)', 'None', 'he', 'Helm', 'items/helms/BlackDoomMageHornedHood.swf', 'iihelm', 'BlackDoomMageHornedHood', 'Horned ShadowMage Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(138, 1, 0, 0, 0, 0, 0, 0, 5, 1, 100, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'Shadows conceal something sinister. (3% chance to do the smokebomb animation, and 5% XP boost)', 'None', 'he', 'Helm', 'items/helms/BlackDoomMageSkull.swf', 'iihelm', 'BlackDoomMageSkull', 'ShadowMage Skull', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(139, 1, 0, 0, 0, 0, 0, 0, 5, 1, 300, 100, 5, 1, 0, -1, 0, 0, '', '', 35, 1, 'ShadowMages must always have their sword ready.  This has been crafted specifically for DoomKnight ShadowMages, by one of their own. (3% chance to do the smokebomb animation, and 5% XP boost)', 'Dark', 'Weapon', 'Sword', 'items/swords/BlackDoomMageSword.swf', 'iwsword', 'BlackDoomMageSword', 'ShadowMage Rapier', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(140, 0, 0, 0, 0, 0, 0, 0, 0, 1, 100000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'Carved marks illustrate the suffering Lore has gone through.  As its Champion, nothing shall stop you in returning Lore to its glory!', 'Light', 'co', 'Armor', 'CoB.swf', 'iwarmor', 'CoB', 'Lore''s Champion', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(141, 0, 0, 0, 0, 0, 0, 0, 35, 1, 67500, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'These daggers draw in all the negative flow around Lore and transmit it to their owner.  A very heavy price to pay.', 'None', 'Weapon', 'Dagger', 'items/daggers/CoBDaggers.swf', 'iwdagger', 'CoBDaggers', 'Lore''s Champion Daggers', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(142, 0, 0, 0, 0, 0, 0, 0, 0, 1, 76000, 100, 45, 1, 0, -1, 0, 0, '', '', 13, 1, 'The legendary Red Dragon of Lore has fought against many but a few have fought for him.', 'Dark', 'co', 'Armor', 'DragonPaladin.swf', 'iwarmor', 'DragonPaladin', 'Vasalkar''s Champion', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(143, 0, 0, 0, 0, 0, 0, 0, 45, 1, 25800, 100, 45, 1, 0, -1, 0, 0, '', '', 13, 1, 'The heat of Vasalkar''s lair is harsh, better be prepared.', 'None', 'he', 'Helm', 'items/helms/DragonPaladinHelm.swf', 'iihelm', 'DragonPaladinHelm', 'Dragon Paladin Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(144, 1, 0, 0, 0, 0, 0, 0, 15, 1, 450, 100, 15, 1, 0, -1, 0, 0, '', '', 100, 1, 'This blade is a great, legendary blade. Forged from the scales and soul of a great dragon. This version seems to be at full power.', 'None', 'Weapon', 'Sword', 'items/swords/AruscaleBladeReleased.swf', 'iwsword', 'AruscaleBladeReleased', 'Aruscale Blade Released', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(145, 0, 0, 0, 0, 0, 0, 0, 35, 1, 45000, 100, 35, 1, 0, -1, 0, 0, '', '', 35, 1, 'This blade is a great, legendary blade. Forged from the scales and soul of a great dragon.', 'None', 'Weapon', 'Sword', 'items/swords/AruscaleBlade.swf', 'iwsword', 'AruscaleBlade', 'Aruscale Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(146, 0, 0, 0, 0, 0, 0, 0, 35, 1, 47500, 100, 35, 1, 0, -1, 0, 0, '', '', 35, 1, 'This spear is a great, legendary weapon. Forged from the scales and soul of a great dragon.', 'None', 'Weapon', 'Polearm', 'items/polearms/AruscaleSpear.swf', 'iwpolearm', 'AruscaleSpear', 'Aruscale Spear', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(147, 0, 0, 0, 0, 0, 0, 0, 20, 1, 30000, 100, 20, 1, 0, -1, 0, 0, '', '', 35, 1, 'This shortsword has the power of thunder in it''s blade!', 'None', 'Weapon', 'Sword', 'items/swords/StrestormBlade.swf', 'iwsword', 'StrestormBlade', 'Strestorm Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(148, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 20, 1, 0, -1, 0, 0, '', '', 35, 1, 'These shortsword has the power of thunder in it''s blades!', 'None', 'Weapon', 'Dagger', 'items/swords/StrestormBlade.swf', 'iwdagger', 'StrestormBlade', 'Dual Strestorm Blades', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(149, 0, 0, 0, 0, 0, 0, 0, 50, 1, 70000, 100, 50, 1, 0, -1, 0, 0, '', '', 35, 1, 'The hands on the hilt hold the unknown depths of midnight in their grasp.', 'None', 'Weapon', 'Sword', 'items/swords/NightHolder.swf', 'iwsword', 'NightHolder', 'Night Holder', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(150, 0, 0, 0, 0, 0, 0, 0, 50, 1, 70000, 100, 50, 1, 0, -1, 0, 0, '', '', 35, 1, 'The hands on the hilt hold the unknown depths of midnight in their grasp.', 'None', 'Weapon', 'Dagger', 'items/swords/NightHolder.swf', 'iwdagger', 'NightHolder', 'Dual Night Holders', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(151, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 50, 1, 'This is the first equipable spell. Ever', 'Fire', 'spe', 'Spell', '', 'imd1', '', 'First Spell', 20, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(152, 0, 0, 0, 0, 0, 0, 0, 5, 1, 35000, 100, 5, 1, 0, -1, 0, 0, '', '', 100, 1, 'A powerful spell taught to the ancient starlords! Capable of paralyzing and doing high damage to your enemy!', 'Lightening', 'spe', 'Spell', '', 'ims2', '', 'Alpha Star Blast', 21, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(153, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(154, 0, 0, 0, 0, 0, 0, 0, 2, 1, 2000, 100, 2, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(155, 0, 0, 0, 0, 0, 0, 0, 3, 1, 3000, 100, 3, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(156, 0, 0, 0, 0, 0, 0, 0, 4, 1, 4000, 100, 4, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0);
INSERT INTO `meh_items` (`id`, `Coins`, `Diamonds`, `Staff`, `House`, `Temp`, `Upg`, `ClassID`, `EnhID`, `FactionID`, `Cost`, `DPS`, `Lvl`, `Qty`, `QtyRemain`, `ReqClass`, `ReqCP`, `ReqRep`, `ReqItems`, `ReqFItems`, `Rty`, `Stk`, `Desc`, `Elmt`, `ES`, `Type`, `File`, `Icon`, `Link`, `Name`, `SkillID`, `PTR`, `ProcID`, `ReqQuests`, `QSindex`, `Meta`, `QSvalue`, `Rng`, `EnhPatternID`, `Class`, `Faction`, `bForgeRecipe`, `ForgeProduct`) VALUES
(157, 0, 0, 0, 0, 0, 0, 0, 5, 1, 5000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(158, 0, 0, 0, 0, 0, 0, 0, 6, 1, 6000, 100, 6, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(159, 0, 0, 0, 0, 0, 0, 0, 7, 1, 7000, 100, 7, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(160, 0, 0, 0, 0, 0, 0, 0, 8, 1, 8000, 100, 8, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(161, 0, 0, 0, 0, 0, 0, 0, 9, 1, 9000, 100, 9, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(162, 0, 0, 0, 0, 0, 0, 0, 10, 1, 10000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(163, 0, 0, 0, 0, 0, 0, 0, 11, 1, 11000, 100, 11, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(164, 0, 0, 0, 0, 0, 0, 0, 12, 1, 12000, 100, 12, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(165, 0, 0, 0, 0, 0, 0, 0, 13, 1, 13000, 100, 13, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(166, 0, 0, 0, 0, 0, 0, 0, 14, 1, 14000, 100, 14, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(167, 0, 0, 0, 0, 0, 0, 0, 15, 1, 15000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(168, 0, 0, 0, 0, 0, 0, 0, 16, 1, 16000, 100, 16, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(169, 0, 0, 0, 0, 0, 0, 0, 17, 1, 17000, 100, 17, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(170, 0, 0, 0, 0, 0, 0, 0, 18, 1, 18000, 100, 18, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(171, 0, 0, 0, 0, 0, 0, 0, 19, 1, 19000, 100, 19, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(172, 0, 0, 0, 0, 0, 0, 0, 20, 1, 20000, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(173, 0, 0, 0, 0, 0, 0, 0, 21, 1, 21000, 100, 21, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(174, 0, 0, 0, 0, 0, 0, 0, 22, 1, 22000, 100, 22, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(175, 0, 0, 0, 0, 0, 0, 0, 23, 1, 23000, 100, 23, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(176, 0, 0, 0, 0, 0, 0, 0, 24, 1, 24000, 100, 24, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(177, 0, 0, 0, 0, 0, 0, 0, 25, 1, 25000, 100, 25, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(178, 0, 0, 0, 0, 0, 0, 0, 26, 1, 26000, 100, 26, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(179, 0, 0, 0, 0, 0, 0, 0, 27, 1, 27000, 100, 27, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(180, 0, 0, 0, 0, 0, 0, 0, 28, 1, 28000, 100, 28, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(181, 0, 0, 0, 0, 0, 0, 0, 29, 1, 29000, 100, 29, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(182, 0, 0, 0, 0, 0, 0, 0, 30, 1, 30000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(183, 0, 0, 0, 0, 0, 0, 0, 31, 1, 31000, 100, 31, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(184, 0, 0, 0, 0, 0, 0, 0, 32, 1, 32000, 100, 32, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(185, 0, 0, 0, 0, 0, 0, 0, 33, 1, 33000, 100, 33, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(186, 0, 0, 0, 0, 0, 0, 0, 34, 1, 34000, 100, 34, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(187, 0, 0, 0, 0, 0, 0, 0, 35, 1, 35000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(188, 0, 0, 0, 0, 0, 0, 0, 36, 1, 36000, 100, 36, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(189, 0, 0, 0, 0, 0, 0, 0, 37, 1, 37000, 100, 37, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(190, 0, 0, 0, 0, 0, 0, 0, 38, 1, 38000, 100, 38, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(191, 0, 0, 0, 0, 0, 0, 0, 39, 1, 39000, 100, 39, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(192, 0, 0, 0, 0, 0, 0, 0, 40, 1, 40000, 100, 40, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(193, 0, 0, 0, 0, 0, 0, 0, 41, 1, 41000, 100, 41, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(194, 0, 0, 0, 0, 0, 0, 0, 42, 1, 42000, 100, 42, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(195, 0, 0, 0, 0, 0, 0, 0, 43, 1, 43000, 100, 43, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(196, 0, 0, 0, 0, 0, 0, 0, 44, 1, 44000, 100, 44, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(197, 0, 0, 0, 0, 0, 0, 0, 45, 1, 45000, 100, 45, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(198, 0, 0, 0, 0, 0, 0, 0, 46, 1, 46000, 100, 46, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(199, 0, 0, 0, 0, 0, 0, 0, 47, 1, 47000, 100, 47, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(200, 0, 0, 0, 0, 0, 0, 0, 48, 1, 48000, 100, 48, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(201, 0, 0, 0, 0, 0, 0, 0, 49, 1, 49000, 100, 49, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(202, 0, 0, 0, 0, 0, 0, 0, 50, 1, 50000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors.', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, -2, 0, 0, 0),
(203, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(204, 0, 0, 0, 0, 0, 0, 0, 2, 1, 2000, 100, 2, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(205, 0, 0, 0, 0, 0, 0, 0, 3, 1, 3000, 100, 3, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(206, 0, 0, 0, 0, 0, 0, 0, 4, 1, 4000, 100, 4, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(207, 0, 0, 0, 0, 0, 0, 0, 5, 1, 5000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(208, 0, 0, 0, 0, 0, 0, 0, 6, 1, 6000, 100, 6, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(209, 0, 0, 0, 0, 0, 0, 0, 7, 1, 7000, 100, 7, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(210, 0, 0, 0, 0, 0, 0, 0, 8, 1, 8000, 100, 8, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(211, 0, 0, 0, 0, 0, 0, 0, 9, 1, 9000, 100, 9, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(212, 0, 0, 0, 0, 0, 0, 0, 10, 1, 10000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(213, 0, 0, 0, 0, 0, 0, 0, 11, 1, 11000, 100, 11, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(214, 0, 0, 0, 0, 0, 0, 0, 12, 1, 12000, 100, 12, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(215, 0, 0, 0, 0, 0, 0, 0, 13, 1, 13000, 100, 13, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(216, 0, 0, 0, 0, 0, 0, 0, 14, 1, 14000, 100, 14, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(217, 0, 0, 0, 0, 0, 0, 0, 15, 1, 15000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(218, 0, 0, 0, 0, 0, 0, 0, 16, 1, 16000, 100, 16, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(219, 0, 0, 0, 0, 0, 0, 0, 17, 1, 17000, 100, 17, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(220, 0, 0, 0, 0, 0, 0, 0, 18, 1, 18000, 100, 18, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(221, 0, 0, 0, 0, 0, 0, 0, 19, 1, 19000, 100, 19, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(222, 0, 0, 0, 0, 0, 0, 0, 20, 1, 20000, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(223, 0, 0, 0, 0, 0, 0, 0, 21, 1, 21000, 100, 21, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(224, 0, 0, 0, 0, 0, 0, 0, 22, 1, 22000, 100, 22, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(225, 0, 0, 0, 0, 0, 0, 0, 23, 1, 23000, 100, 23, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(226, 0, 0, 0, 0, 0, 0, 0, 24, 1, 24000, 100, 24, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(227, 0, 0, 0, 0, 0, 0, 0, 25, 1, 25000, 100, 25, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(228, 0, 0, 0, 0, 0, 0, 0, 26, 1, 26000, 100, 26, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(229, 0, 0, 0, 0, 0, 0, 0, 27, 1, 27000, 100, 27, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(230, 0, 0, 0, 0, 0, 0, 0, 28, 1, 28000, 100, 28, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(231, 0, 0, 0, 0, 0, 0, 0, 29, 1, 29000, 100, 29, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(232, 0, 0, 0, 0, 0, 0, 0, 30, 1, 30000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(233, 0, 0, 0, 0, 0, 0, 0, 31, 1, 31000, 100, 31, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(234, 0, 0, 0, 0, 0, 0, 0, 32, 1, 32000, 100, 32, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(235, 0, 0, 0, 0, 0, 0, 0, 33, 1, 33000, 100, 33, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(236, 0, 0, 0, 0, 0, 0, 0, 34, 1, 34000, 100, 34, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(237, 0, 0, 0, 0, 0, 0, 0, 35, 1, 35000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(238, 0, 0, 0, 0, 0, 0, 0, 36, 1, 36000, 100, 36, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(239, 0, 0, 0, 0, 0, 0, 0, 37, 1, 37000, 100, 37, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(240, 0, 0, 0, 0, 0, 0, 0, 38, 1, 38000, 100, 38, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(241, 0, 0, 0, 0, 0, 0, 0, 39, 1, 39000, 100, 39, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(242, 0, 0, 0, 0, 0, 0, 0, 40, 1, 40000, 100, 40, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(243, 0, 0, 0, 0, 0, 0, 0, 41, 1, 41000, 100, 41, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(244, 0, 0, 0, 0, 0, 0, 0, 42, 1, 42000, 100, 42, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(245, 0, 0, 0, 0, 0, 0, 0, 43, 1, 43000, 100, 43, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(246, 0, 0, 0, 0, 0, 0, 0, 44, 1, 44000, 100, 44, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(247, 0, 0, 0, 0, 0, 0, 0, 45, 1, 45000, 100, 45, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(248, 0, 0, 0, 0, 0, 0, 0, 46, 1, 46000, 100, 46, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(249, 0, 0, 0, 0, 0, 0, 0, 47, 1, 47000, 100, 47, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(250, 0, 0, 0, 0, 0, 0, 0, 48, 1, 48000, 100, 48, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(251, 0, 0, 0, 0, 0, 0, 0, 49, 1, 49000, 100, 49, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(252, 0, 0, 0, 0, 0, 0, 0, 50, 1, 50000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iidesign', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(253, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(254, 0, 0, 0, 0, 0, 0, 0, 2, 1, 2000, 100, 2, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(255, 0, 0, 0, 0, 0, 0, 0, 3, 1, 3000, 100, 3, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(256, 0, 0, 0, 0, 0, 0, 0, 4, 1, 4000, 100, 4, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(257, 0, 0, 0, 0, 0, 0, 0, 5, 1, 5000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(258, 0, 0, 0, 0, 0, 0, 0, 6, 1, 6000, 100, 6, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(259, 0, 0, 0, 0, 0, 0, 0, 7, 1, 7000, 100, 7, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(260, 0, 0, 0, 0, 0, 0, 0, 8, 1, 8000, 100, 8, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(261, 0, 0, 0, 0, 0, 0, 0, 9, 1, 9000, 100, 9, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(262, 0, 0, 0, 0, 0, 0, 0, 10, 1, 10000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(263, 0, 0, 0, 0, 0, 0, 0, 11, 1, 11000, 100, 11, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(264, 0, 0, 0, 0, 0, 0, 0, 12, 1, 12000, 100, 12, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(265, 0, 0, 0, 0, 0, 0, 0, 13, 1, 13000, 100, 13, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(266, 0, 0, 0, 0, 0, 0, 0, 14, 1, 14000, 100, 14, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(267, 0, 0, 0, 0, 0, 0, 0, 15, 1, 15000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(268, 0, 0, 0, 0, 0, 0, 0, 16, 1, 16000, 100, 16, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(269, 0, 0, 0, 0, 0, 0, 0, 17, 1, 17000, 100, 17, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(270, 0, 0, 0, 0, 0, 0, 0, 18, 1, 18000, 100, 18, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(271, 0, 0, 0, 0, 0, 0, 0, 19, 1, 19000, 100, 19, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(272, 0, 0, 0, 0, 0, 0, 0, 20, 1, 20000, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(273, 0, 0, 0, 0, 0, 0, 0, 21, 1, 21000, 100, 21, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(274, 0, 0, 0, 0, 0, 0, 0, 22, 1, 22000, 100, 22, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(275, 0, 0, 0, 0, 0, 0, 0, 23, 1, 23000, 100, 23, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(276, 0, 0, 0, 0, 0, 0, 0, 24, 1, 24000, 100, 24, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(277, 0, 0, 0, 0, 0, 0, 0, 25, 1, 25000, 100, 25, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(278, 0, 0, 0, 0, 0, 0, 0, 26, 1, 26000, 100, 26, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(279, 0, 0, 0, 0, 0, 0, 0, 27, 1, 27000, 100, 27, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(280, 0, 0, 0, 0, 0, 0, 0, 28, 1, 28000, 100, 28, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(281, 0, 0, 0, 0, 0, 0, 0, 29, 1, 29000, 100, 29, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(282, 0, 0, 0, 0, 0, 0, 0, 30, 1, 30000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(283, 0, 0, 0, 0, 0, 0, 0, 31, 1, 31000, 100, 31, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(284, 0, 0, 0, 0, 0, 0, 0, 32, 1, 32000, 100, 32, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(285, 0, 0, 0, 0, 0, 0, 0, 33, 1, 33000, 100, 33, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(286, 0, 0, 0, 0, 0, 0, 0, 34, 1, 34000, 100, 34, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(287, 0, 0, 0, 0, 0, 0, 0, 35, 1, 35000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(288, 0, 0, 0, 0, 0, 0, 0, 36, 1, 36000, 100, 36, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(289, 0, 0, 0, 0, 0, 0, 0, 37, 1, 37000, 100, 37, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(290, 0, 0, 0, 0, 0, 0, 0, 38, 1, 38000, 100, 38, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(291, 0, 0, 0, 0, 0, 0, 0, 39, 1, 39000, 100, 39, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(292, 0, 0, 0, 0, 0, 0, 0, 40, 1, 40000, 100, 40, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(293, 0, 0, 0, 0, 0, 0, 0, 41, 1, 41000, 100, 41, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(294, 0, 0, 0, 0, 0, 0, 0, 42, 1, 42000, 100, 42, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(295, 0, 0, 0, 0, 0, 0, 0, 43, 1, 43000, 100, 43, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(296, 0, 0, 0, 0, 0, 0, 0, 44, 1, 44000, 100, 44, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(297, 0, 0, 0, 0, 0, 0, 0, 45, 1, 45000, 100, 45, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(298, 0, 0, 0, 0, 0, 0, 0, 46, 1, 46000, 100, 46, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(299, 0, 0, 0, 0, 0, 0, 0, 47, 1, 47000, 100, 47, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(300, 0, 0, 0, 0, 0, 0, 0, 48, 1, 48000, 100, 48, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(301, 0, 0, 0, 0, 0, 0, 0, 49, 1, 49000, 100, 49, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(302, 0, 0, 0, 0, 0, 0, 0, 50, 1, 50000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iidesign', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(303, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(304, 0, 0, 0, 0, 0, 0, 0, 2, 1, 2000, 100, 2, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(305, 0, 0, 0, 0, 0, 0, 0, 3, 1, 3000, 100, 3, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(306, 0, 0, 0, 0, 0, 0, 0, 4, 1, 4000, 100, 4, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(307, 0, 0, 0, 0, 0, 0, 0, 5, 1, 5000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(308, 0, 0, 0, 0, 0, 0, 0, 6, 1, 6000, 100, 6, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(309, 0, 0, 0, 0, 0, 0, 0, 7, 1, 7000, 100, 7, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(310, 0, 0, 0, 0, 0, 0, 0, 8, 1, 8000, 100, 8, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(311, 0, 0, 0, 0, 0, 0, 0, 9, 1, 9000, 100, 9, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(312, 0, 0, 0, 0, 0, 0, 0, 10, 1, 10000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(313, 0, 0, 0, 0, 0, 0, 0, 11, 1, 11000, 100, 11, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(314, 0, 0, 0, 0, 0, 0, 0, 12, 1, 12000, 100, 12, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(315, 0, 0, 0, 0, 0, 0, 0, 13, 1, 13000, 100, 13, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(316, 0, 0, 0, 0, 0, 0, 0, 14, 1, 14000, 100, 14, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(317, 0, 0, 0, 0, 0, 0, 0, 15, 1, 15000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(318, 0, 0, 0, 0, 0, 0, 0, 16, 1, 16000, 100, 16, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(319, 0, 0, 0, 0, 0, 0, 0, 17, 1, 17000, 100, 17, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(320, 0, 0, 0, 0, 0, 0, 0, 18, 1, 18000, 100, 18, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(321, 0, 0, 0, 0, 0, 0, 0, 19, 1, 19000, 100, 19, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(322, 0, 0, 0, 0, 0, 0, 0, 20, 1, 20000, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(323, 0, 0, 0, 0, 0, 0, 0, 21, 1, 21000, 100, 21, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(324, 0, 0, 0, 0, 0, 0, 0, 22, 1, 22000, 100, 22, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(325, 0, 0, 0, 0, 0, 0, 0, 23, 1, 23000, 100, 23, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(326, 0, 0, 0, 0, 0, 0, 0, 24, 1, 24000, 100, 24, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(327, 0, 0, 0, 0, 0, 0, 0, 25, 1, 25000, 100, 25, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(328, 0, 0, 0, 0, 0, 0, 0, 26, 1, 26000, 100, 26, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(329, 0, 0, 0, 0, 0, 0, 0, 27, 1, 27000, 100, 27, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(330, 0, 0, 0, 0, 0, 0, 0, 28, 1, 28000, 100, 28, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(331, 0, 0, 0, 0, 0, 0, 0, 29, 1, 29000, 100, 29, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(332, 0, 0, 0, 0, 0, 0, 0, 30, 1, 30000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(333, 0, 0, 0, 0, 0, 0, 0, 31, 1, 31000, 100, 31, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(334, 0, 0, 0, 0, 0, 0, 0, 32, 1, 32000, 100, 32, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(335, 0, 0, 0, 0, 0, 0, 0, 33, 1, 33000, 100, 33, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(336, 0, 0, 0, 0, 0, 0, 0, 34, 1, 34000, 100, 34, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(337, 0, 0, 0, 0, 0, 0, 0, 35, 1, 35000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(338, 0, 0, 0, 0, 0, 0, 0, 36, 1, 36000, 100, 36, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(339, 0, 0, 0, 0, 0, 0, 0, 37, 1, 37000, 100, 37, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(340, 0, 0, 0, 0, 0, 0, 0, 38, 1, 38000, 100, 38, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(341, 0, 0, 0, 0, 0, 0, 0, 39, 1, 39000, 100, 39, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(342, 0, 0, 0, 0, 0, 0, 0, 40, 1, 40000, 100, 40, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(343, 0, 0, 0, 0, 0, 0, 0, 41, 1, 41000, 100, 41, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(344, 0, 0, 0, 0, 0, 0, 0, 42, 1, 42000, 100, 42, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0);
INSERT INTO `meh_items` (`id`, `Coins`, `Diamonds`, `Staff`, `House`, `Temp`, `Upg`, `ClassID`, `EnhID`, `FactionID`, `Cost`, `DPS`, `Lvl`, `Qty`, `QtyRemain`, `ReqClass`, `ReqCP`, `ReqRep`, `ReqItems`, `ReqFItems`, `Rty`, `Stk`, `Desc`, `Elmt`, `ES`, `Type`, `File`, `Icon`, `Link`, `Name`, `SkillID`, `PTR`, `ProcID`, `ReqQuests`, `QSindex`, `Meta`, `QSvalue`, `Rng`, `EnhPatternID`, `Class`, `Faction`, `bForgeRecipe`, `ForgeProduct`) VALUES
(345, 0, 0, 0, 0, 0, 0, 0, 43, 1, 43000, 100, 43, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(346, 0, 0, 0, 0, 0, 0, 0, 44, 1, 44000, 100, 44, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(347, 0, 0, 0, 0, 0, 0, 0, 45, 1, 45000, 100, 45, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(348, 0, 0, 0, 0, 0, 0, 0, 46, 1, 46000, 100, 46, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(349, 0, 0, 0, 0, 0, 0, 0, 47, 1, 47000, 100, 47, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(350, 0, 0, 0, 0, 0, 0, 0, 48, 1, 48000, 100, 48, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(351, 0, 0, 0, 0, 0, 0, 0, 49, 1, 49000, 100, 49, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(352, 0, 0, 0, 0, 0, 0, 0, 50, 1, 50000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(353, 0, 0, 0, 0, 0, 0, 0, 45, 1, 75000, 100, 35, 1, 0, -1, 0, 0, '', '', 30, 1, 'Nulgath says,"Perhaps a more low key occupation is more your style. Lightly armored, Blood Voids are a hunter breed in my army. They hide in the shadows and stalk their prey, attacking the enemy where they least expect it. They are unscrupulous but very skilled assassins of my legion."', 'Dark', 'co', 'Armor', 'MiltonPool3Blackr2.swf', 'iwarmor', 'MiltonPool3Black', 'Dark Blood of Nulgath', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(354, 0, 0, 0, 0, 0, 0, 0, 45, 1, 100000, 100, 45, 1, 0, -1, 0, 0, '', '', 100, 1, 'Cannot be sold until Monday, December 9th, 2014. On that day, it will give 10% more class points when equipped.', 'Dark', 'co', 'Armor', 'VampEvoDageCC.swf', 'iwarmor', 'VampEvoDageCC', 'Evolved Legion Vampire', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(355, 0, 0, 0, 0, 0, 0, 0, 45, 1, 70000, 100, 45, 1, 0, -1, 0, 0, '', '', 100, 1, 'Legion Vampires have the coolest hair. Your functionally fashionable ''do will make jealous onlookers curl up and dye. Gives 5% more XP when equipped.', 'None', 'he', 'Helm', 'items/helms/VampEvoDageHelmCC.swf', 'iihelm', 'VampEvoDageHelmCC', 'Evolved Legion Vampire Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(356, 0, 0, 0, 0, 0, 0, 0, 45, 1, 95000, 100, 45, 1, 0, -1, 0, 0, '', '', 100, 1, 'Legion Vampires are unlike any other. Brutal, remorseless, and cruel, Vampires brandish this monumental scythe as a fair warning to anyone foolish enough to cross their path.  Gives 5% more XP when equipped.', 'Dark', 'Weapon', 'Polearm', 'items/polearms/VampEvoDageScytheCC.swf', 'iwpolearm', 'VampEvoDageScytheCC', 'Evolved Legion Vampire Scythe', 0, 0, -1, '', -1, 'undefined', 0, 25, 1, 0, 0, 0, 0),
(357, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Have you enjoyed all the power that''s been given to you?', 'Dark', 'co', 'Armor', 'Cyberg.swf', 'iwarmor', 'Cyberg', 'Cyberg Rider', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(358, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1500, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Made entirely of digital code, these minions have escaped from the cyberworld to do the bidding of their cyberfiend master.', 'Dark', 'co', 'Armor', 'MiltonPool4CyberGreen4.swf', 'iwarmor', 'MiltonPool4Cyber', 'CyberFiend', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(359, 0, 0, 0, 0, 0, 0, 0, 1, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'They haven''t built a circuit that could hold you!', 'None', 'co', 'Armor', 'CybergBike.swf', 'iwarmor', 'CybergBiker_r1', 'Techtronic Biker', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(360, 0, 0, 0, 0, 0, 0, 0, 15, 1, 50000, 100, 15, 1, 0, -1, 0, 0, '', '', 30, 1, 'Have you enjoyed all the power that''s been given to you?', 'Dark', 'co', 'Armor', 'Cyberg.swf', 'iwarmor', 'Cyberg', 'Cyberg Rider', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(361, 0, 0, 0, 0, 0, 0, 0, 20, 1, 150000, 100, 20, 1, 0, -1, 0, 0, '', '', 30, 1, 'Made entirely of digital code, these minions have escaped from the cyberworld to do the bidding of their cyberfiend master.', 'Dark', 'co', 'Armor', 'MiltonPool4CyberGreen4.swf', 'iwarmor', 'MiltonPool4Cyber', 'CyberFiend', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(362, 0, 0, 0, 0, 0, 0, 0, 15, 1, 15000, 100, 15, 1, 0, -1, 0, 0, '', '', 30, 1, 'For when you need to get brutal.', 'None', 'ba', 'Cape', 'items/capes/CybergCape.swf', 'iicape', 'CybergCape', 'Cyberg Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(363, 0, 0, 0, 0, 0, 0, 0, 15, 1, 10000, 100, 15, 1, 0, -1, 0, 0, '', '', 30, 1, 'You will not be erased.', 'None', 'he', 'Helm', 'items/helms/CybergBikeHelmet.swf', 'iihelm', 'CybergBikeHelmet', 'Techtronic Bike Helmet', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(364, 0, 0, 0, 0, 0, 0, 0, 15, 1, 10000, 100, 15, 1, 0, -1, 0, 0, '', '', 30, 1, 'You will not be erased.', 'None', 'he', 'Helm', 'items/helms/CybergHelmet.swf', 'iihelm', 'CybergHelmet', 'Cyberg Helmet', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(365, 0, 0, 0, 0, 0, 0, 0, 40, 1, 500000, 100, 40, 1, 0, -1, 0, 0, '', '', 30, 1, 'This sword is so bright, I gotta wear shades. Gives 5% more class points when equipped.', 'Light', 'Weapon', 'Sword', 'items/swords/WarriorMiltonPoolCyber.swf', 'iwsword', 'WarriorMiltonPoolCyber', 'LEDragonFire Blade', 0, 0, -1, '', -1, 'undefined', 0, 50, 1, 0, 0, 0, 0),
(366, 1, 0, 0, 0, 0, 0, 0, 5, 1, 500, 100, 5, 1, 0, -1, 0, 0, '', '', 30, 1, 'This sword is so bright, I gotta wear shades.', 'Light', 'Weapon', 'Sword', 'items/swords/WarriorMiltonPool2Cyber.swf', 'iwsword', 'WarriorMiltonPool2Cyber', 'LEDragonblade', 0, 0, -1, '', -1, 'undefined', 0, 50, 1, 0, 0, 0, 0),
(367, 0, 0, 0, 0, 0, 0, 0, 15, 1, 20000, 100, 15, 1, 0, -1, 0, 0, '', '', 30, 1, 'To use this weapon it''s all in the wrists.', 'Light', 'Weapon', 'Sword', 'items/swords/CybergSword.swf', 'iwsword', 'CybergSword', 'Cyberg Sword', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(369, 0, 0, 0, 0, 0, 0, 0, 15, 1, 25000, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'These are the robes of Rayst, the master of Arcangrove Tower. Much like the Robes of the Arcane in design but only magi of the highest order are allowed to wear them.', 'Light', 'co', 'Armor', 'Rayst_skin.swf', 'iwarmor', 'Rayst', 'Robes of Rayst', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(370, 0, 0, 0, 0, 0, 0, 0, 35, 1, 50000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'Only the highest ranking magi of Arcangrove have the honor of adorning themselves in fully color customizable wizard robes. You possess so many magical attributes that you seemingly float across the terrain.', 'Light', 'co', 'Armor', 'WizardCC.swf', 'iwarmor', 'WizardCC', 'Prismatic Magi Robes', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(371, 0, 0, 0, 0, 0, 0, 0, 15, 1, 22000, 100, 15, 1, 0, -1, 0, 0, '', '', 11, 1, 'Bigger IS better. An ancient tribal axe that takes more than just brute strength to wield.', 'Dark', 'Weapon', 'Axe', 'items/axes/Tribalaxe01.swf', 'iwaxe', 'Tribalaxe01', 'Mystic Tribal Axe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(372, 0, 0, 0, 0, 0, 1, 0, 40, 1, 150000, 100, 40, 1, 0, -1, 0, 0, '', '', 35, 1, 'Corrupted by its own might, this ancient relic has begun to rip itself apart. Despite its unimaginable age, intensely vivid energy can still be seen flowing within.', 'Dark', 'Weapon', 'Axe', 'items/axes/OrnateDarkBattleAxe.swf', 'iwaxe', 'OrnateDarkBattleAxe', 'Cataclysmic Gilead Axe', 0, 0, -1, '', -1, 'undefined', 0, 20, 1, 0, 0, 0, 0),
(373, 0, 0, 0, 0, 0, 0, 0, 5, 1, 8000, 100, 5, 1, 0, -1, 0, 0, '', '', 13, 1, 'Druids are as wise as they are resourceful. This large piece of hide once belonged to a fallen charroupted beast.', 'None', 'ba', 'Cape', 'items/capes/ChaosFurCloak.swf', 'iicape', 'ChaosFurCloak', 'Chaos Fur Cloak', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(374, 0, 0, 0, 0, 0, 0, 0, 10, 12, 16000, 100, 10, 1, 0, -1, 0, 0, '', '', 11, 1, 'An ancient pair of daggers inscribed with versatility and agility runes. The creator of such a fine weapon set has been lost with time.', 'Dark', 'Weapon', 'Dagger', 'items/daggers/Tribaldagger01.swf', 'iwdagger', 'Tribaldagger01', 'Mystic Tribal Dagger', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(375, 0, 0, 0, 0, 0, 1, 0, 15, 12, 20000, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'Deep in the swamp, the critters that cling to scythes and spears have some how found their way atop of your head. The path before you is well lit despite its unnatural mutations.', 'None', 'he', 'Helm', 'items/helms/LightBugHelmAdvanced.swf', 'iihelm', 'LightBugHelmAdvanced', 'Light Bug Advanced', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(376, 0, 0, 0, 0, 0, 0, 0, 4, 1, 6000, 100, 4, 1, 0, -1, 0, 0, '', '', 12, 1, 'Black magi hide their faces in the shadows of their Wizard Hats. Your glowing eyes are the trademark of your magical properties.', 'None', 'he', 'Helm', 'items/helms/Blakkhat2.swf', 'iihelm', 'Blakkhat2', 'Blakk''s Hat', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(377, 0, 0, 0, 0, 0, 0, 0, 4, 1, 6000, 100, 4, 1, 0, -1, 0, 0, '', '', 12, 1, 'The Wizard Hat is an undying fashion statement of all magic users.', 'None', 'he', 'Helm', 'items/helms/Blakkhat1.swf', 'iihelm', 'Blakkhat1', 'Wizard Hat', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(378, 0, 0, 0, 0, 0, 0, 0, 35, 1, 30000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'A legendary helm of high-ranking Arcangrove status. This color customizable witch hat will attune itself to the wearer''s liking, but will sometimes trick its owner''s preferred hair color with different hues.', 'None', 'he', 'Helm', 'items/helms/WizardHelmCCFemale.swf', 'iihelm', 'WizardHelmCCFemale', 'Prismatic Witch Hat', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(379, 0, 0, 0, 0, 0, 0, 0, 35, 1, 30000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'A legendary helm of high-ranking Arcangrove status. This color customizable wizard hat will attune itself to the wearer''s liking.', 'None', 'he', 'Helm', 'items/helms/WizardHelmCC.swf', 'iihelm', 'WizardHelmCC', 'Prismatic Wizard Hat', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(380, 0, 0, 0, 0, 0, 0, 0, 30, 1, 25000, 100, 30, 1, 0, -1, 0, 0, '', '', 13, 1, 'An experimental weapon created at the peak of Gilead technology. Its unique design allows for a perfect flow and channeling of pure magic energies.', 'Light', 'Weapon', 'Polearm', 'items/polearms/MagicScythe.swf', 'iwpolearm', 'MagicScythe', 'Empyrean Scythe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(381, 0, 0, 0, 0, 0, 0, 0, 3, 1, 6000, 100, 3, 1, 0, -1, 0, 0, '', '', 13, 1, 'One of the most sought-after items for a mage, the mana scepter is a good weapon that also constantly regenerates mana. The question stands: Why does an item need mana? The scepter doesn''t cast spells.... you do.', 'Nature', 'Weapon', 'Staff', 'items/staves/ManaScepter.swf', 'iwstaff', 'ManaScepter', 'Mana Scepter', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(382, 0, 0, 0, 0, 0, 0, 0, 22, 1, 25000, 100, 22, 1, 0, -1, 0, 0, '', '', 13, 1, 'According to the lore of Arcangrove, there was once a race of exceptional weaponsmiths who harvested lost souls to enchant their weapons. This dark magic enables the weapon to have a soul of its own.', 'Dark', 'Weapon', 'Sword', 'items/swords/MythicalBlackIron.swf', 'iwsword', 'MythicalBlackIron', 'Mythical Black Iron', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(383, 0, 0, 0, 0, 0, 0, 0, 12, 1, 16000, 100, 12, 1, 0, -1, 0, 0, '', '', 11, 1, 'An ancient, unreadable hex has been inscribed into the sword''s blade. The tufts of fur about the hilt magically attune with your Accessory Color.', 'Dark', 'Weapon', 'Sword', 'items/swords/Tribalsword01.swf', 'iwsword', 'Tribalsword01', 'Mystic Tribal Sword', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(384, 0, 0, 0, 0, 0, 0, 0, 8, 1, 7500, 100, 8, 1, 0, -1, 0, 0, '', '', 13, 1, 'An ancient weapon cherished by the Druids for its versatility and beauty. Branches from The Cloister fuse the blade to its timbered hilt.', 'Nature', 'Weapon', 'Sword', 'items/swords/SimplePlantBlade.swf', 'iwsword', 'SimplePlantBlade', 'Cypress Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(385, 0, 0, 0, 0, 0, 0, 0, 15, 1, 30000, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'The skull of an ancient unknown beast is attached at the hilt, magically attuning itself to its master''s Accessory Color. Only the wisest magi of Arcangrove have ever been seen wielding such power.', 'Dark', 'Weapon', 'Sword', 'items/swords/AncientSkullBlade.swf', 'iwsword', 'AncientSkullBlade', 'Ancient Skull Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(386, 0, 0, 0, 0, 0, 1, 0, 20, 1, 25000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'Magi who have excelled in the way of the Arcane seek to broaden their combative intellect. Only those who have mastered Magic can call themselves Battle Magi.', 'Light', 'co', 'Armor', 'MiltonPoolMage_skin.swf', 'iwarmor', 'MiltonPoolMage', 'Arcane Battle Armor', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(387, 0, 0, 0, 0, 0, 0, 0, 5, 1, 6000, 100, 5, 1, 0, -1, 0, 0, '', '', 13, 1, 'Thriving off the impressive power of nature, this staff is not only a symbol of purity, but Arcangrove itself.', 'Ice', 'Weapon', 'Staff', 'items/staves/CrystalStaff.swf', 'iwstaff', 'CrystalStaff', 'Crystalline Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(388, 0, 0, 0, 0, 0, 0, 0, 5, 1, 6000, 100, 5, 1, 0, -1, 0, 0, '', '', 11, 1, 'Exceptional amounts of mana radiate off this staff, allowing its 3 crystal shards to hover around the color-custom rune.', 'Nature', 'Weapon', 'Staff', 'items/staves/RedManaStaff.swf', 'iwstaff', 'RedManaStaff', 'Crimson Mana Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(389, 0, 0, 0, 0, 0, 1, 0, 10, 1, 6000, 100, 10, 1, 0, -1, 0, 0, '', '', 13, 1, 'An ancient rune radiates within this fabled staff. Only the most noble magi have ever come across such power.', 'Nature', 'Weapon', 'Staff', 'items/staves/ManaCircleStaff.swf', 'iwstaff', 'ManaCircleStaff', 'Mana Circle Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(390, 0, 0, 0, 0, 0, 0, 0, 10, 1, 6000, 100, 10, 1, 0, -1, 0, 0, '', '', 13, 1, 'Forged from pure Amethyst, the Mana Trident has offered aid to the most ancient magi of Arcangrove. Bestowing this staff is an honor.', 'Nature', 'Weapon', 'Staff', 'items/staves/ManaTridentStaff.swf', 'iwstaff', 'ManaTridentStaff', 'Mana Trident', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(391, 0, 0, 0, 0, 0, 0, 0, 25, 1, 29000, 100, 25, 1, 0, -1, 0, 0, '', '', 13, 1, 'Discovered in Arcangrove after a monstrous lightning storm passed the land, this runed blade holds a tremendous amount of electrifying energy.', 'Light', 'Weapon', 'Sword', 'items/swords/PlasmaShard.swf', 'iwsword', 'PlasmaShard', 'Plasma Shard', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(392, 0, 0, 0, 0, 0, 0, 0, 15, 1, 17000, 100, 15, 1, 0, -1, 0, 0, '', '', 11, 1, 'Known for its agility and purity, the Renowned Arcane Claymore was crafted to defend the Good of all magic. Mysterious runes veil the blade from opposing forces.', 'Light', 'Weapon', 'Sword', 'items/swords/RenownedArcaneClaymore.swf', 'iwsword', 'RenownedArcaneClaymore', 'Renowned Arcane Claymore', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(393, 0, 0, 0, 0, 0, 0, 0, 35, 1, 45000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'Just as gold is precious, so will this helm be to your safekeeping and life.  The Golden Dragoon, powerful and mighty, bestows his blessing on the man or woman who wears it.', 'None', 'he', 'Helm', 'items/helms/GoldendragoonHelm.swf', 'iihelm', 'GoldendragoonHelm', 'Golden Dragoon Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(394, 0, 0, 0, 0, 0, 0, 0, 35, 1, 55000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'Once you grip this polearm, the sheer adrenaline and rush of power that comes with it will set your heart beating and your feet moving towards battle.', 'Nature', 'Weapon', 'Polearm', 'items/polearms/UltraDragoonLance.swf', 'iwpolearm', 'UltraDragoonLance', 'Ultra Dragoon Lance', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(395, 0, 0, 0, 0, 0, 0, 0, 5, 1, 5000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'Whispers follow the arc of every attack, every cut of the sword.  These whispers are carried on the winds of the four corners of the world, bringing to the wielder the secrets of defeating the enemy.', 'Light', 'Weapon', 'Sword', 'items/swords/WindDragonsword01.swf', 'iwsword', 'WindDragonsword01', 'Whisper of the Conquerer', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(396, 0, 0, 0, 0, 0, 0, 0, 35, 1, 120000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'Power. Glory. Finesse.  All words that describe the incredible Golden Dragoon armor.  The legacy that this armor bears is almost too much for any day-to-day Hero to take upon his or her shoulders.', 'Light', 'co', 'Armor', 'GoldenDragoon.swf', 'iwarmor', 'GoldenDragoon', 'Golden Dragoon', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(397, 0, 0, 0, 0, 0, 0, 0, 5, 1, 10000, 100, 5, 1, 0, -1, 0, 0, '', '', 13, 1, 'Rugged strength just pours forth from this armor.  Anyone wearing it will feel the confidence of the greatest warrior permeate his or her body, readying them for combat.', 'Nature', 'co', 'Armor', 'Dragarian2.swf', 'iwarmor', 'Dragarian', 'Dragarian', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(398, 0, 0, 0, 0, 0, 0, 0, 5, 1, 6000, 100, 5, 1, 0, -1, 0, 0, '', '', 13, 1, 'This look speaks of power and ruggedness.  Allow yourself to be taken away from reality and placed where you are the king and everyone around can only just sit and watch helplessly.  Intimidate now!', 'None', 'he', 'Helm', 'items/helms/DragarianHair.swf', 'iihelm', 'DragarianHair', 'Dragarian Hair', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(399, 0, 0, 0, 0, 0, 0, 0, 10, 1, 7000, 100, 10, 1, 0, -1, 0, 0, '', '', 13, 1, 'It seems as if this sword was created as an example of poetry in motion.  The intricate patterns glow from within the hard steel of the blade and the razor-sharp edges call for blood, coalescing to create the perfect sword.', 'Nature', 'Weapon', 'Sword', 'items/swords/DragarianBlade.swf', 'iwsword', 'DragarianBlade', 'Dragarian Blade', 0, 0, -1, '', -1, 'undefined', 0, 30, 0, 0, 0, 0, 0),
(400, 0, 0, 0, 0, 0, 0, 0, 5, 1, 15000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'Guided by ethereal flames of doom, this sword harnesses the power of the flame that is in all of us.  Once yours is ignited, no enemy will be able to escape your white hot anger.', 'Fire', 'Weapon', 'Sword', 'items/swords/FireDragonsword01.swf', 'iwsword', 'FireDragonsword01', 'Wings of Flame', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(401, 0, 0, 0, 0, 0, 0, 0, 20, 1, 40000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'Modeled after samples obtained from the Lore of DragonFable, the Shadow Mages conjure shadows and use them to vanquish their enemies.', 'Dark', 'co', 'Armor', 'DFShadowMage.swf', 'iwarmor', 'DFShadowMage', 'Shadow Mage', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(402, 0, 0, 0, 0, 0, 0, 0, 9, 1, 15000, 100, 9, 1, 0, -1, 0, 0, '', '', 13, 1, 'A recreation of an epic energy scythe sold at Light''s Sabers NG Shop in the Lore of MechQuest''s timeline.', 'Light', 'Weapon', 'Polearm', 'items/polearms/EnergyReaperScythe.swf', 'iwpolearm', 'EnergyReaperScythe', 'Energy Reaper Scythe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(403, 0, 0, 0, 0, 0, 0, 0, 15, 1, 23500, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'Deep under Falconreach in the DragonFable timeline, the ChaosWeavers raged. Those who felt pity or empathy for them took their side in the war for Ravenloss. This scythe was awarded to those who battled so valiantly for those who needed aid.', 'Dark', 'Weapon', 'Polearm', 'items/polearms/ChaosWDefenderVen.swf', 'iwpolearm', 'ChaosWDefenderVen', 'ChaosWeaver Defender', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(404, 0, 0, 0, 0, 0, 0, 0, 15, 1, 34200, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'Why someone would want to create this deadly and massive polearm dropped by Absolix the Uncreated from the Lore of AdventureQuest is truly a mystery...', 'Dark', 'Weapon', 'Polearm', 'items/polearms/AbsolixPolearm.swf', 'iwpolearm', 'AbsolixPolearm', 'Absolix Polearm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(405, 0, 0, 0, 0, 0, 0, 0, 20, 1, 20000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'Threads that have been recreated from samples obtained from the Lore of AdventureQuest. Once worn by Sage Uldor, a blind swindler, whose tactics and treachery is infamous throughout the Lore of AQ. Let the blind lead the blind.', 'None', 'he', 'Helm', 'items/helms/SageUldarEyewrap.swf', 'iihelm', 'SageUldarEyewrap', 'Sage Eyewrap', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(406, 0, 0, 0, 0, 0, 0, 0, 45, 1, 175000, 100, 45, 1, 0, -1, 0, 0, '', '', 13, 1, 'The Reign Helm was crafted by the ancients of Alnaphar. Recreated from a sample obtained in the Lore of AdventureQuest''s timeline, you might feel like you quested after this helm in a dream you once had.', 'None', 'he', 'Helm', 'items/helms/ReignSetHelm.swf', 'iihelm', 'ReignSetHelm', 'Reign Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(407, 0, 0, 0, 0, 0, 0, 0, 45, 1, 200000, 100, 45, 1, 0, -1, 0, 0, '', '', 13, 1, 'The Reign Plate was crafted by the ancients of Alnaphar. Recreated from a sample obtained in the Lore of AdventureQuest''s timeline, you might feel like you quested after this helm in a dream you once had.', 'Fire', 'co', 'Armor', 'ReignSet.swf', 'iwarmor', 'ReignSet', 'Reign Plate', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(408, 0, 0, 0, 0, 0, 0, 0, 20, 1, 40000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'Modeled after samples obtained from the Lore of DragonFable, these rouges move swiftly through the shadows, stalking their foes.', 'Dark', 'co', 'Armor', 'DFShadowRouge.swf', 'iwarmor', 'DFShadowRouge', 'Shadow Rogue', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(409, 0, 0, 0, 0, 0, 0, 0, 20, 1, 40000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'Modeled after samples obtained from the Lore of DragonFable, these warriors move through the shadows, leaping from on battle to another.', 'Dark', 'co', 'Armor', 'DFShadowWarrior.swf', 'iwarmor', 'DFShadowWarrior', 'Shadow Warrior', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(410, 0, 0, 0, 0, 0, 0, 0, 20, 1, 28000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'Threads that have recreated from samples obtained from the Lore of AdventureQuest. A color customizable robe, this outfit was once worn by Sage Uldor, a wise old man who knows more than he lets on. If you ask nicely, he might tell you some of it.', 'Nature', 'co', 'Armor', 'SageUldar.swf', 'iwarmor', 'SageUldar', 'Sage Armor', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(411, 0, 0, 0, 0, 0, 0, 0, 15, 1, 17000, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'Modeled after samples of a blade, obtained from the Lore of AdventureQuest, this vicious and powerful mace was wielded by Nemesis and was designed to lacerate flesh from bone!', 'Dark', 'Weapon', 'Sword', 'items/swords/NemesisBladeMad.swf', 'iwsword', 'NemesisBladeMad', 'Nemesis Blade', 0, 0, -1, '', -1, 'undefined', 0, 30, 1, 0, 0, 0, 0),
(412, 0, 0, 0, 0, 0, 0, 0, 25, 1, 200000, 100, 25, 1, 0, -1, 0, 0, '', '', 55, 1, 'The spirit of the Horseman of War possesses your body and lends you his power.', 'Dark', 'co', 'Armor', 'WarHorseHumanarmor.swf', 'iwarmor', 'WarHorseHumanarmor', 'Spirit of War', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(413, 1, 0, 0, 0, 0, 0, 0, 30, 1, 600, 100, 30, 1, 0, -1, 0, 0, '', '', 55, 1, 'The spirit of the Horseman of Famine has possessed you. This means we are all blaming you for the fruit snack shortage.', 'Dark', 'co', 'Armor', 'FamineArmor1.swf', 'iwarmor', 'FamineArmor1', 'Spirit of Famine', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(414, 0, 0, 0, 0, 0, 0, 0, 40, 1, 175000, 100, 40, 1, 0, -1, 0, 0, '', '', 55, 1, 'The spirit of the Horseman of Conquest has possessed your body and lent you his strength and power.', 'Light', 'co', 'Armor', 'ConquestArmor.swf', 'iwarmor', 'ConquestArmor', 'Spirit of Conquest', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(415, 0, 0, 0, 0, 0, 0, 0, 20, 1, 150000, 100, 20, 1, 0, -1, 0, 0, '', '', 30, 1, 'Dark Legion Guards can never leave their post.  Ever.', 'Dark', 'co', 'Armor', 'LegionGuard.swf', 'iwarmor', 'LegionGuard', 'Dark Legion Guard', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(416, 0, 0, 0, 0, 0, 0, 0, 35, 1, 155000, 100, 35, 1, 0, -1, 0, 0, '', '', 55, 1, 'The spirit of the Horseman of Death has possessed your body. Ride in on your pale horse and extinguish the life from everything you pass.', 'Dark', 'co', 'Armor', 'PaleHorseArmor.swf', 'iwarmor', 'PaleHorseArmor', 'Spirit of Death', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(417, 0, 0, 0, 0, 0, 0, 0, 15, 1, 25000, 100, 15, 1, 0, -1, 0, 0, '', '', 55, 1, 'Even DoomKnights swear their service to, or are made to serve Dage. Their soul’s have been claimed by both Dage and Doom. (Has a chance to do the Shadowburst animation when equipped)', 'Dark', 'co', 'Armor', 'LegionDoomKnightr3.swf', 'iwarmor', 'LegionDoomKnight', 'Legion DoomKnight', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(418, 0, 0, 0, 0, 0, 1, 0, 50, 1, 245000, 100, 50, 1, 0, -1, 0, 0, '', '', 55, 1, 'Celebrate Dage''s birthday with this insane Dark Caster armor!', 'Dark', 'co', 'Armor', 'DarkCaster2015.swf', 'iwarmor', 'DarkCaster2015', 'Ultimate Dark Caster', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(419, 0, 0, 0, 0, 0, 1, 0, 45, 1, 260000, 100, 45, 1, 0, -1, 0, 0, '', '', 30, 1, 'Celebrate Dage''s birthday with this insane Dark Caster armor!', 'Dark', 'co', 'Armor', 'DarkDarkCaster2015_r1.swf', 'iwarmor', 'DarkDarkCaster2015', 'Shadowed Dark Caster', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(420, 0, 0, 0, 0, 0, 0, 0, 40, 1, 155000, 100, 40, 1, 0, -1, 0, 0, '', '', 55, 1, 'Glowing with the white heat of underworld flame... which is often mistaken for angelic light.', 'None', 'ba', 'Cape', 'items/capes/ConquestCapeScarf.swf', 'iicape', 'ConquestCapeScarf', 'Conquest''s Embellished Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(421, 0, 0, 0, 0, 0, 0, 0, 30, 1, 145550, 100, 30, 1, 0, -1, 0, 0, '', '', 55, 1, 'Spreads a darkness that causes any food it comes near to spoil and rot.', 'None', 'ba', 'Cape', 'items/capes/HangingFamineCape1.swf', 'iicape', 'HangingFamineCape1', 'Famine''s Flames', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(422, 0, 0, 0, 0, 0, 0, 0, 35, 1, 15000, 100, 35, 1, 0, -1, 0, 0, '', '', 30, 1, 'A shroud of souls surrounds you. Death himself would be proud.', 'None', 'ba', 'Cape', 'items/capes/LegionThanatosFlameCape.swf', 'iicape', 'LegionThanatosFlameCape', 'Flames of Thanatos', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(423, 0, 0, 0, 0, 0, 0, 0, 1, 1, 140000, 100, 1, 1, 0, -1, 0, 0, '', '', 55, 1, 'Even DoomKnights swear their service to, or are made to serve Dage. Their souls have been claimed by both Dage and Doom.', 'Dark', 'ar', 'Class', 'LegionDoomKnightr3.swf', 'iiclass', 'LegionDoomKnight', 'Legion DoomKnight', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(424, 0, 0, 0, 0, 0, 0, 0, 40, 1, 45000, 100, 40, 1, 0, -1, 0, 0, '', '', 55, 1, 'The white heat of this bow makes it unwieldable by anyone but the spirit of Conquest... or those he possesses.', 'Light', 'Weapon', 'Dagger', 'items/daggers/ConquestAccoutrements.swf', 'iwdagger', 'ConquestAccoutrements', 'Conquest Accoutrements', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(425, 0, 0, 0, 0, 0, 0, 0, 15, 1, 25000, 100, 15, 1, 0, -1, 0, 0, '', '', 30, 1, 'Not sure why skeletons need helmets, it''s not like there''s a brain to protect.', 'None', 'he', 'Helm', 'items/helms/LegionBlacksmithHelm1.swf', 'iihelm', 'LegionBlacksmithHelm1', 'Legion Blacksmith Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(426, 0, 0, 0, 0, 0, 0, 0, 20, 1, 15000, 100, 20, 1, 0, -1, 0, 0, '', '', 30, 1, 'Not sure why skeletons need helmets, it''s not like there''s a brain to protect.', 'None', 'he', 'Helm', 'items/helms/LegionBlacksmithHelm2.swf', 'iihelm', 'LegionBlacksmithHelm2', 'Legion Blacksmith Visor', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(427, 1, 0, 0, 0, 0, 0, 0, 50, 1, 250, 100, 50, 1, 0, -1, 0, 0, '', '', 55, 1, 'As you ascend deep into darkness, giant horns sprout from your head as you harness the unsurpassed power of the DarkCaster!', 'None', 'he', 'Helm', 'items/helms/DarkCaster2015BlackoutM.swf', 'iihelm', 'DarkCaster2015BlackoutM', 'Mystic Dark Caster Spikes', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(428, 0, 0, 0, 0, 0, 1, 0, 45, 1, 170000, 100, 45, 1, 0, -1, 0, 0, '', '', 30, 1, 'As you ascend deep into darkness, giant horns sprout from your head as you harness the unsurpassed power of the DarkCaster!', 'None', 'he', 'Helm', 'items/helms/DarkDarkCasterHelm.swf', 'iihelm', 'DarkDarkCasterHelm', 'Hidden Dark Caster Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(429, 1, 0, 0, 0, 0, 0, 0, 50, 1, 250, 100, 50, 1, 0, -1, 0, 0, '', '', 55, 1, 'As you ascend deep into darkness, giant horns sprout from your head as you harness the unsurpassed power of the DarkCaster!', 'None', 'he', 'Helm', 'items/helms/DarkCaster2015BlackoutF.swf', 'iihelm', 'DarkCaster2015BlackoutF', 'Mystica Dark Caster Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(430, 0, 0, 0, 0, 0, 1, 0, 45, 1, 225000, 100, 45, 1, 0, -1, 0, 0, '', '', 30, 1, 'As you ascend deep into darkness, giant horns sprout from your head as you harness the unsurpassed power of the DarkCaster!', 'None', 'he', 'Helm', 'items/helms/DarkDarkCaster2015BlackoutF.swf', 'iihelm', 'DarkDarkCaster2015BlackoutF', 'Hidden Dark Caster Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(431, 0, 0, 0, 0, 0, 0, 0, 40, 1, 135000, 100, 40, 1, 0, -1, 0, 0, '', '', 55, 1, 'The angelic, yet menacing, hood of the Horseman of Conquest.', 'None', 'he', 'Helm', 'items/helms/ConquestHoodCrownHalor1.swf', 'iihelm', 'ConquestHoodCrownHalo', 'Conquest''s Haloed Crown', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(432, 0, 0, 0, 0, 0, 0, 0, 35, 1, 85000, 100, 35, 1, 0, -1, 0, 0, '', '', 55, 1, 'But why would you want to hide that handsome face?', 'None', 'he', 'Helm', 'items/helms/UndeadGildedSkull2.swf', 'iihelm', 'UndeadGildedSkull', 'Death''s Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(433, 0, 0, 0, 0, 0, 0, 0, 25, 1, 50000, 100, 25, 1, 0, -1, 0, 0, '', '', 55, 1, 'Solid steel, the color of blood and magma.', 'None', 'he', 'Helm', 'items/helms/WarHorseHelm.swf', 'iihelm', 'WarHorseHelm', 'War''s Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(434, 0, 0, 0, 0, 0, 1, 0, 15, 1, 225000, 100, 15, 1, 0, -1, 0, 0, '', '', 55, 1, 'You only serve the one true Dark Lord, Dage. (Has a chance to do the Shadowburst animation when equipped)', 'None', 'he', 'Helm', 'items/helms/LegionDoomKnightHelm.swf', 'iihelm', 'LegionDoomKnightHelm', 'Legion DoomKnight Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(435, 1, 0, 0, 0, 0, 0, 0, 45, 1, 1500, 100, 45, 1, 0, -1, 0, 0, '', '', 30, 1, 'The Thanatos Paragon Pet has ventured to the underworld, faced death, and returned to tell about it. If you accept his quests, you can do the same... and unlock the Evolved Thanatos armor set!', 'None', 'pe', 'Pet', 'items/pets/DTEMini2015r1.swf', 'iipet', 'DTEMini2015', 'Thanatos Paragon Pet', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(436, 0, 0, 0, 0, 0, 0, 0, 35, 1, 55250, 100, 35, 1, 0, -1, 0, 0, '', '', 55, 1, 'Made entirely of bone and ectoplasm, who else could this terrifying weapon belong to?', 'Dark', 'Weapon', 'Polearm', 'items/polearms/DeathScythe1.swf', 'iwpolearm', 'DeathScythe', 'Death''s Scythe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(437, 0, 0, 0, 0, 0, 0, 0, 30, 1, 65000, 100, 30, 1, 0, -1, 0, 0, '', '', 55, 1, 'The icy-hot blade of the horseman of Famine.', 'Ice', 'Weapon', 'Sword', 'items/swords/FamineBladev2.swf', 'iwsword', 'FamineBladev2', 'Famine''s Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(438, 0, 0, 0, 0, 0, 0, 0, 25, 1, 40000, 100, 25, 1, 0, -1, 0, 0, '', '', 55, 1, 'Made of blood-red steel and magma, this blade cuts through its enemies like butter. Really hot butter.', 'Fire', 'Weapon', 'Sword', 'items/swords/WarHorseFireBlade.swf', 'iwsword', 'WarHorseFireBlade', 'FireBlade of War', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(440, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 5, 1, 0, -1, 0, 0, '', '', 100, 1, 'The scythe of an almighty druid, passed away centuries ago. His spirit remains held in the blade.', 'None', 'Weapon', 'Polearm', 'items/polearms/RavagedDruidsScythe.swf', 'iwpolearm', 'RavagedDruidsScythe', 'Ravaged Druid''s Scythe', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(441, 0, 0, 0, 0, 0, 0, 0, 1, 1, 40000, 100, 30, 1, 0, -1, 0, 0, '', '', 55, 1, 'The dragon''s blessed us with this masterfully made blade.', 'None', 'Weapon', 'Sword', 'items/swords/GildedSerpentsPride.swf', 'iwsword', 'GildedSerpentsPride', 'Gilded Serpent''s Pride', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(442, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 100, 1, 'The essence of doom and destruction are fused in this blade.', 'None', 'Weapon', 'Sword', 'items/swords/HametsuKatana1.swf', 'iwsword', 'HametsuKatana', 'Hametsu Katana', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(443, 0, 0, 0, 0, 0, 1, 0, 20, 1, 70000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Not quite a lich but that doesn''t mean you won''t jump at the chance to command an army of the undead.', 'Dark', 'co', 'Armor', 'DragonruneNecro_r1.swf', 'iwarmor', 'DragonruneNecro', 'Necro Battlemage', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(444, 0, 0, 0, 0, 0, 0, 0, 15, 1, 60000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The elements are yours to manipulate and control.  You weave them together and against one another.', 'Nature', 'co', 'Armor', 'DragonruneElemental.swf', 'iwarmor', 'DragonruneElemental', 'Elemental Battlemage', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(445, 0, 0, 0, 0, 0, 1, 0, 20, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Made from actual dragon scales, these head pieces are bestowed on those who come to DragonRune to learn.', 'None', 'he', 'Helm', 'items/helms/DRHelmNecroF.swf', 'iihelm', 'DRHelmNecroF', 'Necro Battlemage Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(446, 0, 0, 0, 0, 0, 1, 0, 20, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Made from actual dragon scales, these head pieces are bestowed on those who come to DragonRune to learn.', 'None', 'he', 'Helm', 'items/helms/DRHelmNecroM.swf', 'iihelm', 'DRHelmNecroM', 'Necro Battlemage Diadem', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(447, 0, 0, 0, 0, 0, 0, 0, 15, 1, 17500, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Made from actual dragon scales, these head pieces are bestowed on those who come to DragonRune to learn.', 'None', 'he', 'Helm', 'items/helms/DRHelmElemF.swf', 'iihelm', 'DRHelmElemF', 'Elemental Battlemage Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(448, 0, 0, 0, 0, 0, 0, 0, 15, 1, 17500, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Made from actual dragon scales, these head pieces are bestowed on those who come to DragonRune to learn.', 'None', 'he', 'Helm', 'items/helms/DRHelmElemM.swf', 'iihelm', 'DRHelmElemM', 'Elemental Battlemage Diadem', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(449, 0, 0, 0, 0, 0, 1, 0, 20, 1, 17500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Ten points for showing your pride learning under Mueran in Necromancy at DragonRune.', 'None', 'ba', 'Cape', 'items/capes/DRRuneWingsNecro.swf', 'iicape', 'DRRuneWingsNecro', 'House Necromancer Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(450, 0, 0, 0, 0, 0, 0, 0, 15, 1, 17500, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Ten points for showing your pride learning under Warlic in Elemental Mastery at DragonRune.', 'None', 'ba', 'Cape', 'items/capes/DRRuneWingsElem.swf', 'iicape', 'DRRuneWingsElem', 'House Elemental Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(451, 0, 0, 0, 0, 0, 0, 0, 15, 1, 40000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Don''t be fooled by the simple nature of this staff, it will fuse together elements faster than saying "abracadabra".', 'Dark', 'Weapon', 'Staff', 'items/staves/DRStaffElem.swf', 'iwstaff', 'DRStaffElem', 'Orb Staff of Elements', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(452, 0, 0, 0, 0, 0, 1, 0, 20, 1, 350000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Well, now that you''ve summoned the undead you need a way to herd them!', 'Dark', 'Weapon', 'Staff', 'items/staves/DRStaffNecro.swf', 'iwstaff', 'DRStaffNecro', 'Orb Staff of Necromancy', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(453, 0, 0, 0, 0, 0, 0, 0, 30, 1, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Is this armor made from the magic dripping out of Cysero''s personal sock stash? Yes, yes it is. EW.', 'Nature', 'co', 'Armor', 'GreenManaPlaner.swf', 'iwarmor', 'GreenManaPlaner', 'Mad Magic Manawalker', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(454, 0, 0, 0, 0, 0, 0, 0, 30, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Is this helm made from the magic dripping out of Cysero''s personal sock stash? Yes, yes it is. EW.', 'None', 'he', 'Helm', 'items/helms/GreenManaHelm.swf', 'iihelm', 'GreenManaHelm', 'Mad Magic Mana Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(455, 0, 0, 0, 0, 0, 0, 0, 30, 1, 85000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'To find the socks, you must first unravel many nefarious plots. Use the Green Sockatana to convince your foe to tell you where the socks are hidden.', 'Dark', 'Weapon', 'Sword', 'items/swords/WisemanKatana.swf', 'iwsword', 'WisemanKatana', 'Green Sockatana', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(456, 0, 0, 0, 0, 0, 0, 0, 10, 1, 105000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Cysero made an armor out of schnozzberry yogurt. This does not look safe, but on the plus side, if a monster eats you, you''ll be EXTRA delicious!', 'Nature', 'co', 'Armor', 'YOGURT.swf', 'iwarmor', 'YOGURT', 'Living Yogurt Warrior', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(457, 0, 0, 0, 0, 0, 0, 0, 10, 1, 55000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, '...', 'None', 'he', 'Helm', 'items/helms/YOGURT.swf', 'iihelm', 'Yogurt', 'Berry Tasty Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(458, 0, 0, 0, 0, 0, 0, 0, 40, 1, 90000, 100, 1, 1, 0, -1, 0, 0, '', '', 55, 1, 'Even DoomKnights swear their service to, or are made to serve Dage. Their soul’s have been claimed by both Dage and Doom. (Has a chance to do the Shadowburst animation when equipped)', 'Dark', 'co', 'Armor', 'LegionDoomKnightr3.swf', 'iwarmor', 'LegionDoomKnight', 'Legion DoomKnight', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(459, 0, 0, 0, 0, 0, 0, 0, 40, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 55, 1, 'You only serve the one true Dark Lord, Dage. (Has a chance to do the Shadowburst animation when equipped)', 'None', 'he', 'Helm', 'items/helms/LegionDoomKnightHelm.swf', 'iihelm', 'LegionDoomKnightHelm', 'Legion DoomKnight Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(461, 0, 0, 0, 0, 0, 0, 0, 40, 1, 17500, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'A shroud of souls surrounds you. Death himself would be proud.', 'None', 'ba', 'Cape', 'items/capes/LegionThanatosFlameCape.swf', 'iicape', 'LegionThanatosFlameCape', 'Flames of Thanatos', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(462, 0, 0, 0, 0, 0, 0, 0, 35, 1, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'There can only be one Laken, but he may have TWO different states. This is the Evil version of the Laken the Good NPC.', 'Dark', 'co', 'Armor', 'LakenTheEvil.swf', 'iwarmor', 'LakenTheEvil', 'Laken the Evil', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(463, 0, 0, 0, 0, 0, 0, 0, 35, 1, 32500, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'It''s nice to have a good hair day when you''re no longer evil. (Hair is not color customizable.)', 'None', 'he', 'Helm', 'items/helms/LakenTheGoodHelm.swf', 'iihelm', 'LakenTheGoodHelm', 'Laken The Good Hair', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(465, 0, 0, 0, 0, 0, 0, 0, 40, 1, 90000, 100, 1, 1, 0, -1, 0, 0, '', '', 55, 1, 'Even DoomKnights swear their service to, or are made to serve Dage. Their soul’s have been claimed by both Dage and Doom. (Has a chance to do the Shadowburst animation when equipped)', 'Dark', 'co', 'Armor', 'LegionDoomKnightr3.swf', 'iwarmor', 'LegionDoomKnight', 'Legion DoomKnight', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(466, 0, 0, 0, 0, 0, 0, 0, 40, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 55, 1, 'You only serve the one true Dark Lord, Dage. (Has a chance to do the Shadowburst animation when equipped)', 'None', 'he', 'Helm', 'items/helms/LegionDoomKnightHelm.swf', 'iihelm', 'LegionDoomKnightHelm', 'Legion DoomKnight Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(467, 0, 0, 0, 0, 0, 0, 0, 40, 1, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 55, 1, 'Even Sepulchure would be envious of this DoomBlade. (Has a chance to do the Shadowburst animation when equipped)', 'Dark', 'Weapon', 'Sword', 'items/swords/LegionSepulchureBlade_r1.swf', 'iwsword', 'LegionSepulchureBlade', 'Legion DoomBlade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(468, 0, 0, 0, 0, 0, 0, 0, 40, 1, 17500, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'A shroud of souls surrounds you. Death himself would be proud.', 'None', 'ba', 'Cape', 'items/capes/LegionThanatosFlameCape.swf', 'iicape', 'LegionThanatosFlameCape', 'Flames of Thanatos', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(470, 0, 0, 0, 0, 0, 0, 0, 35, 1, 32500, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'It''s nice to have a good hair day when you''re no longer evil. (Hair is not color customizable.)', 'None', 'he', 'Helm', 'items/helms/LakenTheGoodHelm.swf', 'iihelm', 'LakenTheGoodHelm', 'Laken The Good Hair', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(471, 0, 0, 0, 0, 0, 0, 0, 35, 1, 40000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, '', 'Dark', 'Weapon', 'Polearm', 'items/polearms/EvilLanceOfPrevatication.swf', 'iwpolearm', 'EvilLanceOfPrevatication', 'Evil Lance Of Prevarication', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(472, 0, 0, 0, 0, 0, 0, 0, 45, 1, 95000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Dage wasn''t happy with just regular Legion Vampires so he took the next step.', 'None', 'co', 'Armor', '13thVampireLegion.swf', 'iwarmor', '13thVampireLegion', 'Dark Legion Vampire', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(473, 0, 0, 0, 0, 0, 0, 0, 35, 1, 180000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'When Nulgath takes souls the bodies are left to the Necromancer Fiends.  Just what they do with the bodies remains a mystery.', 'Dark', 'co', 'Armor', 'NecromancerFiend_skin.swf', 'iwarmor', 'NecromancerFiend', 'Necromancer Fiend', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(474, 0, 0, 0, 0, 0, 0, 0, 35, 1, 18000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Protection from an unruly Undead.', 'None', 'ba', 'Cape', 'items/capes/NecromancerFiendCape1.swf', 'iicape', 'NecromancerFiendCape1', 'Necromancer Fiend Spikes', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(475, 0, 0, 0, 0, 0, 0, 0, 35, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Embrace your inner beast.', 'None', 'he', 'Helm', 'items/helms/NecromancerFiendHelm2.swf', 'iihelm', 'NecromancerFiendHelm2', 'Necromancer Fiend Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(476, 0, 0, 0, 0, 0, 0, 0, 45, 1, 47500, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Nothing says dark and foreboding like a skull.', 'None', 'he', 'Helm', 'items/helms/13thVampireLegionHelm.swf', 'iihelm', '13thVampireLegionHelm', 'Dark Legion Vampire Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(477, 0, 0, 0, 0, 0, 0, 0, 35, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Embrace your inner beast.', 'None', 'he', 'Helm', 'items/helms/NecromancerFiendHelm1.swf', 'iihelm', 'NecromancerFiendHelm1', 'Necromancer Fiend Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(478, 0, 0, 0, 0, 0, 0, 0, 45, 1, 70000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, '', 'Dark', 'Weapon', 'Polearm', 'items/polearms/DarkLegionScythe.swf', 'iwpolearm', 'DarkLegionScythe', 'Vampire''s Spineripper', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(479, 0, 0, 0, 0, 0, 1, 0, 35, 1, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Nothing screams "Come at me, bro" better than this.', 'Dark', 'Weapon', 'Staff', 'items/staves/NecromancerFiendStaff1.swf', 'iwstaff', 'NecromancerFiendStaff1', 'Necromancer Fiend Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(480, 0, 0, 0, 0, 0, 0, 0, 35, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'The orb is actually an eye but from what?', 'Dark', 'Weapon', 'Staff', 'items/staves/NecromancerFiendStaff2.swf', 'iwstaff', 'NecromancerFiendStaff2', 'Necromancer Fiend Orb', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(481, 0, 0, 0, 0, 0, 0, 0, 25, 1, 80000, 100, 25, 1, 0, -1, 0, 0, '', '', 10, 1, 'Emoxus forged and molded the pieces of Lord Miltonius''s Warlord armor to create this sorcerer-esque garb. Suggested to Emoxus by Senshi.', 'Dark', 'co', 'Armor', 'WarlordEmissary2.swf', 'iwarmor', 'WarlordEmissary', 'Warlord Emissary', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(482, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'co', 'Armor', 'CrimsonLegion.swf', 'iwarmor', '5FishNaval', 'Crimson Legion', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(483, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 55, 1, '', 'None', 'Weapon', 'Dagger', 'items/daggers/CrimsonTonguePistols.swf', 'iwdagger', 'CrimsonTonguePistols', 'Crimson Tongue Pistols', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(484, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Forged on a distant planet, this particular Star Sword model is capable of crushing entire planets with single blows, if used correctly.', 'None', 'Weapon', 'Sword', 'items/swords/BlueStarBusterSword1.swf', 'iwsword', 'StarBusterSword', 'Blue Star-Buster Sword', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(485, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Forged on a distant planet, this particular Star Sword model is capable of crushing entire planets with single blows, if used correctly.', 'None', 'Weapon', 'Sword', 'items/swords/RedStarBusterSword1.swf', 'iwsword', 'RedStarBusterSword', 'Red Star-Buster Sword', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(486, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, 'The bagged ashes of a flame elemental.', 'Fire', 'None', 'Item', '', 'iibag', '', 'Fiery Ashes', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(487, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The soul of the Black Knight.', 'Darkness', 'None', 'Item', '', 'soul', '', 'Black Knight''s Soul', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(488, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'co', 'Armor', 'DDarkArtsScolar.swf', 'iwarmor', 'DDarkArtsScolar', 'Doom Arts Scholar', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(489, 0, 0, 0, 0, 0, 0, 0, 15, 1, 10000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'Sami forged this blade, putting his hear and soul into it''s iron and emeral.', 'Dark', 'Weapon', 'Sword', 'items/swords/GreenSamiSword.swf', 'iwsword', 'GreenSamiSword', 'Za Gurin Sword', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(490, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Testing Caluses', 'None', 'None', 'None', 'None', 'None', 'None', 'Just a test Insert', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0);
INSERT INTO `meh_items` (`id`, `Coins`, `Diamonds`, `Staff`, `House`, `Temp`, `Upg`, `ClassID`, `EnhID`, `FactionID`, `Cost`, `DPS`, `Lvl`, `Qty`, `QtyRemain`, `ReqClass`, `ReqCP`, `ReqRep`, `ReqItems`, `ReqFItems`, `Rty`, `Stk`, `Desc`, `Elmt`, `ES`, `Type`, `File`, `Icon`, `Link`, `Name`, `SkillID`, `PTR`, `ProcID`, `ReqQuests`, `QSindex`, `Meta`, `QSvalue`, `Rng`, `EnhPatternID`, `Class`, `Faction`, `bForgeRecipe`, `ForgeProduct`) VALUES
(491, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Second Item Test', 'None', 'None', 'None', 'None', 'None', 'None', 'Testing Values Again', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(492, 0, 0, 0, 0, 0, 0, 0, 40, 1, 70000, 100, 1, 1, 0, -1, 0, 0, '', '', 20, 1, 'Well crafted, hand tailored and embroidered.', 'None', 'ba', 'Cape', 'items/capes/LordBrentonsCape.swf', 'iicape', 'LordBrentonsCape', 'Lord Brentan''s Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(493, 0, 0, 0, 0, 0, 0, 0, 40, 1, 115000, 100, 1, 1, 0, -1, 0, 0, '', '', 20, 1, 'The armor of noble Lord Brenton.', 'Light', 'co', 'Armor', 'LordBrenton.swf', 'iwarmor', 'LordBrenton', 'Lord Brentan (Armor)', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(494, 0, 0, 0, 0, 0, 0, 0, 40, 1, 80000, 100, 1, 1, 0, -1, 0, 0, '', '', 20, 1, 'Lord Brentan''s own helm, crafted long ago by one of the loyal smithing families owing fealty to the Brentons.', 'None', 'he', 'Helm', 'items/helms/LordBrentonsHelm.swf ', 'iihelm', 'LordBrentonsHelm', 'Lord Brentan''s Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(495, 0, 0, 0, 0, 0, 0, 0, 40, 1, 95000, 100, 1, 1, 0, -1, 0, 0, '', '', 20, 1, 'This sword has been handed down from one noble member of the Brentan family to their heir of years. It carries the honor of generations.', 'Light', 'Weapon', 'Sword', 'items/swords/LordBrentonsGlory.swf', 'iwsword', 'LordBrentonsGlory', 'Lord Brentan''s Glory', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(496, 0, 0, 0, 0, 0, 0, 0, 40, 1, 80000, 100, 1, 1, 0, -1, 0, 0, '', '', 20, 1, 'This is the shroud of the MindBreaker. Once you perfected your art it was given to you by the Council of Espers. Into it are sewn runes to amplify your mental gifts.', 'None', 'ba', 'Cape', 'items/capes/MindBreakerCape.swf', 'iicape', 'MindBreakerCape', 'MindBreaker''s Cloak', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(497, 0, 0, 0, 0, 0, 0, 0, 40, 1, 125000, 100, 1, 1, 0, -1, 0, 0, '', '', 20, 1, 'You have spent years training your body to be a fighting machine but you have ALSO honed your psychic abilities to work in unision with your weapons to create the ultimate psionic warrior! Thanks for your Membership support and enjoy your AdventureCoins!', 'Light', 'co', 'Armor', 'MindBreaker2.swf', 'iwarmor', 'MindBreaker', 'MindBreaker', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(498, 0, 0, 0, 0, 0, 0, 0, 40, 1, 90000, 100, 1, 1, 0, -1, 0, 0, '', '', 20, 1, 'This helm is especially crafted for you and attuned to your mind''s own frequency. It serves to help focus your psionic attacks while protecting you from outside psychic interference.', 'None', 'he', 'Helm', 'items/helms/MindBreakerHelm.swf', 'iihelm', 'MindBreakerHelm', 'MindBreaker Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(499, 0, 0, 0, 0, 0, 0, 0, 40, 1, 105000, 100, 1, 1, 0, -1, 0, 0, '', '', 20, 1, 'This weapon is a psionic construct. You have focused your psychic powers into the hard reality of a razor edged sword.', 'Light', 'Weapon', 'Sword', 'items/swords/MindBreakerSword.swf', 'iwsword', 'MindBreakerSword', 'MindBreaker''s Psy-blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(500, 0, 0, 0, 0, 0, 0, 0, 25, 1, 5000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'These roaming Priests of Etherstorm are attuned to the land and the Dragons, helping those in need. These priests draw strength from Fire.', 'None', 'co', 'Armor', 'RubyDragonhealerWanderer.swf', 'iwarmor', 'DragonPriest2', 'Ruby Dragonhealer Wanderer', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(501, 0, 0, 0, 0, 0, 0, 0, 25, 1, 5000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'These roaming Priests of Etherstorm are attuned to the land and the Dragons, helping those in need. These priests draw strength from Water.', 'Water', 'co', 'Armor', 'CeruleanDragonhealersWanderer.swf', 'iwarmor', 'DragonPriestBlue2', 'Cerulean Dragonhealer''s Wanderer', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(502, 0, 0, 0, 0, 0, 1, 0, 25, 1, 15000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Healers of Etherstorm are one with the Dragons and the elements.  These healers draw their power from Water.', 'Water', 'co', 'Armor', 'CeruleanDragonpriestRobes.swf', 'iwarmor', 'DragonPriestBlue', 'Cerulean Dragonpriest Robes', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(503, 0, 0, 0, 0, 0, 1, 0, 25, 1, 15000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Healers of Etherstorm are one with the Dragons and the elements.  These healers draw their power from Fire.', 'Fire', 'co', 'Armor', 'RubyDragonhealersRobes.swf', 'iwarmor', 'DragonHealer', 'Ruby Dragonhealer''s Robes', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(504, 0, 0, 0, 0, 0, 0, 0, 45, 1, 500000, 100, 45, 1, 0, -1, 0, 0, '', '', 13, 1, 'Ever since The Archangel Nulgath was sucked into an alternate dimension trying to seal the rift, Dage The Good has been the undisputed champion for all things good and noble in the Mirror Realm.', 'Light', 'co', 'Armor', 'DageTheGoodArmor.swf', 'iwarmor', 'DageTheGoodArmor', 'Dage The Good''s Armor', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(505, 0, 0, 0, 0, 0, 0, 0, 45, 0, 15000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The noble blue of Dage''s cloak, embroidered with the purest golden thread, reminds people of the nobility of their protector''s cause.', 'None', 'ba', 'Cape', 'items/capes/DageTheGoodArmorCape1.swf', 'iicape', 'DageTheGoodArmorCape', 'Dage The Good''s Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(506, 0, 0, 0, 0, 0, 0, 0, 45, 1, 1500000, 100, 45, 1, 0, -1, 0, 0, '', '', 13, 1, 'Wielding the Mirror Caladbolg, you will be able to cut your enemies off at the knees and bury them under the hills!', 'Light', 'Weapon', 'Sword', 'items/swords/MirrorCaladbolg.swf', 'iwsword', 'MirrorCaladbolg', 'Mirror Caladbolg', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(507, 0, 0, 0, 0, 0, 0, 0, 15, 0, 5000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A Knight of Sorcery ', 'Light', 'co', 'Armor', 'MageKnight.swf', 'iwarmor', 'MageKnight', 'Mage Knight', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(508, 0, 0, 0, 0, 0, 0, 0, 35, 1, 5000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Wear this armor with pride! Gilt entirely in gold and embellished with gemeralds, Maximillian''s armor is everything except cowardly.', 'Light', 'co', 'Armor', 'Maxmillian_skin.swf', 'iwarmor', 'Maximillian', 'Maximillan''s Armor', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(509, 0, 0, 0, 0, 0, 0, 0, 45, 1, 5000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Leading his Living Legion into the battle for so many years has made Dage a lot of enemies. The helm protects his face but also his identity for those who would harm him and those he cares about.', 'None', 'he', 'Helm', 'items/helms/DageTheGoodArmorHelm.swf', 'iihelm', 'DageTheGoodArmorHelm', 'Dage The Good''s Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(510, 0, 0, 0, 0, 0, 0, 0, 30, 1, 750, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'With a swing of my axe you will hear my thunderous roar!', 'Light', 'Weapon', 'Axe', 'items/axes/GoldenSetAxe.swf', 'iwaxe', 'GoldenSetAxe', 'Golden Axe', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(511, 0, 0, 0, 0, 0, 0, 0, 30, 1, 750, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Forged from the gold acquired in battles and journeys, only those who don this armor decide to show off their wealth on their gauntlets.', 'Light', 'co', 'Armor', 'GoldenPlate.swf', 'iwarmor', 'GoldenPlate', 'Golden Plate', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(512, 0, 0, 0, 0, 0, 0, 0, 30, 1, 750, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A robe and sword are all I need to bring this empire to its knees!', 'None', 'ba', 'Cape', 'items/capes/GoldenSetCape.swf', 'iicape', 'GoldenSetCape', 'Golden Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(513, 0, 0, 0, 0, 0, 0, 0, 30, 1, 750, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Only fit for a king, this golden helm shows your nation that you posses the cunning skills that are needed to rule the land and battlefield.', 'None', 'he', 'Helm', 'items/helms/GoldenSetHelm1.swf', 'iihelm', 'GoldenSetHelm1', 'Golden Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(514, 0, 0, 0, 0, 0, 0, 0, 1, 1, 750, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Goku''s Hair.', 'None', 'he', 'Helm', 'items/helms/OrakleGokuR1.swf', 'iihelm', 'LimHair', 'Goku', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(515, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This sword was forged at top of Mount Olympus! With the lightning and thunder of Zeus himself bestowed upon the sword!', 'None', 'Weapon', 'Sword', 'items/swords/BladeOfZeusE2.swf', 'iwsword', 'BladeOfZeus', 'Blade of Zeus', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(516, 0, 0, 0, 0, 0, 0, 0, 15, 1, 105000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Firestorm Knights! Ready your breakfast and eat hearty… For tonight, we dine at Yulgars!', 'Fire', 'co', 'Armor', 'TyndareousArmorLesser.swf', 'iwarmor', 'TyndareousArmorLesser', 'Fire Storm Knight', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(517, 0, 0, 0, 0, 0, 0, 0, 25, 1, 120000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'What''s the mana with you?', 'Fire', 'co', 'Armor', 'ManaPhoenixArmor.swf', 'iwarmor', 'ManaPhoenixArmor', 'Phoenix Arcanist', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(518, 0, 0, 0, 0, 0, 0, 0, 20, 1, 135000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Firestorm Knights! Ready your breakfast and eat hearty… For tonight, we dine at Yulgars!', 'Fire', 'co', 'Armor', 'TyndareousArmorGold3.swf', 'iwarmor', 'TyndareousArmorGold', 'Golden Firestorm Knight', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(519, 0, 0, 0, 0, 0, 0, 0, 25, 1, 120000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Ashes to ashes, we all fall down.', 'Fire', 'co', 'Armor', 'AshenPhoenixArmor.swf', 'iwarmor', 'AshenPhoenixArmor', 'Burnt Phoenix Rising', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(520, 0, 0, 0, 0, 0, 0, 0, 15, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Broad swipes make quick fights. The Brightsteel Onslaught enjoys a quick battle.', 'Light', 'Weapon', 'Sword', 'items/swords/TyndareousSword.swf', 'iwsword', 'TyndareousSword', 'Heavy Brightsteel Sword', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(521, 0, 0, 0, 0, 0, 0, 0, 15, 1, 40000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A shield so shiny you can fix your hair in it.', 'Light', 'Weapon', 'Dagger', 'items/daggers/TyndareousShieldSword.swf', 'iwsword', 'TyndareousShieldSword', 'BrightSteel Blade and Shield', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(522, 0, 0, 0, 0, 0, 0, 0, 15, 1, 60000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Spear in one hand, sword in the other. No need for a shield when you only in attack mode.', 'Light', 'Weapon', 'Dagger', 'items/daggers/TyndareousSpearSword.swf', 'iwpolearm', 'TyndareousSpearSword', 'BrightSteel Conquest Accoutrements', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(523, 0, 0, 0, 0, 0, 0, 0, 15, 1, 60000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Attack from long range and defend when they get too close.', 'Light', 'Weapon', 'Dagger', 'items/daggers/TyndareousShieldSpear.swf', 'iwpolearm', 'TyndareousShieldSpear', 'BrightSteel Spear and Shield', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(524, 0, 0, 0, 0, 0, 0, 0, 15, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Broad swipes make quick fights. The Brightsteel Onslaught enjoys a quick battle.', 'Light', 'Weapon', 'Dagger', 'items/daggers/TyndareousDaggers.swf', 'iwdagger', 'TyndareousDaggers', 'Brightsteel Daggers', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(525, 0, 0, 0, 0, 0, 0, 0, 20, 1, 37500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Broad swipes make quick fights. The Firestorm Onslaught enjoys a quick battle.', 'Light', 'Weapon', 'Sword', 'items/swords/FirestormSword.swf', 'iwsword', 'FirestormSword', 'Gilded Blade of the Onslaught', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(526, 0, 0, 0, 0, 0, 0, 0, 20, 1, 40000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, ' Broad swipes make quick fights. The Firestorn Onslaught enjoys a quick battle.', 'Light', 'Weapon', 'Dagger', 'items/swords/FirestormSword.swf', 'iwdagger', 'FirestormSword', 'Gilded Blades of the Onslaught', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(527, 0, 0, 0, 0, 0, 0, 0, 20, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Attack from long range and defend when they get too close', 'Light', 'Weapon', 'Dagger', 'items/daggers/FirestormShieldSpear.swf', 'iwdagger', 'FirestormShieldSpear', 'Gilded Onslaught Spear and Shield', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(528, 0, 0, 0, 0, 0, 0, 0, 20, 1, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Spear in one hand, sword in the other. No need for a shield when you only in attack mode.', 'Light', 'Weapon', 'Dagger', 'items/daggers/FirestormSpearSword.swf', 'iwdagger', 'FirestormSpearSword', 'Gilded Sword and Spear', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(529, 0, 0, 0, 0, 0, 0, 0, 20, 1, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A shield so shiny you can fix your hair in it.', 'Light', 'Weapon', 'Dagger', 'items/daggers/FirestormShieldSword.swf', 'iwdagger', 'FirestormShieldSword', 'Golden Blade and Shield', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(530, 0, 0, 0, 0, 0, 0, 0, 15, 1, 47500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Give your enemies a good tip about fighting.', 'Light', 'Weapon', 'Polearm', 'items/polearms/TyndareousSpear.swf', 'iwpolearm', 'TyndareousSpear', 'Brightsteel Halberd', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(531, 0, 0, 0, 0, 0, 0, 0, 25, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Let''s go kick some ash.', 'Light', 'Weapon', 'Staff', 'items/polearms/AshenPhoenixSpear.swf', 'iwstaff', 'AshenPhoenixSpear', 'DarkEdge of Shadows', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(532, 0, 0, 0, 0, 0, 0, 0, 25, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'You really blew it in that last night.', 'Light', 'Weapon', 'Staff', 'items/polearms/ManaPhoenixSpear.swf', 'iwstaff', 'ManaPhoenixSpear', 'Enchanted Edge of the Risen', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(533, 0, 0, 0, 0, 0, 0, 0, 20, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Give your enemies a good tip about fighting.', 'Light', 'Weapon', 'Polearm', 'items/polearms/FirestormSpear.swf', 'iwpolearm', 'FirestormSpear', 'Flaming Golden Deathspear', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(534, 0, 0, 0, 0, 0, 0, 0, 50, 1, 1000000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The moon''s light shines int othe soul of this staff.', 'Light', 'Weapon', 'Staff', 'items/staves/GildedCrescent.swf', 'iwstaff', 'GildedCrescent', 'Gilded Crescent', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(535, 0, 0, 0, 0, 0, 0, 0, 50, 1, 250000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The greatest paladins use this to cast spells upon their enemies!', 'None', 'Weapon', 'Staff', 'items/staves/PaladinsDivinity.swf', 'iwstaff', 'PaladinsDivinity', 'Paladin''s Divinity', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(536, 0, 0, 0, 0, 0, 0, 0, 50, 1, 500000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The greatest paladins use this blade to make blood erupt from their enemies.', 'Light', 'Weapon', 'Sword', 'items/swords/PaladinsGlory.swf', 'iwsword', 'PaladinsGlory', 'Paladin''s Glory', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(537, 0, 0, 0, 0, 0, 0, 0, 5, 1, 10000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic spell used to restore one''s health a little bit.', 'Light', 'spe', 'Spell', '', 'imr2', '', 'Basic Healing', 22, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(538, 0, 0, 0, 0, 0, 0, 0, 10, 1, 50000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic fireball spell, scorch your enemies away!', 'Fire', 'spe', 'Spell', '', 'ief1', '', 'Basic Fireball', 19, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(539, 0, 0, 0, 0, 0, 0, 0, 30, 1, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'It''s said -Time heals all wounds-, wise words for a Cleric.', 'Light', 'co', 'Armor', 'ClericOfTimeBlue.swf', 'iwarmor', 'ClericOfTimeBlue', 'Blue Cleric of Time', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(540, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'The centurions are soldiers from a fabled sunken city. This never before seen armor has been in many battles.', 'Light', 'co', 'Armor', 'Greek1_skin.swf', 'iwarmor', 'Greek1', 'Centurion Armor', 0, 0, -1, '', -1, 'undefined', 0, 104, 0, 0, 0, 0, 0),
(541, 0, 0, 0, 0, 0, 0, 0, 20, 1, 55000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'The centurions are soldiers from a fabled sunken city. Some even say their shields can withstand magical arrows.', 'Light', 'co', 'Armor', 'Greek2_skin.swf', 'iwarmor', 'Greek2', 'Shielded Centurion Armor', 0, 0, -1, '', -1, 'undefined', 0, 104, 0, 0, 0, 0, 0),
(542, 0, 0, 0, 0, 0, 0, 0, 10, 1, 25000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'Get 299 of your closest friends to equip this armor and head to the hot gates. This… is….. ORAKLE!!!!!!', 'Light', 'co', 'Armor', 'spartan1_skin.swf', 'iwarmor', 'Spartan1', 'Spartan Warrior', 0, 0, -1, '', -1, 'undefined', 0, 104, 0, 0, 0, 0, 0),
(543, 0, 0, 0, 0, 0, 0, 0, 15, 1, 45000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'Ideal for parties, formal speeches, or ruling an empire.', 'Light', 'co', 'Armor', 'togaFIX1.swf', 'iwarmor', 'Toga1', 'Toga', 0, 0, -1, '', -1, 'undefined', 0, 104, 0, 0, 0, 0, 0),
(544, 0, 0, 0, 0, 0, 0, 0, 45, 1, 125000, 100, 5, 1, 0, -1, 0, 0, '', '', 10, 1, 'Someone once said that hope was a thing with feathers. In these troubled times, hope would probably do better with some good old-fashioned steel.', 'Light', 'co', 'Armor', 'PlateOfHope.swf', 'iwarmor', 'PlateOfHope', 'Plate of Hope', 0, 0, -1, '', -1, 'undefined', 0, 104, 0, 0, 0, 0, 0),
(545, 0, 0, 0, 0, 0, 0, 0, 25, 1, 9500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These are for furious people.', 'None', 'he', 'Helm', 'items/helms/AshenPhoenixHelmM.swf', 'iihelm', 'AshenPhoenixHelmM', 'Ashen Helm of Fury', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(546, 0, 0, 0, 0, 0, 0, 0, 25, 1, 9500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These are for furious people.', 'None', 'he', 'Helm', 'items/helms/AshenPhoenixHelmF.swf', 'iihelm', 'AshenPhoenixHelmF', 'Ashen Tiara of Fury', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(547, 0, 0, 0, 0, 0, 0, 0, 25, 1, 9500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These are for arcane people.', 'None', 'he', 'Helm', 'items/helms/ManaPhoenixNoCCM.swf', 'iihelm', 'ManaPhoenixNoCCM', 'Arcane Phoenix Crest', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(548, 0, 0, 0, 0, 0, 0, 0, 25, 1, 9500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These are for charred people.', 'None', 'he', 'Helm', 'items/helms/ManaPhoenixNoCCF.swf', 'iihelm', 'ManaPhoenixNoCCF', 'Charred Phoenix Crested', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(549, 0, 0, 0, 0, 0, 0, 0, 15, 1, 19500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Nothing says classy like a golden diadem on your head.', 'None', 'he', 'Helm', 'items/helms/TyndareousHair.swf', 'iihelm', 'TyndareousHair', 'Firestorm Fury Diadem', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(550, 0, 0, 0, 0, 0, 0, 0, 15, 1, 24250, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The bigger your helm the more important you are.', 'None', 'he', 'Helm', 'items/helms/FirestormHelmPlume.swf', 'iihelm', 'FirestormHelmPlume', 'General Plume', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(551, 0, 0, 0, 0, 0, 0, 0, 25, 1, 9500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These are for mystical people.', 'None', 'he', 'Helm', 'items/helms/ManaPhoenixHelmM.swf', 'iihelm', 'ManaPhoenixHelmM', 'Mystical Crest Helm Male', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(552, 0, 0, 0, 0, 0, 0, 0, 25, 1, 9500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These are for mystical people.', 'None', 'he', 'Helm', 'items/helms/ManaPhoenixHelmF.swf', 'iihelm', 'ManaPhoenixHelmF', 'Mystical Crest Helm Female', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(553, 0, 0, 0, 0, 0, 0, 0, 15, 1, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These are for fiery people.', 'None', 'he', 'Helm', 'items/helms/PlumedFirestormVisor.swf', 'iihelm', 'PlumedFirestormVisor', 'Fiery Battle Visor', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(554, 0, 0, 0, 0, 0, 0, 0, 45, 1, 60000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Hope is the thing with feathers that perches in the soul, sings the tune without the words, never stops at all.', 'None', 'he', 'Helm', 'items/helms/TimeWardenHelm.swf', 'iihelm', 'TimeWardenHelm', 'Helm of Hope', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(555, 0, 0, 0, 0, 0, 0, 0, 45, 1, 950000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Every strike doled out with this beast of a weapon chimes like a gong. Ask not for whom the bell tolls.', 'Light', 'Weapon', 'Mace', 'items/maces/HammerOfHope.swf', 'iwmace', 'HammerOfHope', 'Warhammer of Hope', 0, 0, -1, '', -1, 'undefined', 0, 5, 1, 0, 0, 0, 0),
(556, 0, 0, 0, 0, 0, 0, 0, 15, 1, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Forget parties, speeches, and empires. Why not battle?', 'Light', 'Weapon', 'Polearm', 'items/polearms/ZombieKillerSpear1.swf', 'iwpolearm', 'ZombieKillerSpear1', 'Golden Toga Spear', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(557, 0, 0, 0, 0, 0, 0, 0, 20, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Used by the Golden Boy to quest for the Golden Egg with the Golden Compass and Golden Retriever while following the Golden rule.', 'Light', 'Weapon', 'Sword', 'items/swords/centurionsword.swf', 'iwsword', 'centurionsword', 'Golden Centurion Sword', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(558, 0, 0, 0, 0, 0, 0, 0, 30, 1, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A gilded sword for those times when the sword is mightier than the pen!', 'Light', 'Weapon', 'Sword', 'items/swords/clericoftimesword.swf', 'iwsword', 'ClericOfTimeSword', 'Blue Sword of Time', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(559, 0, 0, 0, 0, 0, 0, 0, 15, 1, 15000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Extra blade for emergencies.', 'None', 'ba', 'Cape', 'items/capes/SheathedTyndareousSwordCape.swf', 'iicape', 'SheathedTyndareousSwordCape', 'Battleworn Fireblade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(560, 0, 0, 0, 0, 0, 0, 0, 25, 1, 9500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These wings are for mystical people.', 'None', 'ba', 'Cape', 'items/capes/PhoenixManaWings.swf', 'iicape', 'PhoenixManaWings', 'Mystical Phoenix Feathers', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(561, 0, 0, 0, 0, 0, 0, 0, 25, 1, 9500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These wings are for smoldering people.', 'None', 'ba', 'Cape', 'items/capes/PhoenixSmokyWings.swf', 'iicape', 'PhoenixSmokyWings', 'Smoldering Phoenix Feathers', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(562, 0, 0, 0, 0, 0, 0, 0, 20, 1, 19000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The centurions are soldiers from a fabled sunken city. This cape can withstand magical arrows.', 'None', 'ba', 'Cape', 'items/capes/greekcape.swf', 'iicape', 'Greek1MCape', 'Centurion Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(563, 0, 0, 0, 0, 0, 0, 0, 15, 1, 19000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Radiant toga capes? What are these?', 'None', 'ba', 'Cape', 'items/capes/ZombieKillerCape1a.swf', 'iicape', 'ZombieKillerCape1', 'Radiant Toga Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(564, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, 'You''ve earned the respect of one of the Knights in the Kingdom.', 'None', 'None', 'Item', '', 'iibag', '', 'Kingdom Knight''s Respect', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(565, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, 'A tuft of fur from one of the Tigers in the kingdom... This proves you''re quite daring.', 'None', 'None', 'Item', '', 'iibag', '', 'Tuft of Tiger''s Fur', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(566, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, 'The dust of slain Sprites. This shows you''re very precise... or just plain reckless.', 'None', 'None', 'Item', '', 'iibag', '', 'Sprite Dust', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(568, 0, 0, 0, 0, 0, 0, 5, 15, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 35, 1, 'Terrifyingly large and in charge, this armor will drive the weak from you and bring the true villains to your feet. Take your weapon, Hero, and lay waste to those who stand against you.', 'None', 'ar', 'Class', 'DracoMancer2.swf', 'iibook', 'DracoMancer', 'Elemental Dracomancer', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(569, 1, 0, 0, 0, 0, 0, 0, 1, 1, 200, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'None', 'Item', 'None', 'iibag', 'None', 'Wheel Ticket', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(570, 0, 0, 0, 0, 0, 0, 6, 15, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 35, 1, 'Be the beginning AND the end of ALL your battles in this suit of space armor!', 'None', 'ar', 'Class', 'EDOmega.swf', 'iibook', 'EDOmega', 'Alpha Omega Suit', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(571, 0, 0, 0, 0, 0, 0, 7, 15, 1, 2000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'There is power in blood. Coming from a long line of titans, your blood is especially potent. You have mastered the ability of calling on the power running through your veins to bring devastation to your foes.', 'None', 'ar', 'Class', 'BloodTitan.swf', 'iibook', 'BloodTitan', 'Blood Titan', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(572, 0, 0, 0, 0, 0, 0, 8, 15, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 35, 1, 'You have consumed the essences of many great vampire warlords, and now all of their collective powers are yours. You have become a new kind of vampiric warrior, vampire strength in a living mortal body!', 'None', 'ar', 'Class', 'Vamper.swf', 'iibook', 'Vamper', 'Blood Ancient', 0, 0, -1, '', -1, 'undefined', 0, 104, 1, 0, 0, 0, 0),
(573, 0, 0, 0, 0, 0, 0, 9, 15, 1, 2000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Battlemages focus on taking down their opponents as quickly as possible. They are capable of focusing greater amounts of mana into each spell for the maximum effect. They specialize in wearing heavy armor for defense in order to spend all of their mana on offensive spells.', 'None', 'ar', 'Class', 'SHRv3.swf', 'iibook', 'SHRv2', 'BattleMage', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(574, 0, 0, 0, 0, 0, 0, 10, 15, 1, 2000, 100, 1, 1, 0, -1, 0, 0, '', '', 35, 1, 'The Darkblood have always lived beneath the constant roiling storm that covers Thunderforge. It''s no surprise that they managed to magically harness the full fury and power of the storm.', 'None', 'ar', 'Class', 'DarkBloodStorm.swf', 'iibook', 'DarkBloodStorm', 'Darkblood StormKing', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(575, 0, 0, 0, 0, 0, 0, 11, 15, 1, 2000, 100, 1, 1, 0, -1, 0, 0, '', '', 35, 1, 'Embrace the Darkness that lies within you. Channel it to control the Undead that surround you. The darkest Power can be yours!', 'None', 'ar', 'Class', 'necro2_skin.swf', 'iibook', 'Necro2', 'Necromancer', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(576, 0, 0, 0, 0, 0, 0, 12, 20, 1, 50000, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, 'Paladins are the honest and good protectors of... GOOD and GOODNESS! ', 'None', 'ar', 'Class', 'OraklePaladin.swf', 'iibook', 'OraklePaladin', 'Paladin', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(577, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 100, 1, 'The first blade Emoxus created for his Anax Members... Symbolizing the limitless power they would achieve together, Under his lead.', 'None', 'Weapon', 'Sword', 'items/swords/LoyaltyOfTheAnax.swf', 'iwsword', 'LoyaltyOfTheAnax', 'Loyalty of The Anax', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(578, 0, 0, 0, 0, 0, 0, 13, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 10, 1, 'Dragonlords make aggressive front-line soldiers. They are skilled in an ancient school of enchanted combat arts ranging back from the era of DragonFable. Only those with Dragon Amulets will have the honor of becoming a DragonLord.', 'None', 'ar', 'Class', 'dragonlord3_skin.swf ', 'iibook', 'Dragonlord3', 'DragonLord', 0, 0, -1, '', -1, '-1', 0, 100, 1, 1, 0, 0, 0),
(579, 0, 0, 0, 0, 0, 0, 13, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 10, 1, 'Dragonlords make aggressive front-line soldiers. They are skilled in an ancient school of enchanted combat arts ranging back from the era of DragonFable. Only those with Dragon Amulets will have the honor of becoming a DragonLord.', 'None', 'ar', 'Class', 'dragonlord3_skin.swf ', 'iibook', 'Dragonlord3', 'DragonLord', 0, 0, -1, '', -1, '-1', 0, 100, 1, 1, 0, 0, 0),
(580, 0, 0, 0, 0, 0, 1, 15, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 35, 1, 'Wield the Light to save those trapped by the Darkness! You are an UndeadSlayer, meant to free the souls of those unwillingly trapped by the agents of Evil. Face down your foes, knowing that you have the power of Light, Might, and Right on your side!', 'None', 'ar', 'Class', 'UndeadSlayer.swf', 'iibook', 'UndeadSlayer', 'UndeadSlayer', 0, 0, -1, '', -1, '-1', 0, 10, 1, 0, 0, 0, 0),
(581, 1, 0, 0, 0, 0, 0, 16, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 24, 1, 'You have come to understand that Chaos is a tool that can be used for neither good nor evil. Mastering it could make you powerful beyond imagining... unless you lose yourself in the Chaos.', 'None', 'ar', 'Class', 'ChaosShaper-11Jul11.swf', 'iibook', 'ChaosShaper', 'Chaos Shaper', 0, 0, -1, '', -1, '-1', 0, 10, 1, 0, 0, 0, 0),
(582, 0, 0, 0, 0, 0, 1, 17, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 13, 1, 'Have you been pulled from the cold comfort of death to serve a new master or has your own will pulled you back to the land of the living to continue fighting?', 'None', 'ar', 'Class', 'DeathKnightClass2.swf', 'iibook', 'DeathKnightClass', 'DeathKnight', 0, 0, -1, '', -1, '-1', 0, 10, 1, 0, 0, 0, 0),
(583, 1, 0, 0, 0, 0, 0, 18, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 35, 1, 'A chunin is a ninja field commander. Highly trained to attack from stealth but focusing on strength and power rather than agility and speed. A chunin can and often enjoys taking on multiple enemies at once.', 'None', 'ar', 'Class', 'AOENinjaR1.swf', 'iibook', 'AOENinja', 'Chunin', 0, 0, -1, '', -1, '-1', 0, 10, 0, 0, 0, 0, 0),
(584, 1, 0, 0, 0, 0, 1, 19, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 35, 1, 'Grenadiers are specially trained soldiers chosen for their fearlessness and are often picked to lead special assault teams. They pride themselves on being the first person through the hole they just blew through the wall of an enemy fortress.', 'None', 'ar', 'Class', 'Granade2.swf', 'iibook', 'Granade2', 'SkyGuard Grenadier', 0, 0, -1, '', -1, '-1', 0, 104, 0, 0, 0, 0, 0),
(585, 0, 0, 0, 0, 0, 0, 20, 15, 0, 25000, 100, 15, 1, 1, 0, 0, 0, '', '', 10, 0, 'Through arduous battling and a perilous journey, you defeated the Collector and vindicated They Might Be Giants!', 'None', 'ar', 'Class', 'VOT.swf', 'iibook', 'VOT', 'Vindicator Of They', 0, 0, -1, '', -1, '-1', 0, 100, 1, 0, 0, 0, 0),
(586, 0, 0, 0, 0, 0, 0, 21, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 75, 1, 'You have been chosen to lead the Paladin order into battle. All that is dark will break before you in waves as you shatter the forces of evil with your unique connection to the light!', 'None', 'ar', 'Class', 'PallyOverLord.swf', 'iibook', 'PallyOverLord', 'Paladin High Lord', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(587, 0, 0, 0, 0, 0, 0, 22, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '1121:500', '', 75, 1, 'The darkness has cut right to the center of your being. You are no mere DoomKnight who servers the dark. You are an DoomKnight OverLord and the darkness serves YOU.', 'None', 'ar', 'Class', 'DoomOverLord2.swf', 'iibook', 'DoomOverLord2', 'DoomKnight Overlord', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(588, 0, 0, 0, 0, 0, 0, 23, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 20, 1, 'Rangers are stealthy, wealthy and wise to the ways of their opponents. Able to take down tyrants without blinking an eye or breaking a bowstring, you?ll range far and wide in this armor, gaining gold and glory!', 'None', 'ar', 'Class', 'Ranger.swf', 'iibook', 'Ranger', 'Ranger', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(589, 0, 0, 0, 0, 0, 0, 24, 15, 0, 25000, 100, 15, 1, 0, 0, 0, 0, '', '', 10, 1, '', 'None', 'ar', 'Class', 'ULWishClassArmor.swf', 'iibook', 'ULWishClassArmor', 'Darkside', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(590, 0, 0, 0, 0, 0, 0, 25, 15, 1, 25000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'The Trolls are masters of magics and logic. The SpellSmith has mastered these arts to give them a major advantage in battle. For Trolls magic is not just a weapon but every tool that they need and the SpellSmith has a spell for any situation.', 'None', 'ar', 'Class', 'SpellSmith4.swf', 'iibook', 'SpellSmith', 'Spellsmith', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(591, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The greatest berserker to date. Its body breaking abilities are simply smashing!', 'None', 'co', 'Armor', 'NeoBerserker2.swf', 'iwarmor', 'NeoBerserker2', 'BoneBreaker Berserker', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(592, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The better the battle scars, the more accomplished the warrior.', 'None', 'he', 'Helm', 'items/helms/NeoBerserkerHelmF1.swf', 'iihelm', 'NeoBerserkerHelmF1', 'BoneBreaker Torso and Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(593, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The better the battle scars, the more accomplished the warrior.', 'None', 'he', 'Helm', 'items/helms/NeoBerserkerHelmM1.swf', 'iihelm', 'NeoBerserkerHelmM1', 'BoneBreaker Torso', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(594, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Trips to the dentist must be a nightmare.', 'None', 'he', 'Helm', 'items/helms/NeoBerserkerMawF.swf', 'iihelm', 'NeoBerserkerMawF', 'Maw of Heroine Mashing', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(595, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Trips to the dentist must be a nightmare.', 'None', 'he', 'Helm', 'items/helms/NeoBerserkerMawM.swf', 'iihelm', 'NeoBerserkerMawM', 'Maw of Hero Mashing', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(596, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The better the battle scars, the more accomplished the warrior.', 'None', 'he', 'Helm', 'items/helms/NeoBerserkerHairF.swf', 'iihelm', 'NeoBerserkerHairF', 'BoneBreaker Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(597, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The better the battle scars, the more accomplished the warrior.', 'None', 'he', 'Helm', 'items/helms/NeoBerserkerHeadM.swf', 'iihelm', 'NeoBerserkerHeadM', 'BoneBreaker Armored Head', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(598, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The better the battle scars, the more accomplished the warrior.', 'None', 'he', 'Helm', 'items/helms/NeoBerserkerHairM.swf', 'iihelm', 'NeoBerserkerHairM', 'BoneBreaker Head', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(599, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The better the battle scars, the more accomplished the warrior.', 'None', 'he', 'Helm', 'items/helms/NeoBerserkerHeadF.swf', 'iihelm', 'NeoBerserkerHeadF', 'BoneBreaker Armored Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(600, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Use this item to unlock the Bonebreaker adventure map and exclusive farming quest!', 'None', 'None', 'Item', 'undefined', 'iibag', '', 'BoneBreaker Fortress Map', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(601, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Dragon Knights have the ability to grow wings once they''ve spent enough time communing with the wyrms.', 'None', 'ba', 'Cape', 'items/capes/BlacknYellowDragonWings.swf', 'iicape', 'BlacknYellowDragonWings', 'Dragon Knight Wing Morph', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(602, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '2 wounds in an opponent is better than 1!', 'None', 'Weapon', 'Sword', 'items/swords/BlacknYellowDragonGreatSword2.swf', 'iwsword', 'BlacknYellowDragonGreatSword2', 'Dragon Knight Split Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(603, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Battle monsters, break gems, and get ALL the rewards in AQWorlds AND Battle Gems!', 'None', 'co', 'Armor', 'BlacknYellowDragon2.swf', 'iwarmor', 'BlacknYellowDragon2', 'Dragon Knight (Armor)', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(604, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Your opponents are NOT going to want you to headbutt them in THIS helm! This crest is unique to the Dragon Knight brigade!', 'None', 'he', 'Helm', 'items/helms/BlacknYellowDragonHelmr1.swf', 'iihelm', 'BlacknYellowDragonHelm1', 'Dragon Knight Crest', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(605, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 100, 1, 'Anaxia shards held in the hilt of this sword enhance the original Starsword, changing it into an extremely powerful energy blade.', 'None', 'Weapon', 'Sword', 'items/swords/AnaxianNebulaBreaker.swf', 'iwsword', 'AnaxianNebulaBreaker', 'Anaxian Nebula Breaker', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(606, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 100, 1, 'Emoxus accidentally added this armor to 2 quests, and it wasn''t supposed to bthere... only some people got this item, and it''s forever rare now. spoookeee', 'None', 'co', 'Armor', 'AxelTroll.swf', 'iwarmor', 'AxelTroll', 'Spookee Rare Armor', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(607, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'co', 'Armor', 'SSRC1.swf', 'iwarmor', 'SpellSmith', 'SpellSmith Knight', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(608, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'Weapon', 'Sword', 'items/swords/KingBlade.swf', 'iwsword', 'KingBlade.swf', 'King''s Blade', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(609, 0, 0, 0, 0, 0, 0, 0, 25, 1, 27500, 100, 25, 1, 0, -1, 0, 0, '', '', 10, 1, 'This axe was forged by Emoxus, suggested by Duessel', 'Nature', 'Weapon', 'Axe', 'items/axes/BattleFury.swf', 'iwaxe', 'BattleFury', 'Battlefury', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(610, 0, 0, 0, 0, 0, 0, 0, 45, 1, 250000, 100, 1, 45, 0, -1, 0, 0, '', '', 10, 1, '', 'Light', 'co', 'Armor', 'TyndareousArmor.swf', 'iwarmor', 'TyndareousArmor', 'Tyndareous', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(611, 0, 0, 0, 0, 0, 0, 0, 45, 1, 100000, 100, 1, 45, 0, -1, 0, 0, '', '', 10, 1, '', 'None', 'ba', 'Cape', 'items/capes/TyndareousCape.swf', 'iicape', 'TyndareousCape', 'Tyndareous Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(612, 0, 0, 0, 0, 0, 0, 0, 25, 0, 15000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A popular sport amongst Swordhaven''s nobility, these skilled hunters bring down their prey with trained falcons.', 'Light', 'co', 'Armor', 'Falconer.swf', 'iwarmor', 'Falconer', 'Noble Falconer', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(613, 0, 0, 0, 0, 0, 0, 0, 25, 0, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Swordhaven is home to more than fish and neutrality. These diplomats enjoy neither candy, nor war, but will take up a blade if ensuring peace requires it.', 'Light', 'co', 'Armor', 'Karoliner.swf', 'iwarmor', 'Karoliner', 'Swordhaven Diplomat', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(614, 0, 0, 0, 0, 0, 0, 0, 35, 0, 95000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'As a Knight of the Pactagonal Table, you''ve earned the right to wear this armor!', 'Light', 'co', 'Armor', 'PactagonalKnight2013.swf', 'iwarmor', 'PactagonalKnight2013', 'Pactagonal Knight', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(615, 0, 0, 0, 0, 0, 0, 0, 30, 0, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'You''re a respected officer of King Alteon''s court! Well, at least you''re dressed like one.', 'Light', 'co', 'Armor', 'RoyalJusticar.swf', 'iwarmor', 'RoyalJusticar', 'Royal Justicar', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(616, 0, 0, 0, 0, 0, 0, 0, 30, 0, 45000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Wear this armor proudly as a herald of Swordhaven.', 'Light', 'co', 'Armor', 'RoyalBattleHerald2.swf', 'iwarmor', 'RoyalBattleHerald2', 'Royal Battle Herald', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(617, 0, 0, 0, 0, 0, 0, 0, 40, 0, 115000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Show your true loyalty to Swordhaven in this gilded armor.', 'Light', 'co', 'Armor', 'LSHR.swf', 'iwarmor', 'LSHR', 'Swordhaven Loyalist', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(618, 0, 0, 0, 0, 0, 0, 0, 40, 0, 115000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'For all you''ve done in the name of the Good King Alteon, you''ve been granted the right to wear the royal color purple!', 'Light', 'co', 'Armor', 'LSHRChaos.swf', 'iwarmor', 'LSHRChaos', 'Regal Swordhaven Loyalist', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(619, 0, 0, 0, 0, 0, 0, 0, 25, 0, 35000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'This elegant, golden bow is used by King Alteon''s royal archers.', 'None', 'Weapon', 'Bow', 'items/guns/RoyalBow.swf', 'iwgun', 'RoyalBow', 'Royal Swordhaven Bow', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(620, 0, 0, 0, 0, 0, 0, 0, 25, 0, 12000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Worn by Swordhaven''s falconers, this cape is dyed in the colors of King Alteon''s court.', 'None', 'ba', 'Cape', 'items/capes/FalconerCape.swf', 'iicape', 'FalconerCape', 'Noble Falconer Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(621, 0, 0, 0, 0, 0, 0, 0, 25, 0, 12000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A heavy cloak to protect against strong winds, cold winters, and purple tentacles.', 'None', 'ba', 'Cape', 'items/capes/KarolinerCape.swf', 'iicape', 'KarolinerCape', 'Diplomatic Mantle', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(622, 0, 0, 0, 0, 0, 0, 0, 40, 0, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Fire? Ice? In a fight, you like ''em both.', 'None', 'ba', 'Cape', 'items/capes/MageCape.swf', 'iicape', 'MageCape', 'Mage Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(623, 0, 0, 0, 0, 0, 0, 0, 40, 0, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'While larger members of your party distract the foe, you slip up behind him and stab him in the back.', 'None', 'ba', 'Cape', 'items/capes/RogueCape.swf', 'iicape', 'RogueCape', 'Rogue Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(624, 0, 0, 0, 0, 0, 0, 0, 40, 0, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'In a battle, you''re always in the front, defending your allies against the largest threat.', 'None', 'ba', 'Cape', 'items/capes/WarriorCape.swf', 'iicape', 'WarriorCape', 'Warrior Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(625, 0, 0, 0, 0, 0, 0, 0, 40, 0, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Sympathetic to Alteon, you''ll defend Swordhaven in his name.', 'None', 'ba', 'Cape', 'items/capes/GoodCape.swf', 'iicape', 'GoodCape', 'Good Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(626, 0, 0, 0, 0, 0, 0, 0, 40, 0, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Your friends may be the ones doing the heavy damage, but without you they''d never survive.', 'None', 'ba', 'Cape', 'items/capes/HealerCape.swf', 'iicape', 'HealerCape', 'Healer Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(627, 0, 0, 0, 0, 0, 0, 0, 25, 0, 28000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'These beautiful swords can only be worn by the respected officers of arms of Swordhaven.', 'None', 'ba', 'Cape', 'items/capes/RoyalHeraldCape.swf', 'iicape', 'RoyalHeraldCape', 'Royal Herald Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(628, 0, 0, 0, 0, 0, 0, 0, 25, 0, 35000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'These beautiful swords can only be used by the respected officers of arms of Swordhaven.', 'Nature', 'Weapon', 'Dagger', 'items/swords/BattleHeraldSword.swf', 'iwdagger', 'BattleHeraldSword', 'Dual Herald Swords', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(629, 0, 0, 0, 0, 0, 0, 0, 25, 0, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'This gun - is it for shooting, or for stabbing? I say both!', 'Nature', 'Weapon', 'Gun', 'items/guns/KarolinerRifle.swf', 'iwgun', 'KarolinerRifle', 'Ceremonial Rifle', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(630, 0, 0, 0, 0, 0, 0, 0, 25, 0, 8000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Swordhaven''s falconers often adorn their caps with a tailfeather from a favorite trained bird!', 'None', 'he', 'Helm', 'items/helms/FalconerHelm.swf', 'iihelm', 'FalconerHelm', 'Noble Falconer''s Cap', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(631, 0, 0, 0, 0, 0, 0, 0, 25, 0, 8000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Swordhaven''s falconers often adorn their caps with a tailfeather from a favorite trained bird!', 'None', 'he', 'Helm', 'items/capes/FalconerFHelm2.swf', 'iihelm', 'FalconerFHelm', 'Noble Falconer Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(632, 0, 0, 0, 0, 0, 0, 0, 25, 0, 10000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A three horned unicorn! Oh yea- aw man its just a hat.', 'None', 'he', 'Helm', 'items/helms/KarolinerHat.swf', 'iihelm', 'KarolinerHat', 'Diplomat''s Tricorn', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(633, 0, 0, 0, 0, 0, 0, 0, 25, 0, 10000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Long hair in a ponytail never looks more stylish than when it''s under a tricorn.', 'None', 'he', 'Helm', 'items/helms/KarolinerTail.swf', 'iihelm', 'KarolinerTail', 'Diplomat''s Ponytail', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(634, 0, 0, 0, 0, 0, 0, 0, 25, 0, 18000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Wear this crown to show the world that you represent the royalty of Swordhaven.', 'None', 'he', 'Helm', 'items/helms/BattleHeraldCrownv2.swf', 'iihelm', 'BattleHeraldCrown', 'Battle Herald Crown', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(635, 0, 0, 0, 0, 0, 0, 0, 30, 0, 18000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Wear this crown to show the world that you represent the royalty of Swordhaven.', 'None', 'he', 'Helm', 'items/helms/BattleHeraldCrownLong.swf', 'iihelm', 'BattleHeraldCrownLong', 'Ladies'' Battle Herald Crown', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(636, 0, 0, 0, 0, 0, 0, 0, 30, 0, 23000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The helm worn by the most respected officers of King Alteon''s court.', 'None', 'he', 'Helm', 'items/helms/RoyalJusticarHelm.swf', 'iihelm', 'RoyalJusticarHelm', 'Royal Justicar''s Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(637, 0, 0, 0, 0, 0, 0, 0, 20, 0, 8000, 100, 1, 1, 0, -1, 0, 129600, '', '', 13, 1, 'If you''re wearing a mask, there''s no way for law enforcement to identify the homicidal maniac.', 'None', 'he', 'Helm', 'items/helms/HarlequinMask1.swf', 'iihelm', 'HarlequinMask1', 'Harlequin''s Masque', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(638, 0, 0, 0, 0, 0, 0, 0, 35, 0, 35000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'As a Knight of the Pactagonal Table, you''ve earned the right to wear this helm!', 'None', 'he', 'Helm', 'items/helms/PacKnightHelm2013.swf', 'iihelm', 'PacKnightHelm2013', 'Pactagonal Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(639, 0, 0, 0, 0, 0, 0, 0, 20, 0, 8000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'THIS. THIS IS WHY PEOPLE ARE AFRAID OF CLOWNS.', 'None', 'he', 'Helm', 'items/helms/HarlequinMask2.swf', 'iihelm', 'HarlequinMask2', 'Harlequin''s Facade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(640, 0, 0, 0, 0, 0, 1, 0, 40, 0, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Attack Swordhaven? That''s a-poundin''.', 'Dark', 'Weapon', 'Mace', 'items/maces/SiegeMaul.swf', 'iwmace', 'SiegeMaul', 'Siege Maul', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(641, 0, 0, 0, 0, 0, 0, 0, 25, 0, 32000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Swordhaven''s arsenal is stocked with these expertly-crafted maces, for use by its soldiers and peasants alike.', 'Dark', 'Weapon', 'Mace', 'items/maces/MorningStarMace.swf', 'iwmace', 'MorningStarMace', 'Swordhaven Morning Star', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0);
INSERT INTO `meh_items` (`id`, `Coins`, `Diamonds`, `Staff`, `House`, `Temp`, `Upg`, `ClassID`, `EnhID`, `FactionID`, `Cost`, `DPS`, `Lvl`, `Qty`, `QtyRemain`, `ReqClass`, `ReqCP`, `ReqRep`, `ReqItems`, `ReqFItems`, `Rty`, `Stk`, `Desc`, `Elmt`, `ES`, `Type`, `File`, `Icon`, `Link`, `Name`, `SkillID`, `PTR`, `ProcID`, `ReqQuests`, `QSindex`, `Meta`, `QSvalue`, `Rng`, `EnhPatternID`, `Class`, `Faction`, `bForgeRecipe`, `ForgeProduct`) VALUES
(642, 0, 0, 0, 0, 0, 0, 0, 35, 0, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'This terrifying weapon is as beautiful as it is deadly.', 'Light', 'Weapon', 'Polearm', 'items/polearms/DragonPolearmVok.swf', 'iwpolearm', 'DragonPolearmVok', 'Draconian Poleaxe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(643, 0, 0, 0, 0, 0, 0, 0, 25, 0, 32000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Great for stabbing... AND poking!', 'Dark', 'Weapon', 'Polearm', 'items/polearms/CarlosPoleAxe.swf', 'iwpolearm', 'PoleAxe', 'Silver Polearm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(644, 0, 0, 0, 0, 0, 0, 0, 35, 0, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'For centuries, King Alteon''s bloodline has been favored by the dragons. They are the sigil of his house.', 'Light', 'Weapon', 'Sword', 'items/swords/DragonSwordVok.swf', 'iwsword', 'DragonSwordVok', 'Blade of Sigils', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(645, 0, 0, 0, 0, 0, 0, 0, 30, 0, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Crafted from the bones and sinew of long-dead dragons.', 'Nature', 'Weapon', 'Sword', 'items/swords/SwordHavenWepVok1.swf', 'iwsword', 'SwordHavenWepVok1', 'Dragonbone Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(646, 0, 0, 0, 0, 0, 0, 0, 20, 0, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'This sword looks like it''s been in the sewer for a long time. Will it even still cut?', 'Nature', 'Weapon', 'Sword', 'items/swords/SewerRustedSword.swf', 'iwsword', 'SewerRustedSword', 'Sword of the Lost', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(647, 0, 0, 0, 0, 0, 0, 0, 20, 0, 32000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Scavenged from the sewers, but not before it became tainted by chaos.', 'None', 'Weapon', 'Sword', 'items/swords/SewerChaosSword.swf', 'iwsword', 'SewerChaosSword', 'Chaotic Sword of the Lost', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(648, 0, 0, 0, 0, 0, 0, 0, 30, 0, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'As a committed defender of Swordhaven, you know that loyalty to the realm sometimes requires difficult decisions.', 'Light', 'Weapon', 'Sword', 'items/swords/DefenderOfSwordHavenBlade.swf', 'iwsword', 'DefenderOfSwordHavenBlade', 'Defender Of SwordHaven Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(649, 0, 0, 0, 0, 0, 0, 0, 35, 0, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Only the most skilled weapon-welders know how to forge a sword with a gradient blade. Onwards into battle, hero!', 'Dark', 'Weapon', 'Sword', 'items/swords/SilverClaymore.swf', 'iwsword', 'SilverClaymore', 'Silver Graydient Claymore', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(650, 0, 0, 0, 0, 0, 0, 0, 25, 0, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'These beautiful swords can only be used by the respected officers of arms of Swordhaven.', 'Nature', 'Weapon', 'Sword', 'items/swords/BattleHeraldSword.swf', 'iwsword', 'BattleHeraldSword', 'Battle Herald Sword', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(651, 0, 0, 0, 0, 0, 0, 0, 35, 1, 100000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Mighty dual-ended blades capable of sawing through the toughest defenses.', 'Light', 'Weapon', 'Sword', 'items/swords/RoyalBladesOfReaping.swf', 'iwsword', 'RoyalBladesOfReaping', 'Royal Blades of Reaping', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(652, 0, 0, 0, 0, 0, 0, 0, 30, 1, 85000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Mighty dual-ended blades capable of sawing through the toughest defenses.', 'Light', 'Weapon', 'Sword', 'items/swords/BladesOfReaping.swf', 'iwsword', 'BladesOfReaping', 'Blades of Reaping', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(653, 0, 0, 0, 0, 0, 0, 0, 40, 1, 115056, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The renowned Guardian Blade, re-made in legendary mystic gold.', 'Light', 'Weapon', 'Sword', 'items/swords/GildedGuardianBlade.swf', 'iwsword', 'GildedGuardianBlade', 'Gilded Guardian Blade', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(654, 0, 0, 0, 0, 0, 0, 0, 30, 1, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A powerful staff, holding the energy of a Sun Phoenix in it.', 'Light', 'Weapon', 'Staff', 'items/staves/SolarFlareStaff.swf', 'iwstaff', 'SolarFlareStaff', 'Solar Flare Staff', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(655, 0, 0, 0, 0, 0, 0, 0, 40, 1, 177600, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'an old relic from The legendary world of Merica. Holding the flames of freedom within it.', 'Fire', 'Weapon', 'Sword', 'items/swords/PatriotKatana.swf', 'iwsword', 'PatriotKatana', 'Patriot Katana', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(656, 0, 0, 0, 0, 0, 0, 0, 20, 1, 35500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A slim energy blade, with a Gurin crystal to power it.', 'Light', 'Weapon', 'Sword', 'items/swords/GreenStarSabre.swf', 'iwsword', 'GreenStarSabre', 'Green Star Sabre', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(657, 0, 0, 0, 0, 0, 0, 0, 20, 1, 35500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A slim energy blade, with a Ao crystal to power it.', 'Light', 'Weapon', 'Sword', 'items/swords/BlueStarSabre.swf', 'iwsword', 'BlueStarSabre', 'Blue Star Sabre', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(658, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 100, 1, '...', 'None', 'spe', 'Spell', '', 'ime3', '', 'God Spell', 109, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(659, 1, 0, 0, 0, 0, 0, 0, 0, 0, 200, 100, 1, 1, 0, 0, 0, 0, '', '', 10, 500, 'Using this item will DOUBLE all experience gained from killing monsters or completing quests for 1 hour.', 'None', 'None', 'ServerUse', 'icbxp', 'icbxp', 'xpboost::60::true', 'Focus Stone (1H)', 0, 0, 0, '', 0, '0', 0, 100, 0, 0, 0, 0, 0),
(660, 1, 0, 0, 0, 0, 0, 0, 0, 0, 200, 100, 1, 1, 0, 0, 0, 0, '', '', 10, 500, 'Using this item will DOUBLE all reputation gained from killing monsters or completing quests for 1 hour.', 'None', 'None', 'ServerUse', 'icbrep', 'icbrep', 'repboost::60::true', 'Trust Stone (1H)', 0, 0, 0, '', 0, '0', 0, 100, 0, 0, 0, 0, 0),
(661, 1, 0, 0, 0, 0, 0, 0, 0, 0, 200, 100, 1, 1, 0, 0, 0, 0, '', '', 10, 500, 'Using this item will DOUBLE all class points gained from killing monsters or completing quests for 1 hour.', 'None', 'None', 'ServerUse', 'icbcp', 'icbcp', 'cpboost::60::true', 'Battle Stone (1H)', 0, 0, 0, '', 0, '0', 0, 100, 0, 0, 0, 0, 0),
(662, 1, 0, 0, 0, 0, 0, 0, 0, 0, 200, 100, 1, 1, 0, 0, 0, 0, '', '', 10, 500, 'Using this item will DOUBLE all gold gained from killing monsters or completing quests for 1 hour.', 'None', 'None', 'ServerUse', 'icbgold', 'icbgold', 'gboost::60::true', 'Greed Stone (1H)', 0, 0, 0, '', 0, '0', 0, 100, 0, 0, 0, 0, 0),
(663, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, 'Forest Tiger Teeth', 'None', 'None', 'Item', '', 'iibag', '', 'Tiger Teeth', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(664, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, 'Fairy Dust', 'None', 'None', 'Item', '', 'iibag', '', 'Fairy Dust', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(665, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, 'Kogetan Cloth, proof you''ve killed one of these awful undead soldiers.', 'None', 'None', 'Item', '', 'iibag', '', 'Kogetan Cloth', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(666, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 4, 'The Skeletal Hand of a Kogetan General, with the Kogetan Mark carved into the palm.', 'None', 'None', 'Item', '', 'iibag', '', 'Kogetan General''s Hand', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(667, 0, 0, 0, 0, 0, 0, 0, 25, 1, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Exploding kittens. Goats. Tacoburrito enchilada awesomeness... How much INSANITY can one pet shop hold? Only Aria knows! (And she says if you wait long enough, this kitten might surprise you!)', 'None', 'pe', 'Pet', 'items/pets/kittenBOOM-2Feb15.swf', 'iipet', 'PetKittenBOOM', 'Exploding Kitten', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(668, 0, 0, 0, 0, 0, 0, 0, 15, 1, 10500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The messiest but most adorable pet ever!', 'None', 'pe', 'Pet', 'items/pets/slimegreenpet.swf', 'iipet', 'slimegreen', 'Slime', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(669, 0, 0, 0, 0, 0, 0, 0, 17, 1, 15000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'It''s a cute little bunny!', 'None', 'pe', 'Pet', 'items/pets/bunny.swf', 'iipet', 'PetBunny', 'Bunny', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(670, 0, 0, 0, 0, 0, 0, 0, 30, 1, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This wolf is ferocious but also a loyal companion.  It''s part of your pack now.', 'None', 'pe', 'Pet', 'items/pets/wolfric.swf', 'iipet', 'PetWolfric', 'Brown Wolf', 0, 0, -1, '', -1, 'undefined', 0, 103, 1, 0, 0, 0, 0),
(671, 0, 0, 0, 0, 0, 0, 0, 17, 1, 15000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'These small elusive creatures can definitely annoy your enemies (and friends) or cause a much needed distraction.', 'None', 'pe', 'Pet', 'items/pets/sprites-29Mar11.swf', 'iipet', 'sprites', 'Fire Flies', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(672, 0, 0, 0, 0, 0, 0, 0, 20, 1, 12500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Usually very peaceful, a trobble will only attack you if it feels threatened, or if you try to treat it like a stuffed animal.', 'None', 'pe', 'Pet', 'items/pets/trobble1.swf', 'iipet', 'PetTrobble1', 'Blue Trobble', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(673, 0, 0, 0, 0, 0, 0, 0, 35, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'You must be very lucky to own such a dragon...', 'None', 'pe', 'Pet', 'items/pets/babydragon-27Jun11.swf', 'iipet', 'babydragon27Jun11', 'Baby Red Dragon', 0, 0, -1, '', -1, 'undefined', 0, 103, 1, 0, 0, 0, 0),
(674, 0, 0, 0, 0, 0, 1, 0, 1, 1, 6000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'No it''s not Linus.', 'None', 'pe', 'Pet', 'items/pets/penguin.swf', 'iipet', 'PetPenguin', 'Penguin', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(675, 0, 0, 0, 0, 0, 0, 0, 1, 1, 7000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This is the most humerus pet!', 'None', 'pe', 'Pet', 'items/pets/SkeletonPet2.swf', 'iipet', 'SkeletonPet2', 'Mini Skeleton', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(676, 0, 0, 0, 0, 0, 0, 0, 25, 1, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This wolf is ferocious and Chaorrupted. Train him to remember what loyalty to the pack is!', 'None', 'pe', 'Pet', 'items/pets/PetWolfChaos.swf', 'iipet', 'PetWolfChaos', 'Chaos Wolf', 0, 0, -1, '', -1, 'undefined', 0, 103, 0, 0, 0, 0, 0),
(677, 0, 0, 0, 0, 0, 0, 0, 10, 1, 7500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This bat has the HARDEST time blending into the shadows at night, poor thing!', 'None', 'pe', 'Pet', 'items/pets/vampirebatwt.swf', 'iipet', 'vampirebatwt', 'Albino Bat', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(678, 0, 0, 0, 0, 0, 0, 0, 40, 1, 40000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Where did you get a wolf pup? Just don''t let it out of your sight during a full moon...', 'None', 'pe', 'Pet', 'items/pets/DarkWolfPuppy2014.swf', 'iipet', 'DarkWolfPuppy2014', 'Dark Wolf Pup', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(679, 0, 0, 0, 0, 0, 0, 0, 5, 1, 7500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'This worm knows a lot of big scary words.  Like "commitment". And "manual labor".', 'None', 'pe', 'Pet', 'items/pets/bookworm1.swf', 'iipet', 'Bookworm1', 'Bookworm', 0, 0, -1, '', -1, 'undefined', 0, 103, 1, 0, 0, 0, 0),
(680, 0, 0, 0, 0, 0, 0, 0, 15, 1, 9000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Which came first - the chicken or the egg?  Yum... eggs are delicious.', 'None', 'pe', 'Pet', 'items/pets/chickenpet1.swf', 'iipet', 'Chickenpet1', 'Chicken', 0, 0, -1, '', -1, 'undefined', 0, 103, 1, 0, 0, 0, 0),
(681, 0, 0, 0, 0, 0, 0, 0, 20, 1, 17500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Awww... it''s so cute and morbid.', 'None', 'pe', 'Pet', 'items/pets/deathdoll.swf', 'iipet', 'PetDeathdoll', 'Death Doll', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(682, 0, 0, 0, 0, 0, 0, 0, 30, 1, 35000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Puppy! Dragon! Dragon on the back of the Puppy!', 'None', 'pe', 'Pet', 'items/pets/Riptooth2r1.swf', 'iipet', 'Riptooth2', 'Riptooth and Watcher', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(683, 0, 0, 0, 0, 0, 0, 0, 35, 1, 35000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'A mythical creature brought to life by one of your fellow AQW players.  This particular chimera was inspired by a sketch created by Vadriel (Rkaia).', 'None', 'pe', 'Pet', 'items/pets/chimerapet.swf', 'iipet', 'chimerapet', 'Chimera of Vadriel', 0, 0, -1, '', -1, 'undefined', 0, 103, 1, 0, 0, 0, 0),
(684, 0, 0, 0, 0, 0, 0, 0, 22, 1, 22000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A pet to keep, perhaps in a castle that rises above the clouds.', 'None', 'pe', 'Pet', 'items/pets/GargoylePET.swf', 'iipet', 'GargoylePet', 'Gargoyle', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(685, 0, 0, 0, 0, 0, 0, 0, 25, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Exploding kittens. Goats. Tacoburrito enchilada awesomeness... How much INSANITY can one pet shop hold? Only Aria knows!  (And she says if you wait long enough, this kitten might surprise you!)', 'None', 'pe', 'Pet', 'items/pets/kittenBOOM3-2Feb15.swf', 'iipet', 'PetKittenBOOM3', 'Exploding Kitten', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(686, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, 0, 0, 0, '', '', 30, 100, 'The Mana Essence of a Forsaken Elemental.', 'None', 'None', 'Item', '', 'soul', '', 'Forsaken Mana Essence', 0, 0, 0, '', 0, '0', 0, 100, 1, 0, 0, 0, 0),
(687, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, 0, 0, 0, '', '', 30, 100, 'An ancient Ice Banshee Spell Scroll.', 'None', 'None', 'Item', '', 'iidesign', '', 'Banshee Spell Scroll', 0, 0, 0, '', 0, '0', 0, 100, 1, 0, 0, 0, 0),
(688, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, 0, 0, 0, '', '', 30, 100, 'This bag contains the remains of Frigid Skeletons.', 'None', 'None', 'Item', '', 'iibag', '', 'Frigid Undead Dust', 0, 0, 0, '', 0, '0', 0, 100, 1, 0, 0, 0, 0),
(689, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, 0, 0, 0, '', '', 30, 3, 'Nothing Was The Same.', 'None', 'None', 'Item', '', 'soul', '', 'Forsaken Drake''s Soul', 0, 0, 0, '', 0, '0', 0, 100, 1, 0, 0, 0, 0),
(690, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 100, 'A mighty energy roams in the remains of this skull. Take this to one of the minions of Emoxus. This''ll show him you mean business.', 'None', 'None', 'Item', '', 'Skull', '', 'Skull', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(691, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 4, 'You''ve signed a contract in blood with Emoxus to serve as a loyal minion of The Anax. Maybe he''ll give you something pretty for it...\n\n(Stacks to 4.)', 'None', 'None', 'Item', '', 'iidesign', '', 'Blood Contract', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(692, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 30, 'This is a rare gem, with a portion of the Anax''s power within it. You can use this to get powerful items from Emoxus.\r\n\r\n(Stacks to 30.)', 'None', 'None', 'Item', '', 'AnaxGem', '', 'Anaxian Gem', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(693, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 12, 'Anaxite... This is a relic crafted of pure brimstone, with the essence of The Anax imbued into it.', 'None', 'None', 'Item', '', 'Anaxite', '', 'Anaxite', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(694, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 100, 1, 1, 0, 0, 0, 0, '', '', 30, 100, 'A cold azure soul now rests in your hands. You could take this to an Evolutionist, and use it to make more powerful items!', 'None', 'None', 'Item', '', 'soul', '', 'Soul', 0, 0, 0, '', 0, '0', 0, 100, 1, 0, 0, 0, 0),
(695, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'Dorian Row''s speed. Nice job, Bring this back to Emoxus. Prove your power to him.', 'None', 'None', 'Item', '', 'iibag', '', 'Dorian''s Speed', 0, 0, -1, '203', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(696, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'Deathlord Vorm''s Magic. Nice job, Bring this back to Emoxus. Prove your power to him.', 'None', 'None', 'Item', '', 'iibag', '', 'Vorym''s Magic', 0, 0, -1, '203', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(697, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'A Doomlord''s Evil. Nice job, Bring this back to Emoxus. Prove your power to him.', 'None', 'None', 'Item', '', 'iibag', '', 'Doomlord''s Evil', 0, 0, -1, '203', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(698, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 100, 'A mighty energy roams in the remains of this skull. Take this to one of the minions of Emoxus. This''ll show him you mean business.', 'None', 'None', 'Item', '', 'Skull', '', 'Skull', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(699, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 10, 'The Essence of Mana.', 'None', 'None', 'Item', '', 'iibag', '', 'Mana Essence', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(700, 0, 0, 0, 0, 0, 0, 0, 30, 1, 20000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'Miltonius started creating a corps of Vampires to intimidate the mortals who opposed his army. ', 'None', 'co', 'Armor', 'MiltoniusVamp1_skin.swf', 'iwarmor', 'Vamp1', 'Vampire of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(701, 0, 0, 0, 0, 0, 0, 0, 30, 1, 15000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'A mighty sword forged of blood and bones.', 'None', 'Weapon', 'Sword', '/items/swords/MiltoniusOSsword01.swf', 'iwsword', 'MiltoniusOSsword01', 'Vampire Blade of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(702, 0, 0, 0, 0, 0, 0, 0, 1, 1, 12000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1200, 'This is the main currency of The Anax. Each coin contains a portion of the user''s soul, which is traded to Emoxus in return for great power. Use this wisely.', 'None', 'None', 'Item', '', 'Drachma', '', 'Drachma', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(703, 0, 0, 0, 0, 0, 0, 0, 40, 1, 5000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'One of Miltonius'' personal blades. After his demise, Emoxus took the plans and brought them to his forge to make.', 'None', 'Weapon', 'Sword', '/items/swords/MiltonPoolPhoenixSword03.swf', 'iwsword', 'MiltonPoolPhoenixSword03', 'Champion Blade of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(704, 0, 0, 0, 0, 0, 0, 0, 40, 1, 10000, 100, 40, 1, 0, -1, 0, 0, '', '', 10, 1, 'The almighty Overfiend Blade. Miltonius crafted this weapon a long time ago, twisting it into it''s demented state with the power of ungodly death.', 'Dark', 'Weapon', 'Sword', '/items/swords/MiltoniusNulgathsword01.swf', 'iwsword', 'MiltoniusNulgathsword01', 'Overfiend Blade of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(705, 0, 0, 0, 0, 0, 0, 0, 0, 1, 15000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'This is the armor Miltonius wore before his demise. The armor bends and changes to your soul.', 'None', 'co', 'Armor', 'MiltoniusPoolCC_skin.swf', 'iwarmor', 'MiltoniusPool2', 'Armor of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(706, 0, 0, 0, 0, 0, 0, 0, 0, 1, 15000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'The Deathlords were a powerful core of soldiers in Miltonius'' Army... Now they work for Emoxus.', 'None', 'co', 'Armor', 'MiltoniusDeathHead_skin.swf', 'iwarmor', 'MiltoniusDeathhead', 'Deathlord of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(707, 0, 0, 0, 0, 0, 0, 0, 30, 1, 20000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'The blade of the Blood Void.', 'None', 'Weapon', 'Sword', '/items/daggers/BloodletterOrigCC-4Dec13.swf', 'iwsword', 'BloodletterOirgCC', 'Bloodletter of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(708, 0, 0, 0, 0, 0, 0, 0, 30, 1, 20000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'Miltonius started creating a corps of Vampires to intimidate the mortals who opposed his army. ', 'None', 'co', 'Armor', 'MiltoniusVamp1_skin.swf', 'iwarmor', 'Vamp1', 'Vampire of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(709, 0, 0, 0, 0, 0, 0, 0, 30, 1, 15000, 100, 30, 1, 0, -1, 0, 0, '', '', 10, 1, 'A mighty sword forged of blood and bones.', 'None', 'Weapon', 'Sword', '/items/swords/MiltoniusOSsword01.swf', 'iwsword', 'MiltoniusOSsword01', 'Vampire Blade of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(710, 0, 0, 0, 0, 0, 0, 0, 50, 1, 100000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'This Ungodly Reaver of Miltonius is a powerful weapon used by the most savage fiends of Miltonius''s army.', 'None', 'Weapon', 'Polearm', 'items/polearms/MiltonPoolSecretdagger04.swf', 'iwpolearm', 'MiltonPoolSecretdagger04', 'Ungodly Reaver of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(711, 0, 0, 0, 0, 0, 0, 0, 50, 1, 100000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'The DragonBlade of Miltonius was wielded by an Archangel, before falling into the hands of the Archfiend and instantly becoming the ultimate blade of insanity.', 'None', 'Weapon', 'Sword', 'items/swords/WarriorMiltonPool2.swf', 'iwsword', 'WarriorMiltonPool2', 'Dragonblade of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(712, 0, 0, 0, 0, 0, 0, 0, 50, 1, 125000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'The Blood Gods used this sword to crush their enemies in a bloodbath of arrogance, then absorb their power through said bloodbath.', 'None', 'Weapon', 'Sword', 'items/swords/BloodGodBlade.swf', 'iwsword', 'BloodGodBlade', 'Blood God Blade', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(713, 0, 0, 0, 0, 0, 0, 0, 0, 1, 200000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'The Blood Gods are the strongest bloodmancers in the known universe. They can rip the blood out of hundreds of souls in an instance.', 'None', 'co', 'Armor', 'BloodGod.swf', 'iwarmor', 'BloodGod', 'Blood God', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(714, 0, 0, 0, 0, 0, 0, 0, 50, 1, 125000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'The Blood Gods dawn this helm, striking fear into the very souls of their foes.', 'None', 'he', 'Helm', 'items/helms/BloodGodHelm.swf', 'iihelm', 'BloodGodHelm', 'Blood God Guard', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(715, 0, 0, 0, 0, 0, 0, 0, 50, 1, 125000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'The Blood Gods dawn this cloak, striking fear into the very souls of their foes.', 'None', 'ba', 'Cape', 'items/capes/BloodGodCloak.swf', 'iicape', 'BloodGodCloak', 'Blood God Cloak', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(716, 0, 0, 0, 0, 0, 0, 0, 20, 11, 47492, 100, 20, 1, 0, -1, 0, 10000, '', '', 10, 1, 'A cape for those loyal to the forsaken.', 'None', 'ba', 'Cape', 'items/capes/ForsakenCloak.swf', 'iicape', 'ForsakenCloak', 'Forsaken Cloak', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(717, 0, 0, 0, 0, 0, 0, 0, 0, 11, 918211, 100, 65, 1, 0, -1, 0, 202500, '', '', 10, 1, 'The might commander armor of the Forsaken Armies. Dawning this powerful gear proves to everyone you''re unlimited devotion and power of the Forsaken.', 'Dark', 'co', 'Armor', 'EmoxusSkeleC.swf', 'iwarmor', 'EmoxusSkeleC', 'Forsaken Commander', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(718, 0, 0, 0, 0, 0, 0, 0, 0, 11, 389222, 100, 30, 1, 0, -1, 0, 44100, '', '', 10, 1, 'The dark Forsaken Doomknights use a combination of doom magic and ice atacks.', 'Dark', 'co', 'Armor', 'EmoxusSkeleD.swf', 'iwarmor', 'EmoxusSkeleD', 'Forsaken Doomknight', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(719, 0, 0, 0, 0, 0, 0, 0, 0, 11, 237719, 100, 27, 1, 0, -1, 0, 22500, '', '', 10, 1, 'The dark Forsaken Paladin use a combination of holy magic and ice atacks.', 'Dark', 'co', 'Armor', 'EmoxusSkeleP.swf', 'iwarmor', 'EmoxusSkeleP', 'Forsaken Paladin', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(720, 0, 0, 0, 0, 0, 0, 0, 0, 11, 440391, 100, 34, 1, 0, -1, 0, 129600, '', '', 10, 1, 'Forsaken Warlords cut through the armies of their enemies with single swipes.', 'Dark', 'co', 'Armor', 'EmoxusSkeleW.swf', 'iwarmor', 'EmoxusSkeleW', 'Forsaken Warlord', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(721, 0, 0, 0, 0, 0, 0, 0, 60, 11, 298330, 100, 60, 1, 0, -1, 0, 78400, '', '', 10, 1, 'The Forsaken Valyrian Commanders used to use this halbred to conquer the mightiest of beasts.', 'Dark', 'Weapon', 'Polearm', 'items/polearms/ValyrianHalbred.swf', 'iwpolearm', 'ValyrianHalbred', 'Valyrian Halbred', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(722, 0, 0, 0, 0, 0, 0, 0, 24, 11, 120933, 100, 24, 1, 0, -1, 0, 22500, '', '', 10, 1, 'This is the view of a Forsaken.', 'None', 'he', 'Helm', 'items/helms/ForsakenCommanderHelm.swf', 'iihelm', 'ForsakenCommanderHelm', 'Forsaken Visage', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(723, 0, 0, 0, 0, 0, 0, 0, 0, 11, 239811, 100, 30, 1, 0, -1, 0, 44100, '', '', 10, 1, 'This is the appearance of the original Valyrian Forskan Arcanists.', 'Dark', 'co', 'Armor', 'FrigidValyrian.swf', 'iwarmor', 'FrigidValyrian', 'Valyrian Arcanist', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(724, 0, 0, 0, 0, 0, 0, 0, 50, 11, 210098, 100, 50, 1, 0, -1, 0, 78400, '', '', 10, 1, 'Valyrian Doomknights used this tainted blade to rip apart their enemies', 'Dark', 'Weapon', 'Sword', 'items/swords/ForsakenDoomBlade.swf', 'iwsword', 'ForsakenDoomBlade', 'Forsaken Doom Blade', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(725, 0, 0, 0, 0, 0, 0, 0, 0, 1, 80000, 100, 60, 1, 0, -1, 0, 0, '692:5,842:1', '', 10, 1, 'Emoxus uses his powers to forge new armor, and energy to the Void Breed.', 'Dark', 'co', 'Armor', 'InflamedVoid.swf', 'iwarmor', 'InflamedVoid', 'Inflamed Void of Emoxus', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(726, 0, 0, 0, 0, 0, 0, 0, 50, 1, 150000, 100, 50, 1, 0, -1, 0, 0, '693:4,692:2', '', 10, 1, 'Emoxus re-forged the mighty Hydra Sword to create this godly re-imagining for his Anax soldiers.', 'Water', 'Weapon', 'Sword', '/items/swords/MysticalHydraBlade.swf', 'iwsword', 'MysticalHydraBlade', 'Mystical Hydra Blade', 0, 0, -1, '', -1, 'undefined', 0, 100, 6, 0, 0, 0, 0),
(727, 0, 0, 0, 0, 0, 0, 0, 60, 1, 1000000, 100, 60, 1, 0, -1, 0, 0, '693:5,692:3', '', 10, 1, 'Emoxus took the soul of Thrax "The Betrayer", His Blade, and His Shadow. In turn he forged this blade. A blade mighty enough for a demon lord to wield with pride.', 'Dark', 'Weapon', 'Sword', '/items/swords/ThraxRetribution.swf', 'iwsword', 'ThraxRetribution', 'Thrax''s Retribution', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(728, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '702:10', '', 10, 1, 'Once you have this scroll, Find Emoxus and tell him. He''ll allow you into The Anax guild, making you an official part of The Anax.', 'None', 'None', 'Item', '', 'iidesign', '', 'Anax Guild Scroll', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(729, 0, 0, 0, 0, 0, 0, 0, 30, 1, 50000, 100, 30, 1, 0, -1, 0, 0, '702:2', '', 10, 1, 'One of the many blades Emoxus protected from Miltonius''s downfall. A powerful mystic katana.', 'Dark', 'Weapon', 'Sword', '/items/swords/EmpoweredKatana.swf', 'iwsword', 'EmpoweredKatana', 'Empowered Katana', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(730, 0, 0, 0, 0, 0, 0, 0, 30, 1, 50000, 100, 30, 1, 0, -1, 0, 0, '702:1', '', 10, 1, 'One of the many blades Emoxus protected from Miltonius''s downfall. A skullish endowed blade infused with bones and blood.', 'Dark', 'Weapon', 'Sword', '/items/swords/DishonoredSkullBlade.swf', 'iwsword', 'DishonoredSkullBlade', 'Dishonored Skull Blade', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(731, 0, 0, 0, 0, 0, 0, 0, 30, 1, 50000, 100, 30, 1, 0, -1, 0, 0, '693:2,692:3', '', 10, 1, 'One of the many blades Emoxus protected from Miltonius''s downfall. An ancient Scimitar infused with a demon''s soul.', 'Dark', 'Weapon', 'Sword', '/items/swords/FangedScimitar.swf', 'iwsword', 'FangedScimitar', 'Fanged Scimitar', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(732, 0, 0, 0, 0, 0, 0, 0, 30, 1, 50000, 100, 30, 1, 0, -1, 0, 0, '693:1,692:1', '', 10, 1, 'One of the many blades Emoxus protected from Miltonius''s downfall. An ancient demented Dwarven runed blade.', 'Dark', 'Weapon', 'Sword', '/items/swords/EonixBlade.swf', 'iwsword', 'EonixBlade', 'Eonix Blade', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(733, 0, 0, 0, 0, 0, 0, 0, 30, 1, 50000, 100, 30, 1, 0, -1, 0, 0, '693:1,692:1', '', 10, 1, 'One of the many blades Emoxus protected from Miltonius''s downfall. An ancient demented Dwarven runed blade.', 'Dark', 'Weapon', 'Sword', '/items/swords/EonicBlade.swf', 'iwsword', 'EonicBlade', 'Eonic Blade', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(734, 0, 0, 0, 0, 0, 0, 0, 40, 1, 150000, 100, 40, 1, 0, -1, 0, 0, '702:3', '', 10, 1, 'An unholy blade forged from the spiritual remains of a mighty fiend.', 'Dark', 'Weapon', 'Sword', '/items/swords/FiendScimitarE.swf', 'iwsword', 'FiendScimitarE', 'Unholy Fiend Scimitar', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(735, 0, 0, 0, 0, 0, 0, 0, 40, 1, 150000, 100, 40, 1, 0, -1, 0, 0, '702:3', '', 10, 1, 'Emoxus created this for an un-named holy warrior. It''s said to have the soul of a golden god falcon trapped inside it''s blade.', 'Dark', 'Weapon', 'Sword', '/items/swords/GildedTalon.swf', 'iwsword', 'GildedTalon', 'Gilded Talon', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(736, 0, 0, 0, 0, 0, 0, 0, 40, 1, 80000, 100, 40, 1, 0, -1, 0, 0, '702:2', '', 10, 1, 'Emoxus crafted this blade out of a lightning demon born in the eye of a hurricane.', 'Dark', 'Weapon', 'Sword', 'items/swords/TaintedDesumoOfEmoxus.swf', 'iwsword', 'TaintedDesumoOfEmoxus', 'Tainted Desumo', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(737, 0, 0, 0, 0, 0, 0, 0, 40, 1, 80000, 100, 40, 1, 0, -1, 0, 0, '702:2', '', 10, 1, 'Emoxus crafted this blade under the rays of the green lazerath sun, in the Realm of Oz.', 'Light', 'Weapon', 'Sword', 'items/swords/InferusViridis.swf', 'iwsword', 'InferusViridis', 'Inferus Viridis', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(738, 1, 0, 0, 0, 0, 0, 0, 0, 0, 350, 100, 15, 1, 0, 0, 0, 0, '', '', 10, 1, 'Miltonius ranks you Void Knight and bestows a portion of his power to you. You are enveloped by sinister magic and become a creature of destruction! And all this for just a small portion of your soul! The part you don''t need of course.', 'None', 'co', 'Armor', 'MiltonPool1_skin.swf', 'iwarmor', 'MiltonPool1', 'Void of Miltonius', 0, 0, 0, '', 0, '0', 0, 100, 2, 0, 0, 0, 0),
(739, 0, 0, 0, 0, 0, 0, 0, 51, 1, 51000, 100, 51, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(740, 0, 0, 0, 0, 0, 0, 0, 52, 1, 52000, 100, 52, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(741, 0, 0, 0, 0, 0, 0, 0, 53, 1, 53000, 100, 53, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(742, 0, 0, 0, 0, 0, 0, 0, 54, 1, 54000, 100, 54, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(743, 0, 0, 0, 0, 0, 0, 0, 55, 1, 55000, 100, 55, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(744, 0, 0, 0, 0, 0, 0, 0, 56, 1, 56000, 100, 56, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(745, 0, 0, 0, 0, 0, 0, 0, 57, 1, 57000, 100, 57, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(746, 0, 0, 0, 0, 0, 0, 0, 58, 1, 58000, 100, 58, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(747, 0, 0, 0, 0, 0, 0, 0, 59, 1, 59000, 100, 59, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(748, 0, 0, 0, 0, 0, 0, 0, 60, 1, 60000, 100, 60, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(749, 0, 0, 0, 0, 0, 0, 0, 61, 1, 61000, 100, 61, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(750, 0, 0, 0, 0, 0, 0, 0, 62, 1, 62000, 100, 62, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(751, 0, 0, 0, 0, 0, 0, 0, 63, 1, 63000, 100, 63, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(752, 0, 0, 0, 0, 0, 0, 0, 64, 1, 64000, 100, 64, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(753, 0, 0, 0, 0, 0, 0, 0, 65, 1, 65000, 100, 65, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(754, 0, 0, 0, 0, 0, 0, 0, 66, 1, 66000, 100, 66, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(755, 0, 0, 0, 0, 0, 0, 0, 67, 1, 67000, 100, 67, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(756, 0, 0, 0, 0, 0, 0, 0, 68, 1, 68000, 100, 68, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(757, 0, 0, 0, 0, 0, 0, 0, 69, 1, 69000, 100, 69, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(758, 0, 0, 0, 0, 0, 0, 0, 70, 1, 70000, 100, 70, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(759, 0, 0, 0, 0, 0, 0, 0, 71, 1, 71000, 100, 71, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(760, 0, 0, 0, 0, 0, 0, 0, 72, 1, 72000, 100, 72, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(761, 0, 0, 0, 0, 0, 0, 0, 73, 1, 73000, 100, 73, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(762, 0, 0, 0, 0, 0, 0, 0, 74, 1, 74000, 100, 74, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(763, 0, 0, 0, 0, 0, 0, 0, 75, 1, 75000, 100, 75, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(764, 0, 0, 0, 0, 0, 0, 0, 51, 1, 51000, 100, 51, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(765, 0, 0, 0, 0, 0, 0, 0, 52, 1, 52000, 100, 52, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(766, 0, 0, 0, 0, 0, 0, 0, 53, 1, 53000, 100, 53, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(767, 0, 0, 0, 0, 0, 0, 0, 54, 1, 54000, 100, 54, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(768, 0, 0, 0, 0, 0, 0, 0, 55, 1, 55000, 100, 55, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(769, 0, 0, 0, 0, 0, 0, 0, 56, 1, 56000, 100, 56, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(770, 0, 0, 0, 0, 0, 0, 0, 57, 1, 57000, 100, 57, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(771, 0, 0, 0, 0, 0, 0, 0, 58, 1, 58000, 100, 58, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(772, 0, 0, 0, 0, 0, 0, 0, 59, 1, 59000, 100, 59, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(773, 0, 0, 0, 0, 0, 0, 0, 60, 1, 60000, 100, 60, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(774, 0, 0, 0, 0, 0, 0, 0, 61, 1, 61000, 100, 61, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(775, 0, 0, 0, 0, 0, 0, 0, 62, 1, 62000, 100, 62, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(776, 0, 0, 0, 0, 0, 0, 0, 63, 1, 63000, 100, 63, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(777, 0, 0, 0, 0, 0, 0, 0, 64, 1, 64000, 100, 64, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(778, 0, 0, 0, 0, 0, 0, 0, 65, 1, 65000, 100, 65, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(779, 0, 0, 0, 0, 0, 0, 0, 66, 1, 66000, 100, 66, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(780, 0, 0, 0, 0, 0, 0, 0, 67, 1, 67000, 100, 67, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(781, 0, 0, 0, 0, 0, 0, 0, 68, 1, 68000, 100, 68, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(782, 0, 0, 0, 0, 0, 0, 0, 69, 1, 69000, 100, 69, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(783, 0, 0, 0, 0, 0, 0, 0, 70, 1, 70000, 100, 70, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(784, 0, 0, 0, 0, 0, 0, 0, 71, 1, 71000, 100, 71, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(785, 0, 0, 0, 0, 0, 0, 0, 72, 1, 72000, 100, 72, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(786, 0, 0, 0, 0, 0, 0, 0, 73, 1, 73000, 100, 73, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(787, 0, 0, 0, 0, 0, 0, 0, 74, 1, 74000, 100, 74, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(788, 0, 0, 0, 0, 0, 0, 0, 75, 1, 75000, 100, 75, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(789, 0, 0, 0, 0, 0, 0, 0, 51, 1, 51000, 100, 51, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(790, 0, 0, 0, 0, 0, 0, 0, 52, 1, 52000, 100, 52, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(791, 0, 0, 0, 0, 0, 0, 0, 53, 1, 53000, 100, 53, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(792, 0, 0, 0, 0, 0, 0, 0, 54, 1, 54000, 100, 54, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(793, 0, 0, 0, 0, 0, 0, 0, 55, 1, 55000, 100, 55, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(794, 0, 0, 0, 0, 0, 0, 0, 56, 1, 56000, 100, 56, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(795, 0, 0, 0, 0, 0, 0, 0, 57, 1, 57000, 100, 57, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(796, 0, 0, 0, 0, 0, 0, 0, 58, 1, 58000, 100, 58, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(797, 0, 0, 0, 0, 0, 0, 0, 59, 1, 59000, 100, 59, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(798, 0, 0, 0, 0, 0, 0, 0, 60, 1, 60000, 100, 60, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(799, 0, 0, 0, 0, 0, 0, 0, 61, 1, 61000, 100, 61, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(800, 0, 0, 0, 0, 0, 0, 0, 62, 1, 62000, 100, 62, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(801, 0, 0, 0, 0, 0, 0, 0, 63, 1, 63000, 100, 63, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(802, 0, 0, 0, 0, 0, 0, 0, 64, 1, 64000, 100, 64, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(803, 0, 0, 0, 0, 0, 0, 0, 65, 1, 65000, 100, 65, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(804, 0, 0, 0, 0, 0, 0, 0, 66, 1, 66000, 100, 66, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(805, 0, 0, 0, 0, 0, 0, 0, 67, 1, 67000, 100, 67, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(806, 0, 0, 0, 0, 0, 0, 0, 68, 1, 68000, 100, 68, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(807, 0, 0, 0, 0, 0, 0, 0, 69, 1, 69000, 100, 69, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(808, 0, 0, 0, 0, 0, 0, 0, 70, 1, 70000, 100, 70, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(809, 0, 0, 0, 0, 0, 0, 0, 71, 1, 71000, 100, 71, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0);
INSERT INTO `meh_items` (`id`, `Coins`, `Diamonds`, `Staff`, `House`, `Temp`, `Upg`, `ClassID`, `EnhID`, `FactionID`, `Cost`, `DPS`, `Lvl`, `Qty`, `QtyRemain`, `ReqClass`, `ReqCP`, `ReqRep`, `ReqItems`, `ReqFItems`, `Rty`, `Stk`, `Desc`, `Elmt`, `ES`, `Type`, `File`, `Icon`, `Link`, `Name`, `SkillID`, `PTR`, `ProcID`, `ReqQuests`, `QSindex`, `Meta`, `QSvalue`, `Rng`, `EnhPatternID`, `Class`, `Faction`, `bForgeRecipe`, `ForgeProduct`) VALUES
(810, 0, 0, 0, 0, 0, 0, 0, 72, 1, 72000, 100, 72, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(811, 0, 0, 0, 0, 0, 0, 0, 73, 1, 73000, 100, 73, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(812, 0, 0, 0, 0, 0, 0, 0, 74, 1, 74000, 100, 74, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(813, 0, 0, 0, 0, 0, 0, 0, 75, 1, 75000, 100, 75, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(814, 0, 0, 0, 0, 0, 0, 0, 51, 1, 51000, 100, 51, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(815, 0, 0, 0, 0, 0, 0, 0, 52, 1, 52000, 100, 52, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(816, 0, 0, 0, 0, 0, 0, 0, 53, 1, 53000, 100, 53, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(817, 0, 0, 0, 0, 0, 0, 0, 54, 1, 54000, 100, 54, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(818, 0, 0, 0, 0, 0, 0, 0, 55, 1, 55000, 100, 55, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(819, 0, 0, 0, 0, 0, 0, 0, 56, 1, 56000, 100, 56, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(820, 0, 0, 0, 0, 0, 0, 0, 57, 1, 57000, 100, 57, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(821, 0, 0, 0, 0, 0, 0, 0, 58, 1, 58000, 100, 58, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(822, 0, 0, 0, 0, 0, 0, 0, 59, 1, 59000, 100, 59, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(823, 0, 0, 0, 0, 0, 0, 0, 60, 1, 60000, 100, 60, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(824, 0, 0, 0, 0, 0, 0, 0, 61, 1, 61000, 100, 61, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(825, 0, 0, 0, 0, 0, 0, 0, 62, 1, 62000, 100, 62, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(826, 0, 0, 0, 0, 0, 0, 0, 63, 1, 63000, 100, 63, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(827, 0, 0, 0, 0, 0, 0, 0, 64, 1, 64000, 100, 64, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(828, 0, 0, 0, 0, 0, 0, 0, 65, 1, 65000, 100, 65, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(829, 0, 0, 0, 0, 0, 0, 0, 66, 1, 66000, 100, 66, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(830, 0, 0, 0, 0, 0, 0, 0, 67, 1, 67000, 100, 67, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(831, 0, 0, 0, 0, 0, 0, 0, 68, 1, 68000, 100, 68, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(832, 0, 0, 0, 0, 0, 0, 0, 69, 1, 69000, 100, 69, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(833, 0, 0, 0, 0, 0, 0, 0, 70, 1, 70000, 100, 70, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(834, 0, 0, 0, 0, 0, 0, 0, 71, 1, 71000, 100, 71, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(835, 0, 0, 0, 0, 0, 0, 0, 72, 1, 72000, 100, 72, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(836, 0, 0, 0, 0, 0, 0, 0, 73, 1, 73000, 100, 73, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(837, 0, 0, 0, 0, 0, 0, 0, 74, 1, 74000, 100, 74, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(838, 0, 0, 0, 0, 0, 0, 0, 75, 1, 75000, 100, 75, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(839, 0, 0, 0, 0, 0, 0, 0, 50, 1, 100000, 100, 50, 1, 0, -1, 0, 0, '710:1,694:1,693:1,692:1', '', 10, 1, 'These Ungodly Reavers of Miltonius is a powerful weapon used by the most savage fiends of Miltonius''s army.', 'Dark', 'Weapon', 'Dagger', 'items/polearms/MiltonPoolSecretdagger04.swf', 'iwdagger', 'MiltonPoolSecretdagger04', 'Ungodly Reavers of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(840, 0, 0, 0, 0, 0, 0, 0, 50, 1, 10000, 100, 50, 1, 0, -1, 0, 0, '711:1,694:1,693:1,692:1', '', 10, 1, 'These DragonBlades of Miltonius were wielded by an Archangel, before falling into the hands of the Archfiend and instantly becoming the ultimate blade of insanity.', 'Dark', 'Weapon', 'Dagger', 'items/swords/WarriorMiltonPool2.swf', 'iwdagger', 'WarriorMiltonPool2', 'Dual Dragonblades of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 0, 0, 0, 0, 0),
(841, 0, 0, 0, 0, 0, 0, 0, 60, 1, 10000, 100, 60, 1, 0, -1, 0, 0, '704:1,694:1,693:1,692:1', '', 10, 1, 'The almighty Overfiend Blades. Miltonius crafted this weapon a long time ago, twisting it into it''s demented state with the power of ungodly death.', 'Dark', 'Weapon', 'Dagger', '/items/swords/MiltoniusNulgathsword01.swf', 'iwdagger', 'MiltoniusNulgathsword01', 'Dual Overfiend Blade of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(842, 1, 0, 0, 0, 0, 0, 0, 1, 1, 350, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Miltonius ranks you Void Knight and bestows a portion of his power to you. You are enveloped by sinister magic and become a creature of destruction! And all this for just a small portion of your soul! The part you don''t need of course. (color custom: eyes, trim, accessory)', 'Dark', 'co', 'Armor', 'MiltonPool1_skin.swf', 'iwarmor', 'MiltonPool1', 'Void of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(845, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Nulgath says, "Perhaps wielding the arcane is more your style. Lightly armored, Hex Voids are the mystic breeds in my legion. They can decimate my enemies with black magic, elements, and curses."', 'Dark', 'co', 'Armor', 'MiltonPool2_skin.swf', 'iwarmor', 'MiltonPool2', 'Hex of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(846, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Nulgath says, "Perhaps a more low key occupation is more to your liking. Lightly armored, Blood Voids are hunter breed in my army. They hide in the shadows and stalk their prey, attacking the enemy where they least expect it. They are unscrupulous but very skilled assassins of my legion."', 'Dark', 'co', 'Armor', 'MiltonPool3_skin.swf', 'iwarmor', 'MiltonPool3', 'Blood of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(847, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Nulgath says, "Perhaps infiltration is more your style. Shadow Voids are beings of complete emptiness…They are the rogues and spies of my legion. Beware, you cannot come back once you''ve walked their path. The shadow is devoid of everything. You can''t trade what isn''t there."', 'Dark', 'co', 'Armor', 'MiltonPool5_skin.swf', 'iwarmor', 'MiltonPool5', 'Shadow of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(848, 1, 0, 0, 0, 0, 0, 0, 1, 1, 250, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The helm of the Blood Void. The Blood Void can see the enemies'' weakness.', 'None', 'he', 'Helm', 'items/helms/MiltonPoolBlood1.swf', 'iihelm', 'MiltonPoolBlood1', 'Blood Guard Of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(849, 1, 0, 0, 0, 0, 0, 0, 1, 1, 250, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The mask of the Hex Void. The Hex void manipulates energy to destroy his enemies.', 'None', 'he', 'Helm', 'items/helms/MiltonPoolHex1.swf', 'iihelm', 'MiltonPoolHex1', 'Hex Mask Of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(850, 1, 0, 0, 0, 0, 0, 0, 1, 1, 250, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'The face of the Shadow Void. To look into the Shadow Void is to look into nothingness.', 'None', 'he', 'Helm', 'items/helms/MiltonPoolShadow1.swf', 'iihelm', 'MiltonPoolShadow1', 'Shadow Guard of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(851, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'You gain more power earning the horns of reverence. The very shadows bow to your presence.', 'None', 'he', 'Helm', 'items/helms/MiltonPoolHelm1.swf', 'iihelm', 'MiltonPoolHelm1', 'Vestige of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(852, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Nulgath tells you this orb holds the power to transform your "Void of Nulgath" to a different breed.', 'None', 'pe', 'Pet', 'items/pets/MiltonPoolOrb4_2Aug10.swf ', 'iipet', 'MiltonPoolOrb4', 'Shadow Orb', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(853, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Nulgath tells you this orb holds the power to transform your "Void of Nulgath" to a different breed.', 'None', 'pe', 'Pet', 'items/pets/MiltonPoolOrb2_2Aug10.swf', 'iipet', 'MiltonPoolOrb2', 'Blood Orb', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(854, 1, 0, 0, 0, 0, 0, 0, 1, 1, 500, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Nulgath tells you this orb holds the power to transform your "Void of Nulgath" to a different breed', 'None', 'pe', 'Pet', 'items/pets/MiltonPoolOrb1_2Aug10.swf ', 'iipet', 'MiltonPoolOrb1', 'Arcane Orb', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(855, 0, 0, 0, 0, 0, 0, 0, 35, 1, 65000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'Enough fury to fuel a furnace. ERUPT in a fiery rage no creature can forget!', 'Fire', 'co', 'Armor', 'FireTank.swf', 'iwarmor', 'FireTank', 'Blazerun Tank', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(856, 0, 0, 0, 0, 0, 0, 0, 35, 1, 65000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'Destroy wave after wave of undesirables without a splash of sympathy', 'Water', 'co', 'Armor', 'WaterTank.swf', 'iwarmor', 'WaterTank', 'Vodarage Tank', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(857, 0, 0, 0, 0, 0, 0, 0, 35, 1, 35000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'Red Helm: The Red Ring of Death applies to a lot more than consoles''', 'None', 'he', 'Helm', 'items/helms/FireTankHelm1.swf', 'iihelm', 'FireTankHelm1', 'Horns of Flaming Fury', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(858, 0, 0, 0, 0, 0, 0, 0, 35, 1, 35000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'Drown your foe all the way to Davy Jones.', 'None', 'he', 'Helm', 'items/helms/WaterTankHelm1.swf', 'iihelm', 'WaterTankHelm1', 'Horns of the Raging Sea', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(859, 0, 0, 0, 0, 0, 0, 0, 35, 1, 30000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'May the flames be in your favor.', 'None', 'ba', 'Cape', 'items/capes/FireTankCape2.swf', 'iicape', 'FireTankCape2', 'Blazing Sigil Cape', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(860, 0, 0, 0, 0, 0, 0, 0, 35, 1, 30000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'May the waves be ever in your favor.', 'None', 'ba', 'Cape', 'items/capes/WaterTankCape2.swf', 'iicape', 'WaterTankCape2', 'Vodarage Sigil Cape', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(861, 0, 0, 0, 0, 0, 0, 0, 35, 1, 500000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'If your foes were employees they''d be fired.', 'Fire', 'Weapon', 'Polearm', 'items/polearms/FireTankWeapon.swf', 'iwpolearm', 'FireTankWeapon', 'Blazerun Beacon Staff', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(862, 0, 0, 0, 0, 0, 0, 0, 35, 1, 500000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'Making your enemies scream for KELP one slash at a time!', 'Water', 'Weapon', 'Polearm', 'items/polearms/WaterTankWeapon.swf', 'iwpolearm', 'WaterTankWeapon', 'Vodarage Beacon Staff', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(863, 0, 0, 0, 0, 0, 0, 0, 35, 1, 300000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'Red Helm: The Red Ring of Death applies to a lot more than consoles.', 'None', 'he', 'Helm', 'items/helms/FireTankHelm2.swf', 'iihelm', 'FireTankHelm2', 'Pyrric Crest Helm', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(864, 0, 0, 0, 0, 0, 0, 0, 35, 1, 30000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'Drown your foe all the way to Davy Jones.', 'None', 'he', 'Helm', 'items/helms/WaterTankHelm2.swf', 'iihelm', 'WaterTankHelm2', 'Tidal Crest Helm', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(865, 0, 0, 0, 0, 0, 0, 0, 35, 1, 55000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'Making your enemies scream for KELP one slash at a time!', 'Water', 'Weapon', 'Dagger', 'items/daggers/WaterTankAccoutrements.swf', 'iwdagger', 'WaterTankAccoutrements', 'Vodarage Accoutrements', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(866, 0, 0, 0, 0, 0, 0, 0, 35, 1, 55000, 100, 35, 1, 0, -1, 0, 0, '', '', 10, 1, 'If your foes were employees they\\''d be fired.', 'Fire', 'Weapon', 'Dagger', 'items/daggers/FireTankAccoutrements.swf', 'iwdagger', 'FireTankAccoutrements', 'Blazerun Accoutrements', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(868, 0, 0, 0, 0, 0, 0, 0, 70, 1, 50000, 100, 70, 1, 0, -1, 0, 0, '702:3', '', 10, 1, 'A mighty blade once used by a balrog, now infused and tainted with the Touch of Emoxus.', 'Dark', 'Weapon', 'Sword', '/items/swords/AnaxianBalrogBlade3.swf', 'iwsword', 'AnaxianBalrogBlade', 'Anaxian Blade of The Balrog', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(869, 0, 0, 0, 0, 0, 0, 0, 75, 1, 75000, 100, 75, 1, 0, -1, 0, 0, '868:1,702:3', '', 10, 1, 'A mighty blade once used by a balrog, now infused and tainted with the Touch of Emoxus.', 'Dark', 'Weapon', 'Dagger', '/items/swords/AnaxianBalrogBlade3.swf', 'iwdagger', 'AnaxianBalrogBlade', 'Anaxian Blades of The Balrog', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(870, 0, 0, 0, 0, 0, 0, 0, 50, 1, 350000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'Aye, even the Archfiend has his own fleet! No landlubbers allowed, Nulgath only wants the souls of the best Buccaneers in Lore. Savvy?', 'Dark', 'co', 'Armor', 'VoidPirate7r1.swf ', 'iwarmor', 'VoidPirate7', 'Void Naval Commander', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(871, 0, 0, 0, 0, 0, 0, 0, 50, 1, 100000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'Because when you''re plundering your enemy''s loot chest, SOMETIMES you just wanna look snazzy while doing it.', 'None', 'he', 'Helm', 'items/helms/VoidNavalHatM.swf', 'iihelm', 'VoidNavalHatM', 'Void Naval Tophat', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(872, 0, 0, 0, 0, 0, 0, 0, 50, 1, 100000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'Because when you''re plundering your enemy''s loot chest, SOMETIMES you just wanna look snazzy while doing it.', 'None', 'he', 'Helm', 'items/helms/VoidNavalHatF.swf', 'iihelm', 'VoidNavalHatF', 'Void Lass Tophat', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(873, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'A special version of Emoxus''s Balrog Blade, made only for those who upgraded at a certain time.', 'Dark', 'Weapon', 'Sword', '/items/swords/AzureBalrogBlade.swf', 'iwsword', 'AzureBalrogBlade', 'Azure Blade of The Balrog', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(874, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Emoxus created this armor for Odin, it''s Milton''s old Paragon Armor he created for Dage, with a little bit of The Touch of Emoxus imbued into it.', 'None', 'co', 'Armor', 'EmoxDageArmor.swf', 'iwarmor', 'EmoxDageArmor', 'Evoshi Proto Paragon', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(875, 0, 0, 0, 0, 0, 0, 0, 50, 1, 200000, 100, 50, 1, 0, -1, 0, 0, '', '', 10, 1, 'Ye be truly a gentlemen o'' fortune with this fine blade.', 'None', 'Weapon', 'Sword', 'items/swords/VoidPirateCaptainCutlass.swf ', 'iwsword', 'VoidPirateCaptainCutlass', 'Void Pirate Captain Cutlass', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(876, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Emoxus created this armor for Odin.', 'None', 'co', 'Armor', 'EInfernalFiendMiltonPool.swf', 'iwarmor', 'EInfernalFiendMiltonPool', 'Darkened Infernal Fiend', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(877, 0, 0, 0, 0, 0, 0, 0, 20, 1, 0, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, 'You are devoid of all emotion. You are death, bloody destruction. Go forth and serve your master.', 'None', 'co', 'Armor', 'RedHanzoVoid_skin.swf ', 'iwarmor', 'RedHanzoVoid', 'Blood Hanzo Void', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(878, 0, 0, 0, 0, 0, 0, 0, 20, 1, 0, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, 'Midnight signals the dawn of a new day. You decide who gets to be apart of it.', 'None', 'co', 'Armor', 'BlueHanzoVoid_skin.swf ', 'iwarmor', 'BlueHanzoVoid', 'Midnight Hanzo Void', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(879, 0, 0, 0, 0, 0, 0, 0, 20, 1, 0, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, 'All chances of weapons piercing this mask are Nul and void.', 'None', 'he', 'Helm', 'items/helms/RedHanzoVoidHorns.swf ', 'iihelm', 'RedHanzoVoidHelm', 'Blood Hanzo Void Mask', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(880, 0, 0, 0, 0, 0, 0, 0, 70, 1, 50000, 100, 70, 1, 0, -1, 0, 0, '702:3', '', 10, 1, 'A mighty mace once used by a balrog, now infused and tainted with the Touch of Emoxus.', 'Dark', 'Weapon', 'Mace', '/items/maces/AnaxianBalrogMace.swf', 'iwmace', 'AnaxianBalrogMace', 'Anaxian Mace of The Balrog', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(881, 0, 0, 0, 0, 0, 0, 0, 75, 1, 50000, 100, 75, 1, 0, -1, 0, 0, '702:3,880:1', '', 10, 1, 'Mighty maces once used by a balrog, now infused and tainted with the Touch of Emoxus.', 'Dark', 'Weapon', 'Dagger', '/items/maces/AnaxianBalrogMace.swf', 'iwdagger', 'AnaxianBalrogMace', 'Dual Anaxian Maces of The Balrog', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(882, 0, 0, 0, 0, 0, 0, 0, 70, 1, 50000, 100, 70, 1, 0, -1, 0, 0, '702:3', '', 10, 1, 'A Sharp-Edged Halberd, dipped in darkness and flames, with Emoxus''s imprint pushed into it''s being.', 'Dark', 'Weapon', 'Polearm', '/items/polearms/IngorgedBlazeHalbert.swf', 'iwpolearm', 'IngorgedBlazeHalbert', 'Ingorged Blaze Halberd', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(883, 0, 0, 0, 0, 0, 0, 0, 75, 1, 50000, 100, 75, 1, 0, -1, 0, 0, '702:3,882:1', '', 10, 1, 'Sharp-Edged Halberds, dipped in darkness and flames, with Emoxus''s imprint pushed into their beings.', 'Dark', 'Weapon', 'Dagger', '/items/polearms/IngorgedBlazeHalbert.swf', 'iwdagger', 'IngorgedBlazeHalbert', 'Dual Ingorged Blaze Halberds', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(884, 0, 0, 0, 0, 0, 0, 0, 20, 1, 0, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, '...', 'None', 'co', 'Armor', 'BSageofRev2.swf', 'iwarmor', 'BSageofRev', 'Battle Sage Void', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(885, 0, 0, 0, 0, 0, 0, 30, 15, 1, 25000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'Yarrr! Avast me hearty, this not be a class for ye lilly livered land lubbers.', 'None', 'ar', 'Class', 'pirate1_skin.swf ', 'iibook', 'Pirate1', 'Pirate', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(886, 0, 0, 0, 0, 0, 0, 31, 15, 1, 25000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'You have focused all of your considerable energy into mastering the art of fire magic. The flames are now yours to control!', 'None', 'ar', 'Class', 'PyroClassArmor.swf', 'iibook', 'PyroClassArmor', 'Pyromancer', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(887, 0, 0, 0, 0, 0, 0, 0, 20, 1, 0, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, '...', 'None', 'co', 'Armor', 'Darkwitch.swf', 'iwarmor', 'Darkwitch', 'Crimson Dark Witch', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(888, 0, 0, 0, 0, 0, 0, 0, 70, 1, 50000, 100, 70, 1, 0, -1, 0, 0, '702:3', '', 10, 1, 'Emoxus took the Void of Miltonius, and imbued it with holy power, completely contradicting itself, creating a null void.', 'Light', 'co', 'Armor', 'LightMiltonPool1.swf', 'iwarmor', 'LightMiltonPool1', 'Holy Void of Emoxus', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(889, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 100, 2, 1, 0, -1, 0, 0, '', '', 10, 1, '...', 'None', 'Weapon', 'Polearm', 'items/polearms/Upgrade2BlindingLightWeapon52.swf', 'iwpolearm', 'Upgrade2BlindingLightWeapon5', 'Darkened Shadow Scythe', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(890, 0, 0, 0, 0, 0, 0, 0, 20, 1, 0, 100, 20, 1, 0, -1, 0, 0, '', '', 10, 1, '...', 'None', 'he', 'Helm', 'items/helms/SageofRevHelm1.swf', 'iihelm', 'SageofRevHelm1', 'Odin''s Sage Void Helm', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(891, 0, 0, 0, 0, 0, 0, 0, 40, 1, 5000, 100, 40, 1, 0, -1, 0, 0, '703:1,702:1', '', 10, 1, 'Two of Miltonius'' personal blades. After his demise, Emoxus took the plans and brought them to his forge to make.', 'None', 'Weapon', 'Dagger', '/items/swords/MiltonPoolPhoenixSword03.swf', 'iwdagger', 'MiltonPoolPhoenixSword03', 'Dual Champion Blade of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 100, 2, 0, 0, 0, 0),
(893, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'DONT USE', 'None', 'DONT U', 'DONT USE', 'DONT USE', 'iwarmor', 'test', 'Test', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(894, 1, 0, 0, 0, 0, 0, 0, 12, 1, 1200, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Test', 'None', 'co', 'Armor', 'CloverStalker.swf', 'iwarmor', 'CloverStalker', 'Clover Stalker', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(895, 0, 0, 0, 0, 0, 0, 0, 20, 1, 35000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'The quarrels of men only fuel your fire. Let their fallen build your empire.', 'Dark', 'co', 'Armor', 'ObsidiaNecromancer.swf', 'iwarmor', 'ObsidiaNecromancer', 'Obsidia Necromancer', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(896, 0, 0, 0, 0, 0, 0, 0, 20, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Death has no control over those you cloak from his gaze.', 'None', 'ba', 'Cape', 'items/capes/ObsidiaWrap.swf', 'iicape', 'ObsidiaWrap', 'Obsidia Shroud', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(897, 0, 0, 0, 0, 0, 0, 0, 20, 1, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Have you ever considered a job in the film industry? Hear you''re great with re-animation.', 'None', 'he', 'Helm', 'items/helms/ObsidiaHood.swf', 'iihelm', 'ObsidiaHood', 'Obsidia Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(898, 0, 0, 0, 0, 0, 0, 0, 20, 1, 20000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Have you ever considered a job in the film industry? Hear you''re great with re-animation.', 'None', 'he', 'Helm', 'items/helms/ObsidiaSkull.swf', 'iihelm', 'ObsidiaSkull', 'Obsidia Skull', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(899, 0, 0, 0, 0, 0, 0, 0, 20, 1, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'You are the Ruler. And the resurrected? Mere servants.', 'Dark', 'Weapon', 'Staff', 'items/staves/CernunecrosStaff.swf', 'iwstaff', 'CernunecrosStaff', 'Cernunecros Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(900, 0, 0, 0, 0, 0, 0, 0, 20, 1, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'You are the Ruler. And the resurrected? Mere servants.', 'Dark', 'Weapon', 'Staff', 'items/staves/EyeOfTheFallenStaffr1.swf', 'iwstaff', 'EyeOfTheFallenStaff', 'Eye of the Fallen', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(901, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'You walk amongst the trees as their sole protector.', 'Light', 'co', 'Armor', 'Paladin_green.swf', 'iwarmor', 'Paladin_green', 'Chartreuse Paladin', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(902, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, '"By land or sea, I will protect thee."', 'Light', 'co', 'Armor', 'Paladin_blue.swf', 'iwarmor', 'Paladin_blue', 'Indigo Paladin', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(903, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Only certain Paladins are about to see the romance in war.', 'Light', 'co', 'Armor', 'Paladin_purple.swf', 'iwarmor', 'Paladin_purple', 'Violet Paladin', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(904, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'This red plate armor will awe your opponent with it''s bold color. You can only purchase this armor if you have earned the Paladin Class, not if you bought it.', 'Light', 'co', 'Armor', 'paladin2_skin.swf', 'iwarmor', 'Paladin2', 'Crimson Paladin Armor', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(905, 0, 0, 0, 0, 0, 0, 0, 60, 1, 250000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Charge into battle with this gilded helmet of the heavens!', 'Light', 'he', 'Helm', 'items/helms/ValorHighPriest4.swf', 'iihelm', 'ValorHighPriest4', 'Valor Domed Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(906, 0, 0, 0, 0, 0, 0, 0, 60, 1, 650000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'This armor has fallen from the gilded sky kingdoms.', 'Light', 'co', 'Armor', 'BlindingValor.swf', 'iwarmor', 'BlindingValor', 'Sanctified Armor', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(907, 0, 0, 0, 0, 0, 0, 0, 60, 1, 250000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The High priests of the sky kingdoms adorn themselves with these blessed, gold and crystal helms.', 'Light', 'he', 'Helm', 'items/helms/ValorHighPriest1.swf', 'iihelm', 'ValorHighPriest1', 'Valor High Priest', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(908, 0, 0, 0, 0, 0, 0, 0, 60, 1, 300000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'These wings are the highest honor given by the sky kingdom Gods.', 'Light', 'ba', 'Cape', 'items/capes/BlindingValorWings.swf', 'iicape', 'BlindingValorWings', 'Sanctified Wings', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(909, 0, 0, 0, 0, 0, 0, 0, 60, 1, 250000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Evil will never know the face of The Fallen, but Evil will remember their name!', 'Light', 'he', 'Helm', 'items/helms/TheFallensHood.swf', 'iihelm', 'TheFallensHood', 'Dark Hood of The Fallen', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(910, 0, 0, 0, 0, 0, 0, 0, 60, 1, 650000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Foes will want to make sure you stay down because if there is even just an ounce of breath left in a member of The Fallen, they will strike their enemies down with all of their might! EVIL WILL FALL AS THE FALLEN WILL RISE! This armor is color custom.', 'Light', 'co', 'Armor', 'TheFallen.swf', 'iwarmor', 'TheFallen', 'Plate of The Fallen', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(911, 0, 0, 0, 0, 0, 0, 0, 60, 1, 350000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The sword glows with a sacred brilliance, and the shield protects you with it''s power.', 'Light', 'Weapon', 'Dagger', 'items/daggers/BlindingValorSS.swf', 'iwdagger', 'BlindingValorSS', 'Sanctified Sword and Shield', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(912, 0, 0, 0, 0, 0, 0, 0, 60, 1, 350000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'This sacred sword pulses with divine power.', 'Light', 'Weapon', 'Sword', 'items/swords/SanctifiedSword.swf', 'iwsword', 'SanctifiedSword', 'Sanctified Sword', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(913, 0, 0, 0, 0, 0, 0, 0, 60, 1, 250000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Evil will never know the face of The Fallen, but they will always remember The Fallen''s smirk as their lives draw to an end!', 'Light', 'he', 'Helm', 'items/helms/TheFallensHood2.swf', 'iihelm', 'TheFallensHood2', 'Bright Hood of The Fallen', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(914, 0, 0, 0, 0, 0, 0, 0, 60, 1, 350000, 100, 10, 1, 0, -1, 0, 0, '', '', 10, 1, 'At the tip of this custom blade… EVIL WILL FALL', 'Light', 'Weapon', 'Sword', 'items/swords/FallensJustice.swf', 'iwsword', 'FallensJustice', 'Blade of The Fallen', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(915, 1, 0, 0, 0, 0, 0, 0, 50, 1, 1000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Being the ultimate lich king is no easy task. You need to work your way up from lich peasant, this can take a while.', 'Dark', 'co', 'Armor', 'ULK.swf', 'iwarmor', 'ULK', 'Ultimate Lich King', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(916, 1, 0, 0, 0, 0, 0, 0, 50, 1, 450, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'Putting the "Pro" in proto.', 'Dark', 'he', 'Helm', 'items/helms/ULKProtoParagonHelm.swf', 'iihelm', 'ULKProtoParagonHelm', 'Original Paragon Helm', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(917, 0, 0, 0, 0, 0, 0, 0, 40, 1, 100000, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'Stealth is the primary focus of a good assassin.  That and getting your target.', 'Light', 'co', 'Armor', 'LakenAssassin.swf', 'iwarmor', 'LakenAssassin', 'Cybernetic Assassin', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(918, 0, 0, 0, 0, 0, 0, 0, 40, 1, 100000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'Not your traditional Acolyte, these ones prefer to fight then talk.', 'Light', 'co', 'Armor', 'LakenAcolyte.swf', 'iwarmor', 'LakenAcolyte', 'Cybernetic Acolyte', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(919, 0, 0, 0, 0, 0, 0, 0, 40, 1, 75000, 100, 15, 1, 0, -1, 0, 0, '', '', 13, 1, 'You have one mission: Destroy.', 'Light', 'he', 'Helm', 'items/helms/LakenAcolyteHelmet3.swf', 'iihelm', 'LakenAcolyteHelmet3', 'Masked Combat Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(920, 0, 0, 0, 0, 0, 0, 0, 40, 1, 75000, 100, 20, 1, 0, -1, 0, 0, '', '', 13, 1, 'You have one mission: Destroy.', 'Light', 'he', 'Helm', 'items/helms/LakenAcolyteHelmet2.swf', 'iihelm', 'LakenAcolyteHelmet2', 'LD2 Combat Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(921, 0, 0, 0, 0, 0, 0, 0, 40, 1, 75000, 100, 25, 1, 0, -1, 0, 0, '', '', 13, 1, 'You have one mission: Destroy.', 'Light', 'he', 'Helm', 'items/helms/LakenAcolyteHelmet4.swf', 'iihelm', 'LakenAcolyteHelmet4', 'Combat Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(922, 0, 0, 0, 0, 0, 0, 0, 40, 1, 75000, 100, 35, 1, 0, -1, 0, 0, '', '', 13, 1, 'You have one mission: Destroy.', 'Light', 'he', 'Helm', 'items/helms/LakenAcolyteHelmet1.swf', 'iihelm', 'LakenAcolyteHelmet1', 'Cybernetic Acolyte Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(923, 0, 0, 0, 0, 0, 0, 0, 45, 1, 120000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'You will follow Laken the Good… Or else.', 'Light', 'co', 'Armor', 'LakenAdherent.swf', 'iwarmor', 'LakenAdherent', 'Laken Adherent', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(924, 0, 0, 0, 0, 0, 0, 0, 45, 1, 85000, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, 'You will follow Laken the Good… or else.', 'Light', 'he', 'Helm', 'items/helms/LakenAdherentHood.swf', 'iihelm', 'LakenAdherentHood', 'Laken Adherent Hood', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(925, 1, 0, 0, 0, 0, 0, 0, 45, 1, 1500, 100, 1, 1, 0, -1, 0, 0, '', '', 100, 1, 'Only true masters of the elements can cast lightning from their hands.', 'Light', 'Weapon', 'Dagger', 'items/daggers/MiltoniusLighting1.swf', 'iwdagger', 'MiltoniusLighting1', 'Lighting Orbs', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(926, 1, 0, 0, 0, 0, 0, 0, 45, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 100, 1000, 'Given to those who have completed a trade. Worth absolutely nothing.', 'None', 'Item', 'None', '', 'iibag', '', 'Trade Certificate', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(927, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 50, 1000, 'Awarded to you for winning in a duel.', 'None', 'None', 'Item', '', 'PvPTokenFull', '', 'PvP Token', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(928, 0, 0, 0, 0, 0, 0, 0, 76, 1, 76000, 100, 76, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(929, 0, 0, 0, 0, 0, 0, 0, 77, 1, 77000, 100, 77, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(930, 0, 0, 0, 0, 0, 0, 0, 78, 1, 78000, 100, 78, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(931, 0, 0, 0, 0, 0, 0, 0, 79, 1, 79000, 100, 79, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(932, 0, 0, 0, 0, 0, 0, 0, 80, 1, 80000, 100, 80, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(933, 0, 0, 0, 0, 0, 0, 0, 81, 1, 81000, 100, 81, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(934, 0, 0, 0, 0, 0, 0, 0, 82, 1, 82000, 100, 82, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(935, 0, 0, 0, 0, 0, 0, 0, 83, 1, 83000, 100, 83, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(936, 0, 0, 0, 0, 0, 0, 0, 84, 1, 84000, 100, 84, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(937, 0, 0, 0, 0, 0, 0, 0, 85, 1, 85000, 100, 85, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(938, 0, 0, 0, 0, 0, 0, 0, 86, 1, 86000, 100, 86, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(939, 0, 0, 0, 0, 0, 0, 0, 87, 1, 87000, 100, 87, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(940, 0, 0, 0, 0, 0, 0, 0, 88, 1, 88000, 100, 88, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(941, 0, 0, 0, 0, 0, 0, 0, 89, 1, 89000, 100, 89, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(942, 0, 0, 0, 0, 0, 0, 0, 90, 1, 90000, 100, 90, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(943, 0, 0, 0, 0, 0, 0, 0, 91, 1, 91000, 100, 91, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(944, 0, 0, 0, 0, 0, 0, 0, 92, 1, 92000, 100, 92, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(945, 0, 0, 0, 0, 0, 0, 0, 93, 1, 93000, 100, 93, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(946, 0, 0, 0, 0, 0, 0, 0, 94, 1, 94000, 100, 94, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(947, 0, 0, 0, 0, 0, 0, 0, 95, 1, 95000, 100, 95, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(948, 0, 0, 0, 0, 0, 0, 0, 96, 1, 96000, 100, 96, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(949, 0, 0, 0, 0, 0, 0, 0, 97, 1, 97000, 100, 97, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(950, 0, 0, 0, 0, 0, 0, 0, 98, 1, 98000, 100, 98, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(951, 0, 0, 0, 0, 0, 0, 0, 99, 1, 99000, 100, 99, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(952, 0, 0, 0, 0, 0, 0, 0, 100, 1, 100000, 100, 100, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic weapon enhancement taught to all warriors', 'None', 'Weapon', 'Enhancement', '', 'iidesign', '', 'Basic Weapon Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(953, 0, 0, 0, 0, 0, 0, 0, 76, 1, 76000, 100, 76, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(954, 0, 0, 0, 0, 0, 0, 0, 77, 1, 77000, 100, 77, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(955, 0, 0, 0, 0, 0, 0, 0, 78, 1, 78000, 100, 78, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(956, 0, 0, 0, 0, 0, 0, 0, 79, 1, 79000, 100, 79, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(957, 0, 0, 0, 0, 0, 0, 0, 80, 1, 80000, 100, 80, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(958, 0, 0, 0, 0, 0, 0, 0, 81, 1, 81000, 100, 81, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(959, 0, 0, 0, 0, 0, 0, 0, 82, 1, 82000, 100, 82, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(960, 0, 0, 0, 0, 0, 0, 0, 83, 1, 83000, 100, 83, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(961, 0, 0, 0, 0, 0, 0, 0, 84, 1, 84000, 100, 84, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(962, 0, 0, 0, 0, 0, 0, 0, 85, 1, 85000, 100, 85, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(963, 0, 0, 0, 0, 0, 0, 0, 86, 1, 86000, 100, 86, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(964, 0, 0, 0, 0, 0, 0, 0, 87, 1, 87000, 100, 87, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(965, 0, 0, 0, 0, 0, 0, 0, 88, 1, 88000, 100, 88, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(966, 0, 0, 0, 0, 0, 0, 0, 89, 1, 89000, 100, 89, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(967, 0, 0, 0, 0, 0, 0, 0, 90, 1, 90000, 100, 90, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(968, 0, 0, 0, 0, 0, 0, 0, 91, 1, 91000, 100, 91, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(969, 0, 0, 0, 0, 0, 0, 0, 92, 1, 92000, 100, 92, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(970, 0, 0, 0, 0, 0, 0, 0, 93, 1, 93000, 100, 93, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(971, 0, 0, 0, 0, 0, 0, 0, 94, 1, 94000, 100, 94, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(972, 0, 0, 0, 0, 0, 0, 0, 95, 1, 95000, 100, 95, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(973, 0, 0, 0, 0, 0, 0, 0, 96, 1, 96000, 100, 96, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(974, 0, 0, 0, 0, 0, 0, 0, 97, 1, 97000, 100, 97, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(975, 0, 0, 0, 0, 0, 0, 0, 98, 1, 98000, 100, 98, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(976, 0, 0, 0, 0, 0, 0, 0, 99, 1, 99000, 100, 99, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(977, 0, 0, 0, 0, 0, 0, 0, 100, 1, 100000, 100, 100, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic helm enhancement taught to all warriors', 'None', 'he', 'Enhancement', '', 'iihelm', '', 'Basic Helm Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(978, 0, 0, 0, 0, 0, 0, 0, 76, 1, 76000, 100, 76, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(979, 0, 0, 0, 0, 0, 0, 0, 77, 1, 77000, 100, 77, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(980, 0, 0, 0, 0, 0, 0, 0, 78, 1, 78000, 100, 78, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0);
INSERT INTO `meh_items` (`id`, `Coins`, `Diamonds`, `Staff`, `House`, `Temp`, `Upg`, `ClassID`, `EnhID`, `FactionID`, `Cost`, `DPS`, `Lvl`, `Qty`, `QtyRemain`, `ReqClass`, `ReqCP`, `ReqRep`, `ReqItems`, `ReqFItems`, `Rty`, `Stk`, `Desc`, `Elmt`, `ES`, `Type`, `File`, `Icon`, `Link`, `Name`, `SkillID`, `PTR`, `ProcID`, `ReqQuests`, `QSindex`, `Meta`, `QSvalue`, `Rng`, `EnhPatternID`, `Class`, `Faction`, `bForgeRecipe`, `ForgeProduct`) VALUES
(981, 0, 0, 0, 0, 0, 0, 0, 79, 1, 79000, 100, 79, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(982, 0, 0, 0, 0, 0, 0, 0, 80, 1, 80000, 100, 80, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(983, 0, 0, 0, 0, 0, 0, 0, 81, 1, 81000, 100, 81, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(984, 0, 0, 0, 0, 0, 0, 0, 82, 1, 82000, 100, 82, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(985, 0, 0, 0, 0, 0, 0, 0, 83, 1, 83000, 100, 83, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(986, 0, 0, 0, 0, 0, 0, 0, 84, 1, 84000, 100, 84, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(987, 0, 0, 0, 0, 0, 0, 0, 85, 1, 85000, 100, 85, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(988, 0, 0, 0, 0, 0, 0, 0, 86, 1, 86000, 100, 86, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(989, 0, 0, 0, 0, 0, 0, 0, 87, 1, 87000, 100, 87, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(990, 0, 0, 0, 0, 0, 0, 0, 88, 1, 88000, 100, 88, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(991, 0, 0, 0, 0, 0, 0, 0, 89, 1, 89000, 100, 89, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(992, 0, 0, 0, 0, 0, 0, 0, 90, 1, 90000, 100, 90, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(993, 0, 0, 0, 0, 0, 0, 0, 91, 1, 91000, 100, 91, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(994, 0, 0, 0, 0, 0, 0, 0, 92, 1, 92000, 100, 92, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(995, 0, 0, 0, 0, 0, 0, 0, 93, 1, 93000, 100, 93, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(996, 0, 0, 0, 0, 0, 0, 0, 94, 1, 94000, 100, 94, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(997, 0, 0, 0, 0, 0, 0, 0, 95, 1, 95000, 100, 95, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(998, 0, 0, 0, 0, 0, 0, 0, 96, 1, 96000, 100, 96, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(999, 0, 0, 0, 0, 0, 0, 0, 97, 1, 97000, 100, 97, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1000, 0, 0, 0, 0, 0, 0, 0, 98, 1, 98000, 100, 98, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1001, 0, 0, 0, 0, 0, 0, 0, 99, 1, 99000, 100, 99, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1002, 0, 0, 0, 0, 0, 0, 0, 100, 1, 100000, 100, 100, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic cape enhancement taught to all warriors', 'None', 'ba', 'Enhancement', '', 'iicape', '', 'Basic Cape Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1003, 0, 0, 0, 0, 0, 0, 0, 76, 1, 76000, 100, 76, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1004, 0, 0, 0, 0, 0, 0, 0, 77, 1, 77000, 100, 77, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1005, 0, 0, 0, 0, 0, 0, 0, 78, 1, 78000, 100, 78, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1006, 0, 0, 0, 0, 0, 0, 0, 79, 1, 79000, 100, 79, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1007, 0, 0, 0, 0, 0, 0, 0, 80, 1, 80000, 100, 80, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1008, 0, 0, 0, 0, 0, 0, 0, 81, 1, 81000, 100, 81, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1009, 0, 0, 0, 0, 0, 0, 0, 82, 1, 82000, 100, 82, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1010, 0, 0, 0, 0, 0, 0, 0, 83, 1, 83000, 100, 83, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1011, 0, 0, 0, 0, 0, 0, 0, 84, 1, 84000, 100, 84, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1012, 0, 0, 0, 0, 0, 0, 0, 85, 1, 85000, 100, 85, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1013, 0, 0, 0, 0, 0, 0, 0, 86, 1, 86000, 100, 86, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1014, 0, 0, 0, 0, 0, 0, 0, 87, 1, 87000, 100, 87, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1015, 0, 0, 0, 0, 0, 0, 0, 88, 1, 88000, 100, 88, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1016, 0, 0, 0, 0, 0, 0, 0, 89, 1, 89000, 100, 89, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1017, 0, 0, 0, 0, 0, 0, 0, 90, 1, 90000, 100, 90, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1018, 0, 0, 0, 0, 0, 0, 0, 91, 1, 91000, 100, 91, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1019, 0, 0, 0, 0, 0, 0, 0, 92, 1, 92000, 100, 92, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1020, 0, 0, 0, 0, 0, 0, 0, 93, 1, 93000, 100, 93, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1021, 0, 0, 0, 0, 0, 0, 0, 94, 1, 94000, 100, 94, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1022, 0, 0, 0, 0, 0, 0, 0, 95, 1, 95000, 100, 95, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1023, 0, 0, 0, 0, 0, 0, 0, 96, 1, 96000, 100, 96, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1024, 0, 0, 0, 0, 0, 0, 0, 97, 1, 97000, 100, 97, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1025, 0, 0, 0, 0, 0, 0, 0, 98, 1, 98000, 100, 98, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1026, 0, 0, 0, 0, 0, 0, 0, 99, 1, 99000, 100, 99, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1027, 0, 0, 0, 0, 0, 0, 0, 100, 1, 100000, 100, 100, 1, 0, -1, 0, 0, '', '', 10, 1, 'A basic class enhancement taught to all warriors', 'None', 'ar', 'Enhancement', '', 'iidesign', '', 'Basic Class Enhancement', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1028, 0, 0, 0, 0, 0, 0, 32, 15, 1, 25000, 100, 15, 1, 0, -1, 0, 0, '', '', 10, 1, 'A mighty bard', 'None', 'ar', 'Class', 'SpellSmith4.swf', 'iibook', 'SpellSmith', 'Bard', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1029, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '', 'Darkness', 'Weapon', 'Sword', 'items/swords/BloodDreadIron2.swf', 'iwsword', 'BloodDreadIron2', 'Crimson Iron', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(1030, 0, 1, 0, 0, 0, 0, 0, 80, 1, 15, 100, 80, 1, 0, -1, 0, 0, '', '', 10, 1, 'This sword was forged by a god, it absorbs the energy from other weapons when they touch, eventually it absorbed so much energy that it exploded, creating a shard floating weapon of despair.', 'Energy', 'Weapon', 'Sword', 'items/swords/ShardBuster.swf', 'iwsword', 'ShardBuster', 'Shard Buster', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(1031, 0, 1, 0, 0, 0, 0, 0, 80, 1, 35, 100, 80, 1, 0, -1, 0, 0, '', '', 10, 1, 'This powerful staff was wielded by the amazing sorcerer, Naga. A staff capable of tapping into every element, powerful enough to wipe out cities, and bring them back to life! ', 'Light', 'Weapon', 'Staff', 'items/staves/NagaStaff1.swf', 'iwstaff', 'NagaStaff', 'Naga Staff', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(1032, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 100, 1, 1, 0, -1, 0, 0, '', '', 10, 1, '...', 'None', 'he', 'Helm', 'items/helms/RedQueen5.swf', 'iihelm', 'RedQueen', 'Red Queen', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(1033, 0, 1, 0, 0, 0, 0, 0, 75, 1, 55, 100, 75, 1, 0, -1, 0, 0, '', '', 100, 1, 'A powerful rifleblade, capable of shootying blood bullets through any beast.', 'Darkness', 'Weapon', 'Sword', 'items/swords/ImarusPride.swf', 'iwsword', 'ImarusPride', 'Imarus Pride', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(1034, 0, 1, 0, 0, 0, 0, 0, 90, 1, 100, 100, 90, 1, 0, -1, 0, 0, '', '', 100, 1, 'Emoxus took the mighty Ungodly Reavers, and re-forged them into the horror that is the Ungodly Edge.', 'Darkness', 'Weapon', 'Sword', 'items/swords/UngodlyEdgeEmoxus2.swf', 'iwsword', 'UngodlyEdgeEmoxus', 'Ungodly Edge of Emoxus', 0, 0, -1, '', -1, 'undefined', 0, 0, 0, 0, 0, 0, 0),
(1035, 0, 0, 0, 0, 0, 0, 0, 20, 1, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The wisdom of our creed is revealed through these words.\r\nNo slight shall go unnoticed, no wound unavenged. I shall hunt my undying enemy to the ends of Lore.', 'Fire', 'co', 'Armor', 'FireWhiteAssassin.swf', 'iwarmor', 'FireWhiteAssassin', 'Bright FlameBlade Assassin', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1036, 0, 0, 0, 0, 0, 0, 0, 20, 1, 100000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Although normally considered as an ill omen, these Magi see the raven as a symbol of powerful magic. There is nothing common about this raven.', 'Dark', 'co', 'Armor', 'DarkRavenMage.swf', 'iwarmor', 'DarkRavenMage', 'Corvus Corax', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1037, 0, 0, 0, 0, 0, 0, 0, 20, 1, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The wisdom of our creed is revealed through these words.\r\nNo slight shall go unnoticed, no wound unavenged. I shall hunt my undying enemy to the ends of Lore.', 'Fire', 'co', 'Armor', 'FireBlackAssassin.swf', 'iwarmor', 'FireBlackAssassin', 'Dark FlameBlade Assassin', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1038, 0, 0, 0, 0, 0, 0, 0, 20, 1, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The wisdom of our creed is revealed through these words.\r\n1) Do not betray the Clan.\r\n2) Eye for an eye.\r\n3) Honor before revenge.', 'Ice', 'co', 'Armor', 'IceWhiteAssassin.swf', 'iwarmor', 'IceWhiteAssassin', 'Bright BitterHeart Assassin', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1039, 0, 0, 0, 0, 0, 0, 0, 20, 1, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The wisdom of our creed is revealed through these words.\r\n1) Do not betray the Clan.\r\n2) Eye for an eye.\r\n3) Honor before revenge.', 'Ice', 'co', 'Armor', 'IceBlackAssassin.swf', 'iwarmor', 'IceBlackAssassin', 'Dark BitterHeart Assassin', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1040, 0, 0, 0, 0, 0, 0, 0, 20, 1, 70000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'An axe burning with desire.', 'Fire', 'Weapon', 'Axe', 'items/axes/FireAssassinAxe.swf', 'iwaxe', 'FireAssassinAxe', 'FlameBlade Axe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1041, 0, 0, 0, 0, 0, 0, 0, 20, 1, 70000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A blade as cold as your icy heart.', 'Ice', 'Weapon', 'Axe', 'items/axes/IceAssassinAxe.swf', 'iwaxe', 'IceAssassinAxe', 'BitterHeart Axe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1042, 0, 0, 0, 0, 0, 0, 0, 20, 1, 57000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The heat from these will keep the most reclusive assassin warm.', 'Fire', 'ba', 'Cape', 'items/capes/FireWhiteAssassinSwordsCape.swf', 'iicape', 'FireWhiteAssassinSwordsCape', 'Bright FlameBlade Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1043, 0, 0, 0, 0, 0, 0, 0, 20, 1, 57000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The heat from these will keep the most reclusive assassin warm.', 'Fire', 'ba', 'Cape', 'items/capes/FireWhiteAssassinSwordCape.swf', 'iicape', 'FireWhiteAssassinSwordCape', 'Bright Sheathed Bitter Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1044, 0, 0, 0, 0, 0, 0, 0, 20, 1, 57000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The heat from these will keep the most reclusive assassin warm.', 'Fire', 'ba', 'Cape', 'items/capes/FireBlackAssassinSwordCape.swf', 'iicape', 'FireBlackAssassinSwordCape', 'Sheathed FlameBlade Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1045, 0, 0, 0, 0, 0, 0, 0, 20, 1, 59000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'This cape mimics the shaggy feathers around the birds neck.', 'Dark', 'ba', 'Cape', 'items/capes/RavenCape.swf', 'iicape', 'RavenCape', 'Feathered Corvic Wrap', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1046, 0, 0, 0, 0, 0, 0, 0, 20, 1, 57000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Solitary is the life of the assassin, the BitterHeart assassins know this better than no other.', 'Ice', 'ba', 'Cape', 'items/capes/IceWhiteAssassinSwordCape.swf', 'iicape', 'IceWhiteAssassinSwordCape', 'Bright BitterHeart Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1047, 0, 0, 0, 0, 0, 0, 0, 20, 1, 57000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Solitary is the life of the assassin, the BitterHeart assassins know this better than no other.', 'Ice', 'ba', 'Cape', 'items/capes/IceBlackAssassinSwordCape.swf', 'iicape', 'IceBlackAssassinSwordCape', 'Dark BitterHeart Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1048, 0, 0, 0, 0, 0, 0, 0, 20, 1, 57000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Solitary is the life of the assassin, the BitterHeart assassins know this better than no other.', 'Ice', 'ba', 'Cape', 'items/capes/IceWhiteAssassinSwordsCape.swf', 'iicape', 'IceWhiteAssassinSwordsCape', 'Bright BitterHeart Blades', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1049, 0, 0, 0, 0, 0, 0, 0, 20, 1, 70000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A true assassin is never without a weapon.', 'Fire', 'Weapon', 'Dagger', 'items/daggers/FireAssassinHiddenBlade.swf', 'iwdagger', 'FireAssassinHiddenBlade', 'FlameBlade Concealed Dagger', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1050, 0, 0, 0, 0, 0, 0, 0, 20, 1, 70000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A true assassin is never without a weapon.', 'Ice', 'Weapon', 'Dagger', 'items/daggers/IceAssassinHiddenBlade.swf', 'iwdagger', 'IceAssassinHiddenBlade', 'BitterHeart Concealed Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1051, 0, 0, 0, 0, 0, 0, 0, 20, 1, 70000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'That''s SO Raven (themed of a weapon)!', 'Dark', 'Weapon', 'Dagger', 'items/daggers/RavenSkullDagger.swf', 'iwdagger', 'RavenSkullDagger', 'Dual Corax Daggers', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1052, 0, 0, 0, 0, 0, 0, 0, 20, 1, 62000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Those who betray must be purified before all others', 'Fire', 'Weapon', 'Gun', 'items/guns/FireAssassinFlintlock.swf', 'iwgun', 'FireAssassinFlintlock', 'FlameBlade Flintlock', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1053, 0, 0, 0, 0, 0, 0, 0, 20, 1, 62000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'May your have mercy on your....wait nevermind.', 'Ice', 'Weapon', 'Gun', 'items/guns/IceAssassinFlintlock.swf', 'iwgun', 'IceAssassinFlintlock', 'BitterHeart Flintlock', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1056, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Ensure you strike fear in those who see you.', 'Fire', 'he', 'Helm', 'items/helms/FireWhiteAssassinHoodM.swf', 'iihelm', 'FireWhiteAssassinHoodM', 'Bright FlameBladet Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1057, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Ensure you strike fear in those who see you.', 'Fire', 'he', 'Helm', 'items/helms/FireWhiteAssassinHoodF.swf', 'iihelm', 'FireWhiteAssassinHoodF', 'Bright FlameBlade Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1058, 0, 0, 0, 0, 0, 0, 0, 20, 1, 53000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The large curved bill gives this mask an intimidating look.  You''ll ruffle plenty of feathers.', 'Dark', 'he', 'Helm', 'items/helms/DarkRavenMageHoodMask.swf', 'iihelm', 'DarkRavenMageHoodMask', 'Corvus Mystic Mask', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1059, 0, 0, 0, 0, 0, 0, 0, 20, 1, 53000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Cloaked in mystery, Corax Mystics keep their plans to soar a clan secret.', 'Dark', 'he', 'Helm', 'items/helms/DarkRavenMageHood.swf', 'iihelm', 'DarkRavenMageHood', 'Corax Mystic Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1060, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Ensure you strike fear in those who see you.', 'Fire', 'he', 'Helm', 'items/helms/FireBlackAssassinHoodM.swf', 'iihelm', 'FireBlackAssassinHoodM', 'Dark FlameBlade Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1061, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Ensure you strike fear in those who see you.', 'Fire', 'he', 'Helm', 'items/helms/FireBlackAssassinHoodF.swf', 'iihelm', 'FireBlackAssassinHoodF', 'Dark FlameBlade Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1062, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A bitterheart must never speak to it''s prey.', 'Ice', 'he', 'Helm', 'items/helms/IceWhiteAssassinHoodM.swf', 'iihelm', 'IceWhiteAssassinHoodM', 'Bright BitterHeart Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1063, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A bitterheart must never speak to it''s prey.', 'Ice', 'he', 'Helm', 'items/helms/IceWhiteAssassinHoodF.swf', 'iihelm', 'IceWhiteAssassinHoodF', 'Bright BitterHeart Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1064, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A bitterheart must never speak to it''s prey.', 'Ice', 'he', 'Helm', 'items/helms/IceBlackAssassinHoodM.swf', 'iihelm', 'IceBlackAssassinHoodM', 'Dark BitterHeart Hood', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1065, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A bitterheart must never speak to it''s prey.', 'Ice', 'he', 'Helm', 'items/helms/IceBlackAssassinHoodF.swf', 'iihelm', 'IceBlackAssassinHoodF', 'Dark BitterHeart Locks', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1066, 0, 0, 0, 0, 0, 0, 0, 20, 1, 50000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Do you know why the caged bird sings?  It wants out!', 'Dark', 'Weapon', 'Mace', 'items/maces/RavenCage.swf', 'iwmace', 'RavenCage', 'Caged Bird Mace', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1067, 0, 0, 0, 0, 0, 0, 0, 20, 1, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A bird should never be caged, this staff symbolizes their freedom.', 'Dark', 'Weapon', 'Staff', 'items/staves/BirdCageStaff.swf', 'iwstaff', 'BirdCageStaff', 'Mystic Corax Staff', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1068, 0, 0, 0, 0, 0, 0, 0, 20, 1, 69500, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'That''s SO Raven (themed of a weapon)!', 'Dark', 'Weapon', 'Sword', 'items/swords/RavenSkullSword.swf', 'iwsword', 'RavenSkullSword', 'Corvus Piercer Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1069, 0, 0, 0, 0, 0, 0, 0, 20, 1, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A flicker of flame, then darkness.  Your enemies won''t know what hit them.', 'Fire', 'Weapon', 'Sword', 'items/swords/FireAssassinSword.swf', 'iwsword', 'FireAssassinSword', 'FlameBlade''s Fury', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1070, 0, 0, 0, 0, 0, 0, 0, 20, 1, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Completed by an ill-tempered weaponsmith who wanted more money than offered, this weapon provokes bitterness.', 'Ice', 'Weapon', 'Sword', 'items/swords/IceAssassinSword.swf', 'iwsword', 'IceAssassinSword', 'Dark BitterHeart''s Rage', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1071, 0, 1, 0, 0, 0, 0, 0, 100, 1, 16, 100, 100, 1, 0, -1, 0, 0, '1034:1,702:10', '', 100, 1, 'Emoxus took the mighty Ungodly Reavers, and re-forged them into the horror that is the Ungodly Edge.', 'Darkness', 'Weapon', 'Dagger', 'items/swords/UngodlyEdgeEmoxus2.swf', 'iwsword', 'UngodlyEdgeEmoxus', 'Dual Ungodly Edge of Emoxus', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1072, 0, 1, 0, 0, 0, 0, 0, 85, 1, 8, 100, 85, 1, 0, -1, 0, 0, '702:3', '', 100, 1, 'Emoxus ripped a mighty Archfiend into pieces, and used his bones, skin, and blood to create this dastardly weapon.', 'Darkness', 'Weapon', 'Sword', 'items/swords/DementedFiendBlade.swf', 'iwsword', 'DementedFiendBlade', 'Demented Fiend Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1073, 0, 1, 0, 0, 0, 0, 0, 90, 1, 12, 100, 90, 1, 0, -1, 0, 0, '702:3,1072:1', '', 100, 1, 'Emoxus ripped a mighty Archfiend into pieces, and used his bones, skin, and blood to create this dastardly weapon.', 'Darkness', 'Weapon', 'Dagger', 'items/swords/DementedFiendBlade.swf', 'iwdagger', 'DementedFiendBlade', 'Dual Demented Fiend Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1074, 0, 0, 0, 0, 0, 0, 0, 45, 1, 20000, 100, 45, 1, 0, -1, 0, 0, '702:3,707:1', '', 10, 1, 'The blade of the Blood Void.', 'None', 'Weapon', 'Dagger', '/items/daggers/BloodletterOrigCC-4Dec13.swf', 'iwdagger', 'BloodletterOirgCC', 'Bloodletters of Miltonius', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1075, 1, 0, 0, 0, 0, 0, 0, 75, 1, 650, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'If intervening in important battles was an olympic sport, Golden Gladiators would win the gold meddle.', 'Light', 'co', 'Armor', 'GoldenGladiator.swf', 'iwarmor', 'GoldenGladiator', 'Golden Gladiator', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1076, 1, 0, 0, 0, 0, 0, 0, 75, 1, 300, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Your cape might as well remind enemies what their remains will looks like after engaging you in battle.', 'Light', 'ba', 'Cape', 'items/capes/GoldenGladiatorRedCape.swf', 'iicape', 'GoldenGladiatorRedCape', 'Crimson Cape of Victory', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1077, 1, 0, 0, 0, 0, 0, 0, 75, 1, 300, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Because two swords are always better than one.', 'Light', 'ba', 'Cape', '/items/capes/GoldenGladiatorSwordsCape.swf', 'iicape', 'GoldenGladiatorSwordCape', 'Crossed Gladius Blades Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1078, 1, 0, 0, 0, 0, 0, 0, 75, 1, 250, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Sure gold may not be as strong as let’s say, topaz, but it’s all about the aesthetics. Right?', 'Light', 'he', 'Helm', 'items/helms/GoldenGladiatorHelmet2.swf', 'iihelm', 'GoldenGladiatorHelmet', 'Golden Gladiator Helmet', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1079, 1, 0, 0, 0, 0, 0, 0, 75, 1, 350, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Both the the light handle and gold handle variants:\r\nThe only way to truly defeat any opponent is to cut off their legs.', 'Light', 'Weapon', 'Sword', 'items/swords/GoldenGladiatorSword.swf', 'iwsword', 'GoldenGladiatorSword', 'Gilded Gladius Blade', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1080, 1, 0, 0, 0, 0, 0, 0, 75, 1, 350, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Both the the light handle and gold handle variants:\r\nThe only way to truly defeat any opponent is to cut off their legs.', 'Light', 'Weapon', 'Sword', 'items/swords/GoldenMagiskaSword.swf', 'iwsword', 'GoldenMagiskaSword', 'Golden Magiska Gladius', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1081, 0, 0, 0, 0, 0, 0, 0, 30, 1, 75000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'Zhilo''s battle-hardened suit of blue and white plate. It has saved him from dozens of near-fatal attacks. May it do the same for you.', 'Light', 'co', 'Armor', 'BTAMaster.swf', 'iwarmor', 'BTAMaster', 'Battle Tested Axe Master', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1082, 0, 0, 0, 0, 0, 0, 0, 30, 1, 65000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'A time-tested axe, dented and worn with the stress of hundreds of battles. A trusted companion to Zhilo, this axe now resides with you. May it see another hundred battles and more.', 'Light', 'Weapon', 'Axe', 'items/axes/ZhiloAxe.swf', 'iwaxe', 'ZhiloAxe', 'Zhilo''s Axe', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1083, 0, 0, 0, 0, 0, 0, 0, 30, 1, 48000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'The plume on this helm denotes extreme bravery in battle. Only the finest Heroes, most skilled warriors, are awarded this white crest for their helm. It is a point of pride to keep the feathers spotlessly white, even in the midst of a bloody battle.', 'Light', 'he', 'Helm', 'items/helms/BTAMasterHelm.swf', 'iihelm', 'BTAMasterHelm', 'Battle Tested Helm', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1084, 0, 0, 0, 0, 0, 0, 0, 30, 1, 48000, 100, 1, 1, 0, -1, 0, 0, '', '', 13, 1, 'You now have the same hair-do as Zhilo himself! Though it stayed the same color, for some reason one part turned white.', 'Light', 'he', 'Helm', 'items/helms/BTAMasteZhilo.swf', 'iihelm', 'BTAMasteZhilo', 'Zhilo Hairstyle', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1085, 0, 0, 0, 0, 0, 0, 0, 80, 1, 1200000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Channel the fury inside you to control ANY enemy who opposes you! Rule over the other heroes, warlords, and adventurers who battle though Lore!', 'Light', 'co', 'Armor', 'AsguardianGold2-1Oct13.swf', 'iwarmor', 'AsguardianGold', 'Golden Fury', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1086, 0, 0, 0, 0, 0, 0, 0, 80, 1, 1000000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Use the spear Gungnir to begin - or END - all of the wars you take part in.', 'Light', 'Weapon', 'Polearm', 'items/staves/Gungnir.swf', 'iwpolearm', 'Gungnir', 'Gungnir', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1087, 0, 0, 0, 0, 0, 0, 0, 80, 1, 850000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Channel the fury inside you to control ANY enemy who opposes you! Rule over the other heroes, warlords, and adventurers who battle though Lore!', 'Light', 'ba', 'Cape', 'items/capes/AsguardianGoldCape-6Jun13.swf', 'iicape', 'AsguardianGoldCape3', 'Golden Fury Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1088, 0, 0, 0, 0, 0, 0, 0, 80, 1, 650000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Channel the fury inside you to control ANY enemy who opposes you! Rule over the other heroes, warlords, and adventurers who battle though Lore!', 'Light', 'he', 'Helm', 'items/helms/AsguardianGoldHelmBlackout.swf', 'iihelm', 'AsguardianGoldHelmBlackout', 'Golden Fury Mask', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1089, 0, 0, 0, 0, 0, 0, 0, 70, 1, 650000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Lore will not fall… as long as a Hero with Kezeroth the Worldsaver''s loyalty and honor still battles in Lore!', 'Nature', 'co', 'Armor', 'KezerothWorldSaverArmor.swf', 'iwarmor', 'KezerothWorldSaverArmor', 'Kezeroth the Worldsaver', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1090, 0, 0, 0, 0, 0, 0, 0, 20, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'The heat of the Summer sun drives a Fire Dancer to battle-frenzy! Equip this armor to feel your blood boil as your blades flashes in the sunlight!', 'Fire', 'co', 'Armor', 'FireDancer.swf', 'iwarmor', 'FireDancer', 'Fire Dancer', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1091, 0, 0, 0, 0, 0, 0, 0, 70, 1, 530000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Carry the forest wherever you go, and none with evil intentions shall harm you!', 'Nature', 'ba', 'cape', 'items/capes/KezerothWorldSaverCape.swf', 'iicape', 'KezerothWorldSaverCape', 'Forest''s Blessing Cloak', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1092, 0, 0, 0, 0, 0, 0, 0, 70, 1, 500000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Where ancient trees climb high, you roam. Where creatures of the forest run, you rule.', 'Nature', 'he', 'Helm', 'items/helms/KezerothWorldSaverHelm.swf', 'iihelm', 'KezerothWorldSaverHelm', 'Lord of the Forest', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1093, 0, 0, 0, 0, 0, 0, 0, 30, 1, 35000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'The clothing of royalty! You really make a fashion statement to webcomics everywhere.', 'Nature', 'co', 'Armor', 'Ethan.swf', 'iwarmor', 'Ethan', 'Ethan''s Kingly Attire', 0, 0, -1, '', -1, 'undefined', 0, 10, 0, 0, 0, 0, 0),
(1094, 0, 0, 0, 0, 0, 0, 0, 30, 1, 25000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Hey! You look just like Ethan from Ctrl+Alt+Del!', 'Nature', 'he', 'Helm', 'items/helms/ethanhair.swf', 'iihelm', 'EthanHair', 'Ethan Hair', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1095, 0, 0, 0, 0, 0, 0, 0, 30, 1, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'A terrycloth towel cape fit for a king!', 'Nature', 'ba', 'cape', 'items/capes/CADCape.swf', 'iicape', 'CADCape', 'Ethan''s Cape', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1096, 0, 0, 0, 0, 0, 0, 0, 30, 1, 30000, 100, 1, 1, 0, -1, 0, 0, '', '', 30, 1, 'Wasn''t Ethan looking for his Winter-een-mass Crown? He should have checked your inventory first.', 'Nature', 'he', 'Helm', 'items/helms/EthanCrown.swf', 'iihelm', 'EthanCrown', 'Ethan''s Crown', 0, 0, -1, '', -1, 'undefined', 0, 10, 1, 0, 0, 0, 0),
(1097, 1, 0, 0, 0, 0, 0, 0, 1, 1, 10000, 100, 1, 1, 15, -1, 0, 0, '0', '', 10, 1, 'By:Breker', 'None', 'pe', 'Pet', 'items/pets/BrekerShadowLord.swf', 'iipet', 'BrekerShadowLord', 'Shadow Lord Pet (Breker)', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0),
(9998, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 15, 1, 1, 0, 0, 0, 0, '', '', 10, 1, 'Now your HANDS are the deadly weapon!', 'Nature', 'Weapon', 'Unarmed', 'items/maces/blank.swf', 'iwmace', 'Unarmed', 'Unarmed', 0, 0, 0, '', 0, '0', 0, 30, 2, 0, 0, 0, 0),
(986444, 1, 0, 0, 0, 0, 0, 0, 1, 1, 15000, 100, 1, 1, 20, -1, 0, 0, '0', '', 10, 1, 'By:Breker', 'None', 'pe', 'Pet', 'items/pets/BrekerShadowLord.swf', 'iipet', 'BrekerShadowLord', 'Shadow Lord Pet (Breker)', 0, 0, -1, '', -1, 'undefined', 0, 100, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meh_items_shops`
--

CREATE TABLE `meh_items_shops` (
  `id` smallint(3) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Items` mediumtext NOT NULL,
  `Field` varchar(20) NOT NULL DEFAULT '',
  `Staff` tinyint(1) NOT NULL DEFAULT '0',
  `Upgrade` tinyint(1) NOT NULL DEFAULT '0',
  `House` tinyint(1) NOT NULL DEFAULT '0',
  `Limited` tinyint(1) NOT NULL DEFAULT '0',
  `Level` int(11) NOT NULL,
  `Enhancement` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meh_items_shops`
--

INSERT INTO `meh_items_shops` (`id`, `Name`, `Items`, `Field`, `Staff`, `Upgrade`, `House`, `Limited`, `Level`, `Enhancement`) VALUES
(0, 'Yulgar Shop Test', '457,456,454,453,450,449,448,447,446,445,444,443,455,452,451', '', 1, 0, 0, 0, 1, 0),
(1, 'Newbie Shop', '48,49,50,51,52', '', 0, 0, 0, 0, 1, 0),
(2, 'Shop of the Phoenix', '80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,126,127,128,129,130,131,132,133,134,135,136,137,138,139,353,354,355,356,358,360,361,362,363,364,365,366,367,412,413,414,415,416,417,418,419,420,421,422,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,472,473,474,475,476,477,478,479,480,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,872,871,870,875,915,916,842', '', 0, 0, 0, 0, 2, 0),
(3, 'Alden''s Renowned Shop', '26,27,28,29,30,31,32,35,58,59,60,61,62,63,64', '', 0, 0, 0, 0, 1, 0),
(4, 'Shop of the Order', '144,145,146,147,148,149,150,440,441,442,659,660,661,662,925,1030,1031,1033,1034', '', 0, 0, 0, 0, 1, 0),
(5, 'Alden''s Class Shop', '1,2,3,4,5,13,15,16,17,18,19,23,24,33,34,36,37,38,39,40,588,568,580,582,886,885,585,586,590,572,570', '', 0, 0, 0, 0, 1, 0),
(10, 'Masamune''s Shop', '112,113,114,115,116,117,118,119,120,142,143,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,76,411', '', 0, 0, 0, 0, 1, 0),
(12, 'Aria''s Pet Shop', '667,668,669,670,671,672,673,674,675,676,676,678,679,680,681,682,683,684,685', '', 0, 0, 0, 0, 1, 0),
(13, 'Robe Shop', '104,105,106,107,108,109,110,111,121,122,123,124,125,140,141,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392', '', 0, 0, 0, 0, 1, 0),
(15, 'Enhancement Shop', '', '', 0, 0, 0, 0, 2, 1),
(16, 'Weapon Shop', '455,452,451,471,467,899,900,1066,1067,1068,1069,1070,1049,1050,1051,1052,1053,1041,1040', '', 0, 0, 0, 0, 1, 0),
(19, 'Jessor''s Wares', '492,493,494,495,496,497,498,499,501,502,503,543,542,541,540,556,557,562,563,617,626,628,629,634,635,637,639,640,641,643,646,648,649,650', '', 0, 0, 0, 0, 0, 0),
(22, 'Castle Armory', '516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,553,552,551,550,549,548,547,546,545,560,561,559,616,615,619,627,636,618,647,614,638,645,642,644,905,906,907,908,909,910,911,912,913,914,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1091,1092', '', 0, 0, 0, 0, 1, 0),
(23, 'Enlightened Armory', '504,505,506,507,508,509,510,511,512,513,534,535,536,537,538,544,539,554,555,558,630,631,620,612,613,633,632,621,622,623,624,625,610,611,576,651,652,653,654,655,901,902,903,904', '', 0, 0, 0, 0, 1, 0),
(24, 'Wheel of Fortune Tickets', '569', '', 0, 0, 0, 0, 0, 0),
(41, 'Armor Shop', '443,444,445,446,447,448,449,450,453,454,456,457,459,460,461,462,464,465,468,469,470,895,896,897,898,917,918,919,920,921,922,923,924,1035,1036,1037,1038,1039,1042,1043,1044,1045,1046,1047,1048,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1090,1093,1094,1095,1096', '', 0, 0, 0, 0, 1, 0),
(50, 'Forsaken Shop', '716,717,718,719,720,721,722,723,724', '', 0, 0, 0, 0, 10, 0),
(98, 'Shop of Elursuxome', '725,726,727,728,729,730,731,732,733,734,735,736,737,839,840,841,868,869,880,881,882,883,888,891,1071,1072,1073,1074', '', 0, 0, 0, 0, 20, 0),
(476, 'Suggestion Shop', '481,489,609', '', 0, 0, 0, 0, 0, 0),
(987, 'Breker', '1097', '', 1, 0, 0, 0, 0, 0),
(998, 'SetTestShop', '612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650', '', 1, 0, 0, 0, 1, 0),
(999, 'Test Shop', '568,570,571,572,573,574,575,576,579,580,582,584,585,586,587,588,589,590,607,608', '', 1, 0, 0, 0, 1, 0),
(9000, 'Shop of Madafi', '576,651,652,653,654,655,656,657', '', 1, 0, 0, 0, 1, 0),
(12345, 'Graxus'' Testing Shop', '1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096', '', 0, 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meh_maps`
--

CREATE TABLE `meh_maps` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `Name` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `Label` varchar(64) NOT NULL,
  `FileName` varchar(120) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `PlayersMax` smallint(2) NOT NULL DEFAULT '10',
  `ReqLevel` smallint(2) NOT NULL DEFAULT '1',
  `MapItems` varchar(120) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `monsters_info` text NOT NULL,
  `monsters_tree` text NOT NULL,
  `monsters_frame` text CHARACTER SET latin1 NOT NULL,
  `Extra` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `pvpMap` tinyint(1) NOT NULL DEFAULT '0',
  `pkArea` tinyint(1) NOT NULL DEFAULT '0',
  `staffOnly` tinyint(1) NOT NULL DEFAULT '0',
  `memberOnly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_maps`
--

INSERT INTO `meh_maps` (`id`, `Name`, `Label`, `FileName`, `PlayersMax`, `ReqLevel`, `MapItems`, `monsters_info`, `monsters_tree`, `monsters_frame`, `Extra`, `pvpMap`, `pkArea`, `staffOnly`, `memberOnly`) VALUES
(1, 'battleon', 'battleon', 'Battleon/OrakleBattleonR10.swf', 12, 2, '', '', '', '', '', 0, 0, 0, 0),
(2, 'teleport', 'teleport', 'Battleon/teleportmap_2.swf', 10, 1, '', '', '', '', '', 0, 0, 0, 0),
(3, 'intro', 'Intro', 'Battleon/town-intro.swf', 10, 1, '', '', '', '', '', 0, 0, 0, 0),
(4, 'Tutorial', 'Tutorial', 'Battleon/OrakleTut2.swf', 10, 1, '', '1,4,5', '1,1,1,4,4,4,5,1,1', 'r2,r5,r5,r5,r5,r6,r6,r2,r4 ', '', 0, 0, 0, 0),
(5, 'Sunsetgrove', 'Sunset Grove', 'battleon/newbieR1-15.swf', 10, 1, '', '7,8,9,10', '9,10,8,9,10,8,10,8,10,7', 'Enter,Enter,r2,r2,r4,r5,r5,r5,r5,r6', '', 0, 0, 0, 0),
(6, 'Battleontown', 'Battleon Town', 'battleon/OrakleBattleonTownR16.swf', 12, 1, '', '', '', '', '', 0, 0, 0, 0),
(7, 'Yulgar', 'Inn', 'battleon/BakaInn1.swf', 12, 2, '', '', '', '', '', 0, 0, 0, 0),
(8, 'Trainers', 'Trainers', 'Battleon/BakaTrainersR.swf', 10, 1, '', '', '', '', '', 0, 0, 0, 0),
(9, 'Runedwoods', 'Runed Woods', 'Battleon/RunedWoodsR1.swf', 10, 1, '', '11,12,13,14,15', '12,12,11,13,11,13,14,12,13,14,11,11,14,12,14,13,13,14,11,14,13,11,14,14,15,11,13,14', 'r1,r1,r2,r2,r3,r3,r3,r4,r4,r4,r5,r5,r5,r6,r6,r6,r7,r7,r7,r8,r8,r8,r9,r9,r10,r11,r11,11', '', 0, 0, 0, 0),
(10, 'Bambooforest', 'Bamboo Forest', 'Battleon/~town-bamboo.swf', 10, 1, '', '', '', '', '', 0, 0, 0, 0),
(11, 'Castle', 'Castle', 'Battleon/OrakleCastleR10.swf', 10, 1, '', '16,17,18', '16,17,18,16,17,18,16,17,18,16,17,18,16,17', 'r3,r3,r3,r4,r4,r4,r5,r5,r6,r6,r6,r7,r7,r7', '', 0, 0, 0, 0),
(12, 'Sherwood', 'Sherwood Forest', 'Battleon/SherwoodR10.swf', 10, 1, '', '19,20,21,22,23,24', '22,20,21,22,20,21,19,20,21,19,20,21,19,20,21,19,20,21,19,20,21,19,24,23,19,20,21,19,20,21,19,20,21,19,20,21,19,20,21', 'Enter,Enter,Enter,r2,r2,r2,r2,r3,r4,r4,r4,r4,r5,r5,r5,r5,r6,r6,r6,r7,r7,r7,r8,r8,r9,r9,r9,r10,r10,r11,r11,r11,r12,r12,r13,r13,r13,r14,r14,r15,r15', '', 0, 0, 0, 0),
(14, 'Graveyard', 'Graveyard', 'Battleon/GraveyardRO.swf', 10, 1, '', '25,26', '25,25,25,25,25,26', 'Center,Right,Top,Top,Left,End', '', 0, 0, 0, 0),
(15, 'Falhill', 'Falhill Village', 'Forsaken/ForsakenAreaRO1.swf', 10, 1, '', '27,28,29,30,31', '27,28,29,29,28,30,31,27,27,27', 'Enter,r2,r2,r3,r3,r4,r5,r6,r7,Open', '', 0, 0, 0, 0),
(16, 'Elursuxome', 'Realm of Emoxus', 'ElursuxomeFinO.swf', 5, 20, '', '', '', '', '', 0, 0, 0, 0),
(17, 'forest', 'West Forest', 'WestForest/WestForest3.swf', 10, 1, '', '2,3,6', '2,3,2,3,6,3,2,3,6,3,2', 'East2,East2,East3,East3,East3,East4,East5,East5,East6,East6,East7', '', 0, 0, 0, 0),
(18, 'faeforest', 'Fae Forest', 'WestForest/MysticalForest6.swf', 10, 15, '43', '39,40,41,42', '39,42,39,42,39,40,40,39,41,39', 'Enter,Side1,Side3,Side3,Side3,End,End,Side4,Side4,TopRock', '', 0, 0, 0, 0),
(19, 'Storyline', 'Storyline', 'StorylineTest6.swf', 1, 1, '', '', '', '', '', 0, 0, 1, 0),
(20, 'Sologrounds', 'Dueling Cavern', 'DuelCavernR7.swf', 2, 2, '', '', '', '', '', 1, 0, 0, 0),
(21, 'Auction', 'Auction House', 'Battleon/AuctionHouse2.swf', 10, 2, '', '', '', '', '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meh_maps_mtc`
--

CREATE TABLE `meh_maps_mtc` (
  `mapid` smallint(3) UNSIGNED NOT NULL,
  `mtcid` tinyint(2) UNSIGNED NOT NULL,
  `frame` varchar(10) NOT NULL,
  `pad` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meh_monsters`
--

CREATE TABLE `meh_monsters` (
  `id` smallint(3) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Skills` varchar(128) NOT NULL,
  `Race` varchar(32) NOT NULL DEFAULT 'None',
  `FileName` varchar(128) NOT NULL,
  `HP` mediumint(5) NOT NULL,
  `MP` mediumint(5) NOT NULL DEFAULT '100',
  `Level` int(3) NOT NULL DEFAULT '1',
  `Gold` int(5) NOT NULL DEFAULT '350',
  `Exp` int(5) NOT NULL DEFAULT '450',
  `Rep` int(3) NOT NULL DEFAULT '100',
  `Drops` text NOT NULL,
  `DPS` int(3) NOT NULL DEFAULT '1',
  `Element` varchar(32) NOT NULL DEFAULT 'None',
  `Linkage` varchar(32) NOT NULL,
  `TeamID` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `PvpScore` int(2) NOT NULL DEFAULT '50'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `meh_monsters`
--

INSERT INTO `meh_monsters` (`id`, `Name`, `Skills`, `Race`, `FileName`, `HP`, `MP`, `Level`, `Gold`, `Exp`, `Rep`, `Drops`, `DPS`, `Element`, `Linkage`, `TeamID`, `PvpScore`) VALUES
(1, 'Slime', '', 'Slime', 'Slimegreen.swf', 210, 100, 1, 21, 250, 90, '9:1:1,694:1:.01', 25, 'Water', 'Slimegreen', 0, 0),
(2, 'Spider', '', 'Arachnid', 'Spider1.swf', 310, 100, 4, 60, 125, 90, '694:1:.01', 24, 'Nature', 'Spider1', 0, 50),
(3, 'Wolf', '', 'Kanine', 'Wolfbrown.swf', 589, 100, 5, 75, 245, 120, '694:1:.01', 46, 'Nature', 'Wolfbrown', 0, 50),
(4, 'Sneevil', '', 'Sneevil', 'Sneevil1.swf', 296, 100, 2, 39, 265, 120, '694:1:.01', 28, 'Nature', 'Sneevil1', 0, 50),
(5, 'Sneevil Boss', '', 'Sneevil', 'Sneevilboss2.swf', 593, 100, 3, 76, 110, 165, '11:1:1,694:1:.01', 32, 'Nature', 'Sneevilboss2', 0, 50),
(6, 'Night Bat', '', 'None', 'VampyreBat.swf', 800, 100, 6, 150, 155, 180, '694:1:.01', 35, 'Dark', 'LavaBat', 0, 50),
(7, 'Black Knight', '', 'None', 'Knightblack.swf', 50000, 100, 15, 350, 260, 330, '42:1:.4,43:1:.5,44:1:.45,45:1:.2,46:1:.3,47:1:.33,56:1:.8,487:1:1,694:1:.01', 65, 'Dark', 'Knightblack', 0, 50),
(8, 'Black Bandit', '', 'None', 'BlackBandit1.swf', 830, 100, 11, 170, 180, 210, '55:1:.8,694:1:.01', 42, 'Dark', 'Bandit1', 0, 50),
(9, 'Grizzly Bear', '', 'None', 'GrizzlyBear.swf', 570, 100, 6, 84, 130, 150, '53:1:1,53:2:.4,694:1:.01', 35, 'Nature', 'GrizzlyBear', 0, 50),
(10, 'Imp', '', 'None', 'Imp01.swf', 690, 100, 8, 110, 156, 180, '54:1:.85,54:2:.24,694:1:.01', 38, 'Fire', 'Imp01', 0, 50),
(11, 'Dragonling', '', 'None', 'PlagueDragonling.swf', 1305, 100, 13, 190, 250, 220, '694:1:.01', 46, 'Fire', 'PlagueDragonling', 0, 50),
(12, 'Rock Guardian', '', 'None', 'Rockelemental2.swf', 2400, 100, 10, 150, 225, 200, '694:1:.01', 20, 'Nature', 'Rockelemental2', 0, 50),
(13, 'Nekomatta', '', 'None', 'YokaiNekomatta.swf', 1066, 100, 9, 160, 178, 188, '694:1:.01', 56, 'Nature', 'YokaiNekomatta', 0, 50),
(14, 'Fire Elemental', '', 'None', 'Fireelemental.swf', 1534, 100, 15, 250, 300, 250, '486:1:1,694:1:.01', 50, 'Fire', 'Fireelemental', 0, 50),
(15, 'Infernal Dracolich', '', 'None', 'Lavastorm.swf', 75000, 100, 15, 1200, 1200, 1000, '694:1:.01', 90, 'Fire', 'Lavastorm', 0, 50),
(16, 'Kingdom Tiger', '', 'Beast', 'OrakleTiger.swf', 1750, 100, 10, 350, 450, 100, '565:1:1,694:1:.01', 50, 'Light', 'ChineseTiger1', 0, 50),
(17, 'Kingdom Knight', '', 'None', 'OrakleKingdomKnight.swf', 2700, 100, 15, 450, 550, 200, '564:1:1,694:1:.01', 65, 'Light', 'Guardsirknight1', 0, 50),
(18, 'Mystical Sprites', '', 'None', 'ChaosSprites.swf', 1500, 100, 15, 300, 400, 200, '566:1:1,694:1:.01', 40, 'Light', 'ChaosSprites', 0, 50),
(20, 'Kogetan Warrior', '', 'None', 'KogetanSoldier.swf', 3150, 100, 20, 650, 650, 200, '665:1:1,690:1:1,694:1:.01', 70, 'Fire', 'DWWarUndeadWar2', 0, 50),
(19, 'Kogetan Mage', '', 'None', 'KogetanMage.swf', 2950, 100, 20, 650, 650, 200, '665:1:1,690:1:1,694:1:.01', 100, 'Fire', 'UndeadMageFire', 0, 50),
(21, 'Forest Tiger', '', 'None', 'monster-FirestormTiger.swf', 3500, 100, 20, 650, 650, 300, '663:1:1,694:1:.01', 120, 'Nature', 'FirestormTiger', 0, 50),
(22, 'Forest Fairy', '', 'Fairy', 'MinxFairy.swf', 1800, 100, 12, 350, 450, 100, '664:1:1,694:1:.01', 50, 'Nature', 'MinxFairy', 0, 50),
(23, 'Kogetan General', '', 'None', 'KogetanGeneralR4.swf', 12500, 100, 35, 1200, 1200, 400, '666:1:1,690:1:1,694:1:.01', 200, 'Fire', 'KogetanGeneral', 0, 50),
(24, 'Kogetan General', '', 'None', 'KogetanGiant.swf', 12500, 100, 35, 1300, 1300, 400, '666:1:1,690:1:1,694:1:.01', 250, 'Fire', 'UndeadBoss2', 0, 50),
(25, 'Skeletal Warrior', '', 'Undead', 'GraveyardSkeleRandom3.swf', 3280, 500, 23, 575, 900, 140, '690:1:1,694:1:.01', 200, 'Dark', 'Undeadrandom1', 0, 50),
(26, 'Toxic Undead Warrior', '', 'None', 'UndeadBoss1N.swf', 16660, 100, 15, 925, 950, 200, '690:1:1,694:1:.01', 325, 'Dark', 'UndeadBoss1', 0, 50),
(27, 'Forsaken Elemental', '12', 'None', 'ForsakenElemental2.swf', 17326, 100, 25, 1394, 1493, 300, '686:1:0.80,694:1:.01,699:1:0.70', 180, 'Dark', 'Manaelemental', 0, 50),
(28, 'Frigid Undead', '', 'None', 'IceSkelly2r.swf', 5138, 100, 3824, 300, 302, 240, '688:1:1,694:1:.01', 102, 'Dark', 'IceSkelly2', 0, 50),
(29, 'Frost Banshee', '', 'None', 'IceBansheer1.swf', 5738, 100, 29, 300, 302, 240, '687:1:0.80,694:1:.01', 102, 'Dark', 'IceBanshee', 0, 50),
(30, 'Forsaken Drake', '12', 'None', 'ForsakenFrostFang.swf', 173234, 100, 40, 2394, 2493, 300, '689:1:1,694:1:.01', 300, 'Dark', 'FrostFang', 0, 50),
(31, 'Frigid Goliath', '12', 'None', 'IceSkellyBeast.swf', 46872, 100, 35, 2294, 2293, 300, '688:1:1,919:1:1,694:1:.01', 222, 'Ice', 'IceSkellyBeast', 0, 50),
(39, 'Aether Snake', '', 'None', 'AetherSnake2.swf', 3854, 100, 21, 721, 922, 160, '694:1:.01', 100, 'None', 'AetherSnake2', 0, 50),
(40, 'Mana Elemental', '12', 'None', 'Manaelemental.swf', 59319, 100, 45, 2394, 2093, 300, '694:1:.01,699:1:1', 350, 'None', 'Manaelemental', 0, 50),
(41, 'Cyclops Warlord', '', 'None', 'CyclopsmonsterBoss1.swf', 28345, 100, 32, 1227, 1029, 200, '694:1:.01', 300, 'None', 'CyclopsmonsterBoss1', 0, 50),
(42, 'Moghost', '', 'None', 'MoglinGhost.swf', 4854, 100, 27, 751, 962, 173, '694:1:.01', 110, 'None', 'MoglinGhost', 0, 50);

-- --------------------------------------------------------

--
-- Table structure for table `meh_panel_login`
--

CREATE TABLE `meh_panel_login` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` char(17) NOT NULL,
  `Access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meh_panel_login`
--

INSERT INTO `meh_panel_login` (`id`, `Username`, `Password`, `Access`) VALUES
(1, 'Malikzaky', 'Test123', 40),
(2, 'MiracleAQ', 'Staff', 40),
(3, 'Bqueen', 'Bqueen', 40),
(4, 'Heavens', 'Heavens', 40);

-- --------------------------------------------------------

--
-- Table structure for table `meh_quests`
--

CREATE TABLE `meh_quests` (
  `id` int(5) NOT NULL,
  `iLvl` int(10) NOT NULL DEFAULT '1',
  `sName` varchar(32) NOT NULL,
  `sDesc` text NOT NULL,
  `turnin` text NOT NULL,
  `sEndText` text NOT NULL,
  `oRewards` text NOT NULL,
  `rewType` varchar(5) NOT NULL DEFAULT 'S',
  `iGold` int(32) NOT NULL DEFAULT '0',
  `iExp` int(11) NOT NULL DEFAULT '100',
  `iCP` int(11) NOT NULL DEFAULT '0',
  `iReqCP` int(11) NOT NULL DEFAULT '0',
  `factionID` tinyint(3) NOT NULL DEFAULT '1',
  `iWar` smallint(3) NOT NULL DEFAULT '0',
  `iClass` int(11) NOT NULL DEFAULT '0',
  `iReqRep` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `iValue` int(11) NOT NULL DEFAULT '0',
  `iSlot` int(11) NOT NULL DEFAULT '-1',
  `cValue` int(11) NOT NULL DEFAULT '0',
  `cSlot` int(11) NOT NULL DEFAULT '-1',
  `iRep` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT '00000000000',
  `bUpg` tinyint(2) NOT NULL DEFAULT '0',
  `bOnce` tinyint(3) NOT NULL DEFAULT '0',
  `sField` varchar(4) NOT NULL,
  `iIndex` int(11) NOT NULL DEFAULT '-1',
  `sFaction` int(11) NOT NULL,
  `Index` int(11) NOT NULL,
  `Field` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `meh_quests`
--

INSERT INTO `meh_quests` (`id`, `iLvl`, `sName`, `sDesc`, `turnin`, `sEndText`, `oRewards`, `rewType`, `iGold`, `iExp`, `iCP`, `iReqCP`, `factionID`, `iWar`, `iClass`, `iReqRep`, `iValue`, `iSlot`, `cValue`, `cSlot`, `iRep`, `bUpg`, `bOnce`, `sField`, `iIndex`, `sFaction`, `Index`, `Field`) VALUES
(1, 1, 'Clear The Way', 'Clear the path for Serval and Twilly', '9:2', 'Complete the quest', '', 'S', 100, 200, 0, 0, 1, 0, 0, 0, 1, 1, 2, 1, 00000000000, 0, 0, '', -1, 0, 1, 0),
(2, 1, 'Defeat the Boss', 'That sneevil boss is planning to attack Battleon with his sneevil army.', '11:1', 'Oh! Thanks so much. I can breathe easy now. You really are a hero.. aren''t you?', '', 'S', 130, 1500, 0, 0, 1, 0, 0, 0, 3, 1, 3, 1, 00000000000, 0, 1, '', -1, 0, 1, 0),
(3, 1, '..Bears, Oh my!', 'As you know, I was tasked with recovering this area by the guardian council. Those ungodly Bears are reaping all sorts of havoc.', '53:8', 'Thanks! Your services will not go unrewarded.', '', 'S', 480, 320, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 00000000000, 0, 0, '', -1, 0, 0, 0),
(4, 3, 'Agressive Imps', 'The Imps in this area are extremely aggressive. They attack without warning. I need you to capture them before they harm anymore innocent townsfolk.', '54:5', 'Thanks! Your services will not go unrewarded.', '', 'S', 785, 600, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 00000000000, 0, 0, '', -1, 0, 0, 0),
(5, 4, 'Bandits on the loose', 'There are bandits everywhere! This isn''t natural, someone or something has to be summoning them. I''m tired of this, time to launch operation end game!', '55:10', 'Good Job, You are oddly masterful at this sort of thing. What did you say your name was again?', '', 'S', 983, 740, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 00000000000, 0, 0, '', -1, 0, 0, 0),
(6, 5, 'Not in my neighborhood!', 'I learned that there is a unruly Knight causing all this trouble. It''s time to kick him out of this area!', '56:1', 'Thank a lot! Your services were invaluable! I will be sure to notify the Guardian Council of your valour.', '57:1', 'S', 1300, 860, 0, 0, 1, 0, 0, 0, 0, 0, 6, 2, 00000000000, 0, 1, '', -1, 0, 0, 0),
(7, 1, 'Shinka Suru', 'Bring me the follow reagents and I''ll let you choose one of the items I''ve obtained from Emoxus''s Forge.', '487:1,486:3', 'Nicely done mortal, I''m impressed... come back again when you''re ready to obtain another one of my wares.', '484:1:1,485:1:1,515:1:1', 'C', 0, 1200, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 00000000000, 0, 0, '', -1, 0, 0, 0),
(29, 1, 'Show us what you''re worth', 'I see you''re new around here... If you think you deserve to be in the courtyard of the greatest kingdom in all of Orakle, show us what you''ve got! If you pass, I''ll give you some gold... Plus the experience is good.', '565:3,566:5', 'Nicely done... Here''s the gold I promised you. ', '', 'S', 1200, 800, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(30, 1, 'Earning our respect', 'If you want them to respect you... try sparing with some of them. If you succeed, word will get around that you''re no joke!', '564:10', 'Wow! You beat 10 Knights of the Kingdom? Nicely done man.', '', 'S', 2000, 1050, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(35, 1, 'Tiger Teeth', 'Rip some of these tigers teeth out, and get some fairy dust.. I can create a Barrier Potion with them to help weaken The Kogetan forces.', '663:4,664:4', 'Thanks, this will certainly help detour them!', '', 'S', 2000, 1000, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(36, 1, 'Crush The Kogetan', 'Go smash some of these Kogetan Warrior! Take them all down, and bring me pieces of their scarves to show me your efforts.', '665:10', 'Nicely done! Keep going, we''ll get rid of these scum', '', 'S', 2500, 1500, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(37, 1, 'Collateral Damage', 'There are two beastly undead deep in the forest... They are Kogetan Generals, which means they bare the mark of The Kogetan etched into the palms of their right hands.. bring me the hands, so we can investigate the power of the mark.', '666:2', 'To be honest, I didn''t think you could do it. Nicely done, The King will be proud of you.', '', 'S', 3200, 2500, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(200, 20, 'Proving yourself', 'Hello there mortal. I assume you''ve come here because you want to join The Anax... If that''s so, Emoxus will require that you prove yourself. Bring me 50 Skulls, which you can get from any Undead in the world, as long as you have this Quest active. In return, I''ll give you one Blood Contract. You can use this to get some needed components.', '690:50', 'Nicely done, Mortal. Here''s your blood contract. Use it to get some items Emoxus requires for the forging of items.', '691:1', 'S', 15000, 2500, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(201, 20, 'Blood Contract Exchange', 'Come back when you have a Blood Contract...', '691:1', 'Ah, I see you''ve obtained a Blood Contract for yourself. Excellent. I''ll take that, and choose one of my gifts in return.', '692:1,693:1', 'C', 15000, 2500, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(202, 20, 'Soul Exchange', 'If you didn''t know already, Emoxus devours souls... If you bring me some, I''ll give you some of the items Emoxus requires to get items from his armory.', '694:10', 'Ah, That''s enough souls... for now. Excellent. I''ll take that, and choose one of my gifts in return.', '692:1,693:1', 'S', 4250, 650, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(203, 20, 'Show Your Power', 'Emoxus still needs to see your power... Kill these bosses, and bring back their most valuable possessions.\n\nBring me Dorian Row''s Speed, Vorym''s Magic, and A Doomlord''s Evil.', '695:1,696:1,697:1', 'Nicely done Mortal... very nice, indeed. Choose one of these options as payment.', '692:1,693:1', 'S', 50000, 7000, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(204, 20, 'Anaxian Currency', 'Anaxian Gems and Anaxite are all well in good... But if you REALLY want to get some wicked gear, Emoxus will require you to pay in... Drachmas. \r\n\r\nDrachmas are the main currency of The Anax. Each Drachma has a portion of the consumer''s soul in it, which Emoxus feeds on to gain power. Each Drachma coin is extremely valuable and rare, hence why they are so hard to get... But, with them you''ll be able to obtain the greatest of Anaxian Gear.', '699:5,690:25,692:2,693:2', 'Nicely done Mortal... very nice, indeed. Take this Drachma as payment.', '702:1', 'S', 10000, 7000, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(205, 20, 'Items of Miltonius', 'Miltonius left a long, long time ago. But Emoxus kept some of his items in his armory, Bring me some materials and I''ll see if I can get him to give some to you.', '692:3,693:2', 'Great job, Emoxus thanks you. Pick one of these items as payment for your endeavor.', '703:1,704:1,705:1,706:1,707:1,708:1,709:1', 'C', 15000, 3000, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(206, 20, 'Almighty Items of Despair', 'Hello there mortal... I see you''re quite stronger then most people who come around these parts. Emoxus has told me to offer you a deal. Bring me the following reagents, and in return Emoxus will allow you to have one of the Almighty Items of Despair he has stored in his armory. ', '694:20,691:1,692:5,693:5,702:10', 'Why, you''ve done it. Brilliant. Choose your item, and be on your way... Unless you think you can do it again, young mortal.', '710:1,711:1,712:1,713:1,714:1,715:1', 'C', 25013, 6500, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(270, 20, 'Collecting Frigid Undead Dust', ' We need the The Dust from the Frigid Undead in this area, so we can create a frost barrier spell.', '687:8', 'Nicely done mortal. At this rate you''ll rise through our ranks with no time.', '', 'S', 1000, 500, 0, 0, 11, 0, 0, 0, 0, -1, 0, -1, 00000001000, 0, 0, '', -1, 0, 0, 0),
(271, 20, 'The Banshees Screams', ' The mysterious Banshees have such a powerful scream... If you could bring us some of their ancient spell scrolls, We''ll be able to enhance our barrier even more. ', '688:3,687:5', 'Nicely done mortal. At this rate you''ll rise through our ranks with no time. Not to mention our barrier will be stronger then ever.', '', 'S', 2500, 1250, 0, 0, 11, 0, 0, 0, 0, -1, 0, -1, 00000002450, 0, 0, '', -1, 0, 0, 0),
(272, 20, 'Forsaken Mana', 'A Forsaken Elemental guards the entrance to our village. Take a portion of his essence.', '686:4', 'Nicely done mortal. At this rate you''ll rise through our ranks with no time, and we''ll be able to use this essence to strengthen our barrier.', '', 'S', 2500, 1250, 0, 0, 11, 0, 0, 0, 0, -1, 0, -1, 00000003450, 0, 0, '', -1, 0, 0, 0),
(273, 20, 'Dangerous Beasts', 'The Mighty Frigid Goliath, and the Ungodly Forsaken Drake have been tormenting us and blocking our path into the ancient temple for years now... take them out, Mortal.', '688:1,689:1', 'You''re truly a powerful individual. Nice job, We will stand by you now, no matter what.', '', 'S', 8500, 3000, 0, 0, 11, 0, 0, 0, 0, -1, 0, -1, 00000007550, 0, 0, '', -1, 0, 0, 0),
(3074, 1, 'Single Spin', 'Good luck', '569:1', 'Congratulations', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568', 'S', 10000, 0, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, '', -1, 0, 0, 0),
(3075, 1, 'Tenshi Daily Spin', 'Good luck', '', 'Congratulations', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568', 'S', 10000, 0, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, 'id2', 14, 0, 0, 0),
(3076, 1, 'Monthly Spin', 'Good luck', '', 'Congratulations', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568', 'S', 10000, 0, 0, 0, 1, 0, 0, 0, 0, -1, 0, -1, 00000000000, 0, 0, 'im0', 1, 0, 0, 0);

--
-- Triggers `meh_quests`
--
DELIMITER $$
CREATE TRIGGER `Quest Index Check` BEFORE UPDATE ON `meh_quests` FOR EACH ROW BEGIN
	IF NEW.iIndex <> OLD.iIndex THEN
		IF NOT NEW.iIndex < 32 AND NEW.iIndex >= 0 THEN
			SET NEW.iIndex = -1;
		END IF;
	END IF;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `meh_servers`
--

CREATE TABLE `meh_servers` (
  `id` tinyint(2) NOT NULL,
  `Name` varchar(60) NOT NULL DEFAULT 'Server',
  `IP` char(15) NOT NULL DEFAULT '0.0.0.0',
  `Online` tinyint(1) NOT NULL DEFAULT '0',
  `Upgrade` tinyint(1) NOT NULL DEFAULT '0',
  `Chat` tinyint(1) NOT NULL DEFAULT '2',
  `Count` mediumint(4) NOT NULL DEFAULT '0',
  `Max` mediumint(4) NOT NULL DEFAULT '500',
  `MOTD` text NOT NULL,
  `Uptime` longtext NOT NULL,
  `sLang` varchar(80) NOT NULL DEFAULT 'xx',
  `Port` int(2) NOT NULL DEFAULT '80',
  `MonthlyQReset` int(11) NOT NULL,
  `DailyQReset` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meh_servers`
--

INSERT INTO `meh_servers` (`id`, `Name`, `IP`, `Online`, `Upgrade`, `Chat`, `Count`, `Max`, `MOTD`, `Uptime`, `sLang`, `Port`, `MonthlyQReset`, `DailyQReset`) VALUES
(1, 'Orakle', '0.0.0.0', 1, 0, 2, 1, 500, 'Welcome to orakle', '2016-06-29 01:43:45', 'xx', 80, 5, 29),
(2, 'Saga', 'localhost', 0, 0, 2, 0, 500, 'Welcome to orakle', '2013-11-17 07:16:11', 'xx', 80, 5, 29);

-- --------------------------------------------------------

--
-- Table structure for table `meh_settings_login`
--

CREATE TABLE `meh_settings_login` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_settings_login`
--

INSERT INTO `meh_settings_login` (`name`, `value`) VALUES
('gMenu', 'gameMenu.swf'),
('sAssets', 'OrakleAssets1.swf'),
('sBG', 'bg.swf'),
('sBook', 'news/BakaBOLR1.swf'),
('sFBC', 'FBC-2011-03-08.swf'),
('sFile', 'clientLOV7.swf'),
('sMap', 'news/MapR4.swf'),
('sNews', 'news/News-7Feb14.swf'),
('sTitle', 'Legend'),
('sWTSandbox', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `meh_settings_rates`
--

CREATE TABLE `meh_settings_rates` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_settings_rates`
--

INSERT INTO `meh_settings_rates` (`name`, `value`) VALUES
('baseBlock', '0'),
('baseBlockValue', '0.7'),
('baseCrit', '0.05'),
('baseCritValue', '1.5'),
('baseDodge', '0.04'),
('baseEventValue', '0.05'),
('baseHaste', '0'),
('baseHit', '0'),
('baseMiss', '0.1'),
('baseParry', '0.03'),
('baseResistValue', '0.7'),
('bigNumberBase', '8'),
('curveExponent', '0.66'),
('GstBase', '12'),
('GstGoal', '572'),
('GstRatio', '5.6'),
('intAPtoDPS', '10'),
('intHPperEND', '5'),
('intLevelCap', '100'),
('intLevelMax', '60'),
('intSPtoDPS', '10'),
('modRating', '3'),
('PCDPSMod', '0.85'),
('PChpBase1', '680'),
('PChpBase100', '4000'),
('PChpDelta', '1640'),
('PChpGoal1', '680'),
('PChpGoal100', '70000'),
('PCmpBase1', '100'),
('PCmpBase100', '2000'),
('PCmpDelta', '900'),
('PCstBase', '15'),
('PCstGoal', '762'),
('PCstRatio', '7.47'),
('resistRating', '17'),
('statsExponent', '1');

-- --------------------------------------------------------

--
-- Table structure for table `meh_skills`
--

CREATE TABLE `meh_skills` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `Name` varchar(32) CHARACTER SET latin1 NOT NULL,
  `Anim` varchar(60) CHARACTER SET latin1 NOT NULL,
  `Desc` text CHARACTER SET latin1 NOT NULL,
  `Damage` varchar(12) CHARACTER SET latin1 NOT NULL DEFAULT '1.0',
  `Mana` varchar(3) NOT NULL DEFAULT '0',
  `Icon` varchar(32) CHARACTER SET latin1 NOT NULL,
  `Range` smallint(5) UNSIGNED NOT NULL DEFAULT '303',
  `Dsrc` varchar(15) CHARACTER SET latin1 NOT NULL,
  `Ref` char(2) CHARACTER SET latin1 NOT NULL,
  `Tgt` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'h',
  `Typ` varchar(8) CHARACTER SET latin1 NOT NULL DEFAULT 'p',
  `Strl` varchar(32) CHARACTER SET latin1 NOT NULL,
  `CD` mediumint(5) UNSIGNED NOT NULL,
  `TgtMax` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `TgtMin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `FX` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'm',
  `AuraID` int(11) NOT NULL DEFAULT '1',
  `iscrit` int(11) NOT NULL,
  `str1` varchar(64) NOT NULL,
  `Aura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `meh_skills`
--

INSERT INTO `meh_skills` (`id`, `Name`, `Anim`, `Desc`, `Damage`, `Mana`, `Icon`, `Range`, `Dsrc`, `Ref`, `Tgt`, `Typ`, `Strl`, `CD`, `TgtMax`, `TgtMin`, `FX`, `AuraID`, `iscrit`, `str1`, `Aura`) VALUES
(1, 'Auto attack', 'Attack1,Attack2', 'A basic attack, taught to all adventurers.', '1', '-5', 'iwd1', 301, 'AP2', 'aa', 'h', 'a', '', 2000, 0, 0, 'm', 0, 0, '', 0),
(2, 'Decisive Strike', 'Attack3', 'A powerful strike, dealing 105% weapon damage.', '1.05', '20', 'ims2,iwaxe', 301, 'AP2', 'a1', 'h', 'p', '', 2000, 0, 0, 'm', 0, 0, '', 0),
(3, 'Imbalancing Strike', 'Stab', 'A precise blow which stuns your opponent for 3 seconds.', '0.9', '30', 'iss1', 301, 'AP2', 'a2', 'h', 'p', '', 10000, 0, 0, 'm', 2, 0, '', 0),
(4, 'Prepared Strike', 'Point', 'Your next two auto attacks taken within 5 seconds will be powerful critical hits which cannot be avoided.', '0', '20', 'imd1,iwsword', 301, '', 'a3', 's', 'p', '', 15000, 0, 0, 'm', 1, 0, '', 0),
(5, 'Bleed', 'Attack4', 'Does moderate damage and causes contious damage for 5 seconds.', '0.75', '30', 'isb1', 301, 'AP2', 'a4', 'h', 'p', '', 30000, 0, 0, 'm', 5, 0, '', 0),
(6, 'Spells', 'Cheer', 'Equip a new spell', '0', '0', 'icu1', 808, '', 'i1', 'f', 'i', '', 10000, 0, 0, '', 0, 0, '', 0),
(7, 'Fireball', 'Cast3', 'Hurls flame at your opponent, dealing moderate damage on impact, and dealing that same amount again over 10 seconds.  Deals more impact damage if Frozen Blood is present on the target, but consumes the debuff.', '1.11', '20', 'ief1', 808, 'Mage2', 'a1', 'h', 'p', 'sp_ef1', 6000, 0, 0, 'p', 3, 0, '', 0),
(8, 'Ice Shard', 'Cast2', 'Launches a freezing shard at your enemy, dealing moderate damage.  If Scorched is NOT present, applies Frozen Blood, reducing their attack speed and power for 10 seconds. If Scorched IS present, deals increased damage but does not apply Frozen Blood.', '0.8', '10', 'iei2', 808, 'Mage2', 'a2', 'h', 'm', 'sp_ice1', 10000, 0, 0, 'p', 4, 0, '', 0),
(9, 'Explosion', 'Cast2', 'Causes energies within opponent to become unstable and burst forth, causing moderate damage to your target and light damage to surrounding targets.', '1.02', '15', 'ime2', 808, 'AoE1', 'a3', 'h', 'm', 'sp_ef2', 3000, 3, 0, 'w', 0, 0, '', 0),
(10, 'Mana Boost', 'Cast3', 'Regains 25 mana points.', '0', '-25', 'isi1', 808, '', 'a4', 's', 'p', 'sp_ee1', 30000, 0, 0, 'w', 0, 0, '', 0),
(11, 'Viper''s Kiss', 'Attack4', 'Instantly cause 70% weapon damage, and apply a poison dealing additional damage over 10s', '0.7', '20', 'isp1', 505, 'AP2', 'a1', 'h', 'p', 'sp_sp1', 3000, 0, 0, 'm', 6, 0, '', 0),
(12, 'Opportunity''s Strike', 'Stab', 'A powerful strike, dealing 10% extra weapon damage.', '1.1', '10', 'iiclass,imc1', 301, 'Thief1', 'a2', 'h', 'p', '', 4000, 0, 0, 'm', 0, 0, '', 0),
(13, 'Stiletto', 'Attack3', 'Deals moderate damage, and applies paralysis, causing your opponent to stop attacking for 4 seconds', '0.8', '20', 'iwdagger', 301, 'AP2', 'a3', 'h', 'p', '', 15000, 0, 0, 'm', 7, 0, '', 0),
(14, 'Footwork', 'Bow', 'Applies focus, increases weapon damage  by 15% for 5 seconds.\n\n', '0', '25', 'imp1,imf1', 301, '', 'a4', 's', 'p', '', 30000, 0, 0, 'm', 8, 0, '', 0),
(15, 'Healing Word', 'Castgood', 'Heals a friendly target for a large amount immediately, and up to 3 additional nearby targets for a smaller amount. Applies Radiance to the first target, healing for an additional amount over 12 seconds.\n', '-1.5', '30', 'imf1,ieh1', 3000, 'AoE1', 'a1', 'f', 'm', '', 6000, 3, 1, 'w', 10, 0, '', 0),
(16, 'Heartbeat', 'Attack3', 'As your heart pumps faster, you Deal 5% extra damage for 5 seconds.', '1.05', '12', 'imh3', 808, 'intHPSP', 'a2', 'h', 'm', '', 2000, 0, 0, 'w', 9, 0, '', 0),
(17, 'Energy Flow', 'Castgood', 'Grants the caster 10 mana.\n', '0', '-10', 'isi1', 808, '', 'a4', 'f', 'm', 'sp_ee1', 10000, 0, 0, 'w', 11, 0, '', 0),
(18, 'Clear Mind', 'Stab', 'A critical strike that focuses mana in order to deal extra damage.', '1.15', '20', 'iel2', 808, '', 'a3', 'h', 'm', '', 8000, 0, 0, 'w', 0, 1, '', 0),
(19, 'Fireball', 'Cast3', 'Hurls flame at your opponent, dealing moderate damage on impact, and dealing that same amount again over 10 seconds.  Deals more impact damage if Frozen Blood is present on the target, but consumes the debuff.', '1.1', '20', 'ief1', 808, 'Mage2', 'a5', 'h', 'p', 'sp_ef1', 6000, 0, 0, 'p', 3, 0, '', 0),
(20, 'Critical Striker', 'Point', 'Adds 60% chance to hit with a critical for the next 7 seconds.', '0', '20', 'imd1,iwsword', 301, '', 'a5', 's', 'p', '', 15000, 0, 0, 'm', 12, 0, '', 0),
(21, 'Alpha Star Blast', 'Cast3', 'A powerful spell taught to the ancient starlords! Capable of paralyzing and doing high damage to your enemy!', '1.3', '30', 'ims2,ief3', 808, 'Mage2', 'a5', 'h', 'p', 'sp_starblast', 10000, 0, 0, 'p', 2, 0, '', 0),
(22, 'Basic Healing', 'Castgood', 'Heals a friendly target for a large amount immediately, and up to 3 additional nearby targets for a smaller amount. Applies Radiance to the first target, healing for an additional amount over 12 seconds.\r\n', '-.5', '20', 'imr2,ieh1', 3000, 'AoE1', 'a5', 'f', 'm', 'sp_el2', 10000, 3, 1, 'w', 13, 0, '', 0),
(23, 'Potions', 'Cheer', 'Equip a potion or scroll from your inventory to use it here.', '', '0', 'icu1', 808, '', 'i1', 'f', 'i', '', 60000, 0, 0, '', 1, 0, '', 0),
(24, 'Lliath''s Torrent', 'Cast3', 'Summon the Water Prime''s power and hit your foe with a crushing jet of water, which has a chance to stun your target.', '1.5', '25', 'iew1', 808, 'SP2', 'a2', 'h', 'm', 'sp_wtr', 6000, 0, 0, 'w', 39, 0, 'sp_wtr', 0),
(25, 'Astialo''s Wings', 'Cast2', 'You gain the speed of a flying dragon, causing moderate damage to your target. This power also DOUBLES your attack speed.', '1.5', '50', 'iiw1', 808, 'SP2', 'a4', 'h', 'm', 'sp_ee2', 15000, 0, 0, 'w', 0, 0, 'sp_ee2', 0),
(26, 'Ssikari''s Breath', 'FireBreath', 'Breathes fire on your target causing moderate damage and applying the DragonBurn state to them for Damage Over Time.', '1', '25', 'ief2', 301, 'SP2', 'a1', 'h', 'm', 'sp_ef2', 4000, 0, 0, 'w', 38, 0, 'sp_ef2', 0),
(27, 'Duradun''s Scales', 'Castgood', 'Gathers mana from nearby ley lines and increases your damage resistance by 75% for 6 seconds.', '0', '-30', 'iee2', 301, '', 'a3', 'f', 'p', 'sp_el2', 12000, 0, 0, 'm', 40, 0, 'sp_el2', 0),
(28, 'Double Strike', 'Thrash', 'Instantly attack twice, dealing extra damage.', '1.35', '15', 'iiclass2', 301, 'AP2', 'a1', 'h', 'p', '', 2000, 0, 0, 'm', 0, 0, '', 0),
(29, 'Field Medic', 'Castgood', 'Heal for a large amount.', '-8', '30', 'imf1,ieh1', 3000, 'AoE1', 'a2', 'f', 'pm', 'sp_eh1', 6000, 4, 1, 'w', 10, 0, 'sp_eh1', 0),
(30, 'Maul', 'Stab', 'Strike and weaken an enemy by stunning them for 4 seconds.', '0.4', '30', 'iss1', 301, 'AP2', 'a3', 'h', 'p', '', 10000, 0, 0, 'm', 2, 0, '', 0),
(31, 'Bunker Buster', 'Attack4', '1 hit guaranteed to crit', '3.2', '30', 'ime2', 301, 'AP2', 'a4', 'h', 'p', '', 15000, 0, 0, 'm', 14, 0, '', 0),
(32, 'Life Drinker', 'Attack4', 'This attack causes light to moderate damage based on the difference between your MAX and CURRENT HP. The Weaker you are, the harder you hit. Also saps some of your foe''s life and and heals you.', '0.75', '12', 'isf1', 301, 'BT1', 'a1', 'h', 'm', 'sp_ed1', 3000, 0, 0, 'w', 1, 0, 'sp_ed1', 0),
(33, 'Crimson Shield', 'Cast2', 'Consumes a fifth of your life to greatly increase your damage resistance for 8 seconds. If you have a monster targeted it will also force them to attack  only you for 5 seconds.', '0', '0', 'iwshield', 301, 'BT3', 'a3', 'h', 'm', '', 12000, 0, 0, 'w', 1, 0, '', 0),
(34, 'Blood Fury', 'Attack3', 'Consume some of your own life essence (HP) to do moderate damage to your foe as well as briefly increasing your damage and speed.', '1.25', '0', 'isb1', 301, 'BT2', 'a2', 'h', 'm', '', 10000, 0, 0, 'm', 1, 0, '', 0),
(35, 'Blood Thief', 'Thrash', 'This high damage attack consumes a third of your life and greatly reduces your target''s damage resistance and speed, while increasing your damage resistance and damage output for 10 seconds.', '3', '0', 'isb1,ied1', 301, 'BT4', 'a4', 'h', 'm', '', 16000, 0, 0, 'm', 1, 0, '', 0),
(36, 'Hemophiliac', 'Attack3', 'Does moderate damage to your opponent.', '1.25', '25', 'isb1', 301, 'AP2', 'a1', 'h', 'p', '', 8000, 0, 0, 'm', 1, 0, '', 0),
(37, 'Draw Blood', 'Thrash', 'Causes a moderate open wound on your foe. Smelling their blood increases your STRENGTH and SPEED for 6 seconds.', '1.65', '25', 'isf1', 301, 'AP2', 'a2', 'h', 'p', '', 10000, 0, 0, 'm', 18, 0, '', 0),
(38, 'Regeneration', 'Stab', 'You smell the blood of your opponent and apply a small heal over time to yourself.', '-2', '5', 'isi1', 301, 'Blood1', 'a3', 'f', 'm', 'sp_el2', 15000, 0, 0, 'm', 17, 0, '', 0),
(39, 'Soul Grip', 'Attack4', 'Causes HIGH damage and stuns your opponent for 8 seconds!', '3.2', '30', 'iss1', 301, 'AP2', 'a4', 'h', 'p', '', 40000, 0, 0, 'm', 19, 0, '', 0),
(40, 'Enchanted Blade', 'Cast3', 'Increases all spell damage and accuracy by 50% for 12 seconds.', '', '15', 'ims2,isl1', 301, '', 'a1', 's', 'm', '', 12000, 0, 0, 'w', 15, 0, 'sp_eh2', 0),
(41, 'Arcane Fire', 'Cast2', 'Summon an explosive fire ball burning with arcane energies on up to 3 targets.', '1.85', '45', 'ief3', 808, 'SP2', 'a2', 'h', 'm', '', 15000, 3, 1, 'w', 3, 0, 'sp_ea2', 0),
(42, 'Explosive Shield', 'Cast3', 'Break apart surrounding raw mana and form it into an Arcane Shield. Dealing damage to 3 enemies.', '1.2', '29', 'ims2,isi1', 808, 'SP2', 'a3', 'h', 'm', '', 45000, 3, 1, 'w', 1, 0, '', 0),
(43, 'Arcane Devastation', 'Cast1', 'Conjure a powerful, explosive, arcane blast damaging up to 3 targets. If Enchanted Blade is active, your target will be weakened and take 30% more damage from all sources.', '2.2', '62', 'ief3,iwwand', 808, 'SP2', 'a4', 'h', 'm', '', 18000, 3, 1, 'w', 16, 0, 'sp_ea3', 0),
(44, 'Storm Call', 'Cast3', 'You bring the power of the storm to bear against your enemy. Using this skill on enemies with Shocked applied will heal you until Shocked fades. You will regain mana when you use this skill on enemies who have Thunderstruck applied to them.', '0.9', '20', 'iea1', 808, 'SC1', 'a1', 'h', 'm', '', 3000, 0, 0, 'w', 1, 0, 'sp_ee2', 0),
(45, 'Skyfire', 'Cast1', 'You channel the power of pure lightning through your hands and strike up to 3 enemies at once. Applies Shocked to all enemies hit. Shocked lasts for 10 seconds, will replace Thunderstruck and reduces affected enemies damage output.', '0.9', '40', 'iee2', 808, 'SP2', 'a2', 'h', 'm', '', 12000, 3, 1, 'c', 1, 0, 'lit1', 0),
(46, 'Thunderclap', 'Castgood', 'You devastate your enemies with mighty boom of thunder, hitting up to 3 enemies at once and has a chance to stun them. Applies Thunderstruck to all enemies hit. Thunderstruck lasts for 10 second and will replace Shocked.', '0.9', '40', 'iss1', 808, 'SP2', 'a3', 'h', 'm', '', 12000, 3, 1, 'w', 1, 0, 'sp_ee1', 0),
(47, 'Ball Lightning', 'Cast2', 'Fires a Ball Lightning, The rarest form of naturally occurring lightning, at your enemy. This attack has an increased chance to crit and will do additional damage to any enemy who has either Shocked or Thunderstruck applied.', '1.3', '90', 'iel2', 808, 'SC2', 'a4', 'h', 'm', '', 12000, 0, 0, 'p', 1, 0, 'sp_ball', 0),
(48, 'Summon Minion', 'Castgood:PetBuff', 'Summons an undead minion to your side and sends it into a frenzy doubling all damage at the cost of health.', '1', '45', 'iss1', 301, 'AP1', 'a1', 's', 'm', '', 16000, 0, 0, 'w', 1, 0, '', 0),
(49, 'Weaken', 'Cast2', 'Weakens the target lowering damage and draining some of its life and healing you for the same amount.', '1', '15', 'ied1', 808, 'Leech1', 'a2', 'h', 'm', '', 5000, 0, 0, 'w', 1, 0, 'sp_ed1', 0),
(50, 'Infect', 'Cast3', 'Infect yourself, damaging your health to restore mp.', '1', '0', 'ims2', 301, 'Leech2', 'a3', 's', 'i', '', 3000, 0, 0, 'w', 1, 0, 'sp_sp1', 0),
(51, 'Command Undead', 'Point:PetAttack', 'Order your pet to attack doing increased damage.', '1.5', '20', 'isi1', 301, 'Pet1', 'a4', 'h', 'm', '', 6000, 0, 0, 'w', 1, 0, '', 0),
(52, 'Abolish', 'Attack4', 'A quick strike dealing weapon damage plus magical damage. Also grants Zeal, allowing extra mana regeneration for a short period of time.', '1.25', '10', 'imr2,iwmace', 301, 'APSP2', 'a1', 'h', 'p', '', 3000, 0, 0, 'm', 0, 0, '', 0),
(53, 'Healing Word', 'Castgood', 'Heals yourself for a large portion of your health (In Battle only).', '-3', '30', 'imf1,ieh1', 3000, 'AoE1', 'a2', 'f', 'm', 'sp_eh1', 10000, 1, 1, 'w', 0, 0, '', 0),
(54, 'Exorcise', 'Cast1', 'A light based ranged attack.', '1.3', '15', 'iiclass,ieh1', 808, 'EX1', 'a3', 'h', 'm', 'sp_el3', 6000, 0, 0, 'p', 0, 0, '', 0),
(55, 'Blinding Light', 'Cast1', 'Deals large damage to all enemies in range.', '3', '40', 'iel2', 808, 'APSP1', 'a4', 'h', 'p', 'sp_ee1', 7000, 4, 1, 'w', 0, 0, '', 0),
(56, 'Cleave', 'Thrash', 'Deals moderate damage to up to two targets in melee range.', '6', '20', 'imr2,iwaxe', 401, 'AP2', 'a1', 'h', 'p', '', 4000, 2, 1, 'm', 1, 0, '', 0),
(57, 'Heated Blade', 'Attack3', 'Deals light damage and applies Searing Heat, reducing haste and hit chance by 5%, stacking up to 4 times and lasting 10 seconds.', '4', '15', 'ief2,iwsword2', 301, 'AP2', 'a2', 'h', 'p', '', 4000, 0, 0, 'm', 1, 0, '', 0),
(58, 'Lifestealer', 'Stab', 'Deals damage based on the difference between your current and maximum HP, and heals you for some of the damage dealt.', '1', '35', 'iwsword,ieh1', 301, 'HPSteal2', 'a3', 'h', 'p', '', 10000, 0, 0, 'm', 1, 0, '', 0),
(59, 'Cursed Blade', 'Cast1', 'Deals damage inversely proportional to your current MP to up to 2 targets. Applies Cursed Blood, increasing the target''s damage taken by 12% for 10 seconds.', '1', '20', 'ied2', 401, 'MPd', 'a4', 'h', 'p', '', 8000, 2, 1, 'm', 1, 0, '', 0),
(60, 'Decisive Strike', 'Attack3', 'A powerful strike, dealing 150% weapon damage.', '1', '20', 'ims2,iwaxe', 301, 'AP2', 'a1', 'h', 'p', '', 2000, 0, 0, 'm', 1, 0, '', 0),
(61, 'Imbalancing Strike', 'Stab', 'A precise blow which stuns your opponent for 4 seconds.', '4', '30', 'iss1', 301, 'AP2', 'a2', 'h', 'p', '', 10000, 0, 0, 'm', 1, 0, '', 0),
(62, 'Prepared Strike', 'Point', 'Your next two auto attacks taken within 5 seconds will be powerful critical hits which cannot be avoided.', '1', '20', 'imd1,iwsword', 301, '', 'a3', 's', 'p', '', 15000, 0, 0, 'm', 1, 0, '', 0),
(63, 'On Guard', 'Attack4', 'Challenge your opponent, dealing 75% normal damage, and taking 50% damage from all sources for 10 seconds.', '5', '30', 'iwshield', 301, 'AP2', 'a4', 'h', 'p', '', 30000, 0, 0, 'm', 1, 0, '', 0),
(64, 'Exorcise', 'Cast1', 'A powerful spirit attack, damage enhanced by spirit power.', '2', '10', 'iiclass,ieh1', 808, 'US1', 'a1', 'h', 'p', 'sp_el3', 2000, 0, 0, 'm', 0, 0, '', 0),
(65, 'Spirit of Healing', 'Castgood', 'Heal your self with spirit power.', '-3', '20', 'imf1,ieh1', 301, 'US2', 'a2', 's', 'p', '', 16000, 0, 0, 'm', 0, 0, '', 0),
(66, 'Vorpal Strike', 'Thrash', 'A strong attack enhanced by spirit power.', '2.5', '10', 'imd1,iwsword', 301, 'US1', 'a3', 'h', 'p', '', 5000, 0, 0, 'm', 0, 0, '', 0),
(67, 'Dragon Lance', 'Stab', 'The Undead Slayer''s ultimate attack.', '3', '30', 'iwpolearm', 301, 'US3', 'a4', 'h', 'p', '', 30000, 0, 0, 'm', 1, 0, '', 0),
(68, 'Twist Time', 'Cast3', 'The powers of chaos alter time increasing your attack speed or reducing the speed of your enemy.', '1', '30', 'ims4', 301, 'AP2', 'a1', 'h', 'm', '', 16000, 0, 0, 'm', 1, 0, '', 0),
(69, 'Chaos Fog', 'Thrash', 'A Chaotic fog stuns your target or weakens the target reducing the damage it does.', '1', '30', 'ied2', 808, 'AP2', 'a2', 'h', 'm', '', 10000, 0, 0, 'm', 1, 0, '', 0),
(70, 'Chaotic Touch', 'Stab', 'A chaotic touch that harms your target or heals yourself.', '1', '20', 'isi1', 301, '', 'a3', 'h', 'm', '', 7000, 0, 0, 'm', 1, 0, '', 0),
(71, 'Death Grip', 'Attack4', 'The power of chaos causes high damage to your target.', '2', '30', 'iss1', 301, 'AP2', 'a4', 'h', 'm', '', 10000, 0, 0, 'm', 0, 0, '', 0),
(72, 'Chilling Strike', 'Attack1', 'The chill of death seeps into your foe. Death''s Chill causes damage over time.', '1.3', '5', 'iwsword,iei3', 301, '', 'a1', 'h', 'p', '', 5000, 0, 0, 'm', 28, 0, '', 0),
(73, 'Frostfang', 'Attack1', 'This moderate strike causes Frostbite, a damage over time effect that also slows your foe''s attack speed.', '1.5', '15', 'iei2', 301, 'AP2', 'a2', 'h', 'p', '', 8000, 0, 0, 'm', 30, 0, '', 0),
(74, 'Deathgrip', 'Attack1', 'A powerful strike that causes Deathgrip. Your foe feels the life slowly crushed out of them causing damage over time.', '1.6', '25', 'ied1,imh1', 30100, 'AP2', 'a3', 'h', 'p', '', 18000, 0, 0, 'm', 31, 0, '', 0),
(75, 'Death Shroud', 'Castgood', 'You tap into the power of Death to pull your form back together. Causes you to heal over time, and significantly increases your damage resistance, but also slows your attack speed and reduces your damage output while you are regenerating.', '-2', '30', 'ied1,imf1', 301, 'Death2', 'a4', 's', 'p', '', 200000, 0, 0, 'm', 32, 0, '', 0),
(76, 'Tsunami Strike', 'Attack4', 'Hits up to two enemies, slowing them greatly for 4 seconds.', '5', '10', 'iew1', 301, 'AP2', 'a1', 'h', 'p', '', 4000, 2, 1, 'm', 1, 0, '', 0),
(77, 'Paralyzing Wind', 'Cast3', 'Hits up to three enemies for moderate damage, reducing all of their chances to hit greatly for 6 seconds.', '2', '20', 'iea1', 808, 'AP2', 'a2', 'h', 'p', 'sp_ee1', 6000, 3, 1, 'm', 1, 0, '', 0),
(78, 'Spinning Dragon', 'Thrash', 'Hits up to two enemies near you dealing moderate damage. This attack also has a 50% chance to reduce their next hit to 0 Damage.', '1', '30', 'iiw1,ims4', 301, 'AP2', 'a3', 'h', 'p', '', 6000, 2, 1, 'm', 1, 0, '', 0),
(79, 'Chi Blast', 'Castgood', 'You focus your chi into a quick and brutal attack, hitting up to three monsters around you for high damage with a small chance to stun them. Using all of your chi in a single attack also leaves you stunned and open to attack for 4 seconds.', '3', '40', 'iss1', 808, 'AP2', 'a4', 'h', 'p', 'sp_ef2', 25000, 3, 1, 'm', 1, 0, '', 0),
(80, 'Hamstring', 'Attack3', 'Light damage, lowers enemy damage output for 4 seconds plus applies Weakened State. Weakened State replaces any other state.', '5', '10', 'iwdagger', 301, 'AP2', 'a1', 'h', 'p', '', 4000, 0, 0, 'm', 1, 0, '', 0),
(81, 'Flashbang', 'Throw', 'Moderate damage, reduces enemy chance to crit plus applies Blinded State to enemy. Blinded State replaces any other state.', '1', '15', 'iel2', 808, 'AP2', 'a2', 'h', 'p', 'sp_el2', 8000, 0, 0, 'm', 1, 0, '', 0),
(82, 'Sleeping Gas', 'Throw', 'Moderate damage up to two enemies, reduces enemy haste and has a chance to stun for 4 seconds, plus applies Gassed State to enemy. Gassed State replaces any other state.', '1', '15', 'imp1', 808, 'AP2', 'a3', 'h', 'p', 'sp_sp1', 10000, 2, 1, 'm', 1, 0, '', 0),
(83, 'Reactive Grenade', 'Throw', 'High Damage, plus has secondary effect based on whichever State was last applied to your foe. Weakened State secondary effect ? Bleed causing Damage Over Time to enemy. Blinded State secondary effect ? Rally causing Heal Over Time to to you.  Gassed State secondary effect ? Elude causing increased Damage Resistance to you. Secondary Effects all last 6 seconds.', '2', '25', 'isp3', 808, 'AP2', 'a4', 'h', 'p', 'sp_ef2', 9000, 0, 0, 'm', 1, 0, '', 0),
(84, 'Super Taster', 'Cast3', 'Summons a Super Taster to bite your foe, Causing a DoT and slowing enemy for 6 seconds.', '1', '15', 'imm1', 808, 'APSP2', 'a1', 'h', 'p', 'sp_bite', 5000, 0, 0, 'm', 33, 0, '', 0),
(85, 'I Just Want Health', 'Cast1', 'Heals yourself for a small amount', '-1', '20', 'isi1', 808, '', 'a2', 's', 'p', 'sp_ed1', 3000, 0, 0, 'm', 0, 0, '', 0),
(86, 'We Want A Rock', 'Cast2', 'Petrify your opponent for 4 seconds.', '1.5', '20', 'iwshield,imc1', 808, '', 'a3', 'h', 'm', 'sp_ed1', 10000, 0, 0, 'm', 34, 0, '', 0),
(87, 'Mass Of Incandescent Gas', 'Cast1', 'Create a tiny SUN, causing massive damage, applies a DoT for 10 seconds.', '5', '30', 'iel2', 301, 'SP2', 'a4', 'h', 'm', 'sp_sun', 10000, 0, 0, 'm', 35, 0, '', 0),
(88, 'Purifying Flame', 'Cast1', 'Shoots a ball of holy fire at your foe causing damage over time.', '1', '20', 'ief1', 808, 'Party1', 'a1', 'h', 'm', 'sp_ef1', 6000, 0, 0, 'm', 36, 0, '', 0),
(89, 'Word of Light', 'Castgood', 'Heals you and your allies.', '-1.3', '30', 'iel2', 3000, 'Party1', 'a2', 'f', 'm', 'sp_el2', 10000, 10, 1, 'm', 0, 0, '', 0),
(90, 'Undermine', 'Attack3', 'Strike that does low damage but slows your enemy. Stuns enemies for four seconds.', '1', '10', 'isp3', 301, 'AP2', 'a3', 'h', 'p', '', 5000, 0, 0, 'm', 37, 0, '', 0),
(91, 'Light Wave', 'Cast2', 'You send out a wave of light that damages all enemies in range.', '2', '30', 'imh1,ieh1', 808, 'Party1', 'a4', 'h', 'm', 'sp_eh1', 10000, 5, 0, 'm', 1, 0, '', 0),
(92, 'Torture', 'Cast2', 'Magically torment your foe''s mind, causing slight damage but also reducing their damage and crit. Damage increase with each additional party member.', '3000', '10', 'imf1,ims4', 301, 'Party1', 'a1', 'h', 'm', 'sp_ed1', 3000, 0, 0, 'm', 1, 0, '', 0),
(93, 'Screaming Darkness', 'Cast3', 'Causes all foes within range to burst into flames, dealing moderate damage and causing them to burn for Damage over time. Effects increase with each additional party member.', '3505', '25', 'ied2,ied1', 808, 'Party1', 'a2', 'h', 'm', 'sp_ef2', 12000, 5, 1, 'm', 1, 0, '', 0),
(94, 'Dark Challenge', 'Castgood', 'Has a 50/50 chance of either stunning your foe a few seconds or giving you back some health. Healing effects increase with each additional party member.', '850', '25', 'imh2,ime1', 301, '', 'a3', 'h', 'm', '', 10000, 0, 0, 'm', 1, 0, '', 0),
(95, 'Miasma', 'Thrash', 'Deals massive damage and significantly lowers your target''s ability to hit anything for a short while.', '2500', '50', 'isp1', 301, 'AP2', 'a4', 'h', 'p', '', 8000, 0, 0, 'm', 1, 0, '', 0),
(96, 'Mark for Death', 'RangedAttack1', 'Deals light damage and applies Death Mark to your foe and reduces foe''s damage by 5%', '1.3', '5', 'isp3', 808, 'AP1', 'a1', 'h', 'p', '', 1500, 0, 0, 'm', 41, 0, '', 0),
(97, 'Scorching Arrow', 'RangedAttack1', 'Launches a flaming arrow at your enemy, dealing moderate damage, also burning them with a fire DoT.', '1.1', '15', 'ief2', 808, 'AP1', 'a2', 'h', 'p', 'sp_ef2', 10000, 0, 0, 'm', 42, 0, '', 0),
(98, 'Explosive Bolt', 'RangedAttack1', 'This arrow has an explosive tip which explodes on impact, dealing high damage. ', '1.5', '25', 'ime2', 808, 'Ranger2', 'a3', 'h', 'p', 'sp_ef2', 3000, 4, 1, 'm', 0, 0, '', 0),
(99, 'Vampiric Shot', 'RangedAttack1', 'You fire a magic arrow inscribed with runes and apply a Healing overtime to yourself.', '-2', '40', 'imf2,ied1', 808, 'Ranger3', 'a4', 's', 'p', 'sp_ed2', 30000, 0, 0, 'm', 43, 0, '', 0),
(100, 'Blood Boil', 'Castgood:PetBuff', 'Summons your Battle Pet or focuses your anger through your pet to DOUBLE their damage for a short time.', '1', '25', 'iss1', 301, '', 'a1', 's', 'm', '', 15000, 0, 0, 'm', 1, 0, '', 0),
(101, 'Dark Power', 'Cast2', 'You strike out at your foes with arcing energy, doing light damage and applying Deep Rage to all foes hit. Damage increases with stacks of Deep Rage which stacks up to 5 times.', '5', '15', 'ied2', 808, 'Spell1', 'a2', 'h', 'm', 'lit1', 6000, 4, 1, 'm', 1, 0, '', 0),
(102, 'Blinding Pain', 'Cast3', 'Medium damage to all enemies, 50% Chance to stun all enemies in range for 4 seconds and reduces enemy damage. Damage reduction increases with stacks of Deep Rage.', '5', '25', 'imd1,imc1', 808, 'SP2', 'a3', 'h', 'm', 'sp_ed1', 10000, 4, 1, 'm', 1, 0, '', 0),
(103, 'Renewal Spell', 'Castgood', 'Requires at least one stack of Deep Rage. Restores some Health and Mana but reduces haste severely for a short time. Health, Mana and Haste Reduction increases based on stacks of Deep Rage.', '-3', '0', 'isi1', 301, 'Dark1', 'a4', 's', 'm', 'sp_ef2', 30000, 0, 0, 'm', 1, 0, '', 0),
(104, 'Energy Arc', 'Cast2', 'Calls from the power of the storm to demolish all enemies in its path.', '3', '35', 'iee2', 808, 'Spell1', 'a1', 'h', 'm', 'lit1', 10000, 4, 1, 'm', 0, 0, '', 0),
(105, 'Frostflame', 'Cast2', 'A freezing fire that will cause moderate ice damage and slow your enemies.', '4', '25', 'ief2,iei3', 808, 'Spell1', 'a2', 'h', 'm', 'sp_ice1', 5000, 0, 0, 'm', 22, 0, '', 0),
(106, 'Energy Drain', 'Castgood', 'Convert your own energy into mana but slows your attack and lowers your damage for a while.', '0', '-20', 'isi1', 808, 'Convert1', 'a3', 's', 'm', 'sp_ef2', 6000, 0, 0, 'm', 21, 0, '', 0),
(107, 'Weakness Sigil', 'Cast3', 'Heals you for a little bit, increases the effectiveness of all other skills and increases your chance to crit on your.', '-8', '20', 'imd1', 808, '', 'a4', 's', 'm', 'sp_ee1', 5000, 0, 0, 'm', 0, 0, '', 0),
(108, 'Holy Smite', 'Cast2', 'A powerful blast of holy energy, dealing massive damage to your target.', '4.5', '40', 'iel2', 808, 'Mage2', 'a4', 'h', 'p', 'sp_HolySmite', 10000, 0, 0, 'p', 0, 0, '', 0),
(109, 'God Spell', 'Cast2', 'A powerful blast of holy energy, dealing massive damage to your target.', '5', '1', 'ime3', 808, 'Mage2', 'a5', 'h', 'p', 'sp_EnslavedSoul', 3000, 0, 0, 'p', 0, 0, '', 0),
(110, 'Viper''s Kiss', 'Attack4', 'Instantly cause 50% weapon damage, and apply a poison dealing additional damage over 10s', '0.5', '20', 'isp1', 505, 'AP2', 'a1', 'h', 'p', '', 3000, 0, 0, 'm', 23, 0, '', 0),
(111, 'Opportunity''s Strike', 'Stab', 'Quickly strikes your opponent for a good amount of damage.', '1.5', '10', 'iiclass,imc1', 301, 'Thief1', 'a2', 'h', 'p', '', 4000, 0, 0, 'm', 0, 0, '', 0),
(112, 'Stiletto', 'Attack3', 'Deals moderate damage, and applies Concealed Blade, causing your attacks to increase in damage for 20 seconds.', '0.8', '20', 'iwdagger', 301, 'AP2', 'a3', 'h', 'p', '', 60000, 0, 0, 'm', 24, 0, '', 0),
(113, 'Footwork', 'Bow', 'Increases your chance to dodge by 30% for 15 seconds', '0', '25', 'imp1,imf1', 301, '', 'a4', 's', 'm', '', 30000, 0, 0, 'm', 0, 0, '', 0),
(114, 'Sear', 'Cast2', 'Scorches your foe for light damage. Also applies Scorch for Damage over Time.', '0.75', '10', 'ief1', 301, 'AP2', 'a1', 'h', 'm', 'sp_ef3', 6000, 0, 0, 'w', 25, 0, 'sp_ef3', 0),
(115, 'Withering Blast', 'Cast3', 'A blast of flame leaps from your hands burning multiple enemies around you, also causes a burn effect for damage over time and reduces enemy damage for a short time. ', '1.1', '20', 'ime2', 808, 'Pyro1', 'a2', 'h', 'm', 'sp_ef5', 12000, 4, 1, 'w', 26, 0, 'sp_ef5', 0),
(116, 'Burning Ward', 'Castgood', 'Surround yourself in a magic shield of fire. Reduces incoming damage, heals for a small amount .', '-1.5', '35', 'iel2', 301, 'AP2', 'a3', 's', 'm', 'sp_ef4', 20000, 0, 0, 'w', 0, 0, 'sp_ef4', 0),
(117, 'Flame Orb', 'Cast1', 'A massive fireball flies at your target exploding for HIGH damage, also also causing a burn effect for damage over time.', '3', '30', 'ief2', 808, 'Pyro1', 'a4', 'h', 'm', 'sp_ef6', 40000, 0, 0, 'p', 27, 0, 'sp_ef6', 0),
(118, 'Autoplay', 'Airguitar,Dance,Dance2', 'Enemies are as affected by your song as by any attack.', '0.9', '0', 'iwd1', 301, 'SP2', 'aa', 'h', 'aa', '', 1500, 0, 0, 'm', 1, 0, '', 0),
(119, 'Bodhran', 'Castgood', 'Drums of war inspire your allies, raising damage by 20%, haste by 10%, and their critical strike chance by 5%. Lasts 15 seconds.', '', '20', 'imr2,iiclass2', 3000, '', 'a1', 'f', 'm', 'sp_el2', 15000, 20, 1, 'w', 1, 0, 'sp_el2', 0),
(120, 'Cantor''s Lament', 'Unsheath', 'Deals moderate damage to target. Applies Crescendo, a DoT that gets stronger every time the target is attacked, lasting 10 seconds.', '0.6', '10', 'iep1', 808, 'SP1', 'a2', 'h', 'm', '', 2000, 0, 0, 'm', 1, 0, '', 0),
(121, 'O''Carolan''s Reel', 'Castgood', 'Perfect for skirmishes, brawls, battles, wars, and fighting in general, O''Carolan''s Reel applies a Heal-Over-Time (HoT) effect to all nearby allies.', '', '30', 'ieh1,iee1', 3000, '', 'a3', 'f', 'm', 'sp_eh1', 12000, 20, 1, 'w', 1, 0, 'sp_eh1', 0),
(122, 'Dissonance', 'Unsheath,Laugh', 'Reduces the target''s damage and haste by 15%, and critical strike chance by 5%, and grants additional mana to attackers striking the target for 15 seconds.', '', '10', 'iwarmor', 808, '', 'a4', 'h', 'm', 'sp_eh1', 15000, 0, 0, 'w', 1, 0, 'sp_eh1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `meh_skills_auras`
--

CREATE TABLE `meh_skills_auras` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `name` varchar(20) CHARACTER SET latin1 NOT NULL,
  `duration` smallint(3) NOT NULL DEFAULT '6',
  `category` varchar(10) CHARACTER SET latin1 NOT NULL,
  `chance` double NOT NULL,
  `crit` varchar(62) NOT NULL DEFAULT '0',
  `damage` varchar(4) NOT NULL DEFAULT '1.0',
  `speed` double NOT NULL,
  `resistance` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_skills_auras`
--

INSERT INTO `meh_skills_auras` (`id`, `name`, `duration`, `category`, `chance`, `crit`, `damage`, `speed`, `resistance`) VALUES
(1, 'Prepared Strike', 2, '', 0, '1', '1.5', 0, 0),
(2, 'Stun', 3, 'stun', 0, '0', '0.8', 0, 0),
(3, 'Burned', 6, 'd', 0, '0', '0.6', 0, 0),
(4, 'Freeze', 4, 'freeze', 0, '0', '1', 0, 0),
(5, 'Bleed', 5, 'd', 0, '0', '0.52', 0, 0),
(6, 'Poison', 10, 'd', 0, '0', '0.45', 0, 0),
(7, 'paralysis', 3, 'disabled', 0, '0', '0.8', 0, 0),
(8, 'Focus', 3, '', 0, '0', '1.15', 0, 0),
(9, 'Heartbeat', 5, '', 0, '0', '1.05', 0, 0),
(10, 'Radiance', 12, 'd', 0, '0', '0.32', 0, 0),
(11, 'Energy Flow', 7, 'd', 0, '0', '6', 0, 0),
(12, 'Critical Striker', 7, '', 0, '0.8', '1', 0, 0),
(13, 'Lesser Radiance', 12, 'd', 0, '0', '0.12', 0, 0),
(14, 'Bunker Buster', 2, '', 0, '1', '1.0', 0, 0),
(15, 'Enchanted Blade', 12, '', 0, '0', '1.5', 0, 0),
(16, 'Arcane Devastation', 2, '', 0, '0', '1.3', 0, 0),
(17, 'Regeneration', 12, 'd', 0, '0', '0.32', 0, 0),
(18, 'Draw Blood', 6, '', 0, '0', '1.35', 0, 0),
(19, 'Soul Grip', 8, 'stun', 0, '0', '1', 0, 0),
(20, 'Draw Blood', 6, '', 0, '0', '1.12', 0.02, 0),
(21, 'Energy Drain', 8, '', 0, '0', '0.90', -0.1, 0),
(22, 'Frost Flame', 7, 'd', 0, '0', '.8', 0, 0),
(23, 'Viper''s Kiss', 10, 'd', 0, '0', '1', 0, 0),
(24, 'Concealed Blade', 20, '', 0, '1', '1.5', 0, 0),
(25, 'Scorch', 8, 'd', 0, '0', '.8', 0, 0),
(26, 'Withering Blast', 9, 'd', 0, '0', '.9', 0, 0),
(27, 'Flame Orb', 10, 'd', 0, '0', '1', 0, 0),
(28, 'Death''s Chill', 8, 'd', 0, '0', '.95', 0, 0),
(29, 'Chilling Strike', 11, 'd', 0, '0', '.95', 0.01, 0),
(30, 'Frost Fang', 8, 'd', 0, '0', '1', 0.04, 0),
(31, 'Death Grip', 10, 'd', 0, '0', '1.2', 0, 0),
(32, 'Death Shroud', 10, 'd', 0, '0', '.7', -0.1, 0.4),
(33, 'Super Taster', 6, 'd', 0, '0', '1', -0.04, 0),
(34, 'Petrify', 4, 'stone', 0, '0', '1', 0, 0),
(35, 'Mass Of Incandescent', 10, 'd', 0, '0', '1.1', 0, 0),
(36, 'Purifying Flame', 6, 'd', 0, '0', '1', 0, 0),
(37, 'Stun', 4, 'stun', 0, '0', '0.8', 0, 0),
(38, 'DragonBurn ', 8, 'd', 0, '0', '.9', 0, 0),
(39, 'Lliath''s Torrent', 6, 'stun', 0.8, '0', '0.8', 0, 0),
(40, 'Duradun''s Scales', 6, '', 0, '0', '0', 0, 0.75),
(41, 'Mark for Death', 9, '', 0, '0', '1', 0, 0.05),
(42, 'Firey Arrow', 7, 'd', 0, '0', '.9', 0, 0),
(43, 'Magic Heal', 6, 'd', 0, '0', '.9', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meh_users`
--

CREATE TABLE `meh_users` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` char(17) NOT NULL,
  `Access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ActivationFlag` tinyint(1) NOT NULL DEFAULT '5',
  `Age` tinyint(3) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Level` smallint(2) UNSIGNED NOT NULL DEFAULT '1',
  `Gold` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Diamonds` int(11) NOT NULL,
  `Coins` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Exp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ColorHair` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ColorSkin` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ColorEye` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ColorBase` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ColorTrim` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ColorAccessory` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `DateCreated` varchar(64) NOT NULL,
  `LastLogin` datetime NOT NULL,
  `Upgraded` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `UpgradeExpire` datetime NOT NULL,
  `UpgradeDays` smallint(5) NOT NULL DEFAULT '-1',
  `Country` varchar(65) NOT NULL,
  `LastArea` varchar(105) NOT NULL DEFAULT 'teleport-1|Enter|Spawn',
  `BankSlots` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `HouseSlots` smallint(3) UNSIGNED NOT NULL DEFAULT '20',
  `BagSlots` smallint(3) UNSIGNED NOT NULL DEFAULT '40',
  `HairID` smallint(3) UNSIGNED NOT NULL,
  `Permamute` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Quests` char(100) NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `Quests2` char(100) NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `Settings` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Achievement` smallint(5) UNSIGNED NOT NULL DEFAULT '2048',
  `DailyQuest0` smallint(11) UNSIGNED NOT NULL DEFAULT '0',
  `DailyQuest1` smallint(11) UNSIGNED NOT NULL DEFAULT '0',
  `DailyQuest2` smallint(11) UNSIGNED NOT NULL DEFAULT '0',
  `MonthlyQuest0` smallint(11) UNSIGNED NOT NULL DEFAULT '0',
  `Founder` tinyint(1) NOT NULL DEFAULT '0',
  `GuildRank` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `GuildID` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `CurrentServer` varchar(40) NOT NULL,
  `HouseInfo` text NOT NULL,
  `Kills` bigint(10) UNSIGNED NOT NULL DEFAULT '0',
  `PKills` int(11) NOT NULL DEFAULT '0',
  `Deaths` bigint(10) UNSIGNED NOT NULL DEFAULT '0',
  `PDeaths` int(11) NOT NULL DEFAULT '0',
  `XpBoost` datetime NOT NULL DEFAULT '2013-01-01 00:00:00',
  `GoldBoost` datetime NOT NULL DEFAULT '2013-01-01 00:00:00',
  `RepBoost` datetime NOT NULL DEFAULT '2013-01-01 00:00:00',
  `CpBoost` datetime NOT NULL DEFAULT '2013-01-01 00:00:00',
  `HairFile` varchar(65) NOT NULL,
  `HairName` varchar(56) NOT NULL,
  `LoginCount` varchar(64) NOT NULL DEFAULT '0',
  `ip` varchar(64) NOT NULL,
  `LoginIP` varchar(65) NOT NULL,
  `AchievementID` int(11) NOT NULL,
  `RankID` int(11) NOT NULL,
  `HPage` int(11) NOT NULL,
  `RestrictionCode` varchar(254) NOT NULL,
  `CTID` int(65) NOT NULL,
  `CTL` int(11) NOT NULL,
  `CTA` int(11) NOT NULL,
  `CTI` varchar(254) NOT NULL DEFAULT '926:1',
  `CTG` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meh_users_factions`
--

CREATE TABLE `meh_users_factions` (
  `id` int(11) NOT NULL,
  `userid` int(225) NOT NULL,
  `factionid` int(225) NOT NULL,
  `reputation` int(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meh_users_friends`
--

CREATE TABLE `meh_users_friends` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `Friends` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meh_users_guilds`
--

CREATE TABLE `meh_users_guilds` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL DEFAULT 'Undefined',
  `Description` varchar(500) NOT NULL DEFAULT 'Undefined',
  `MOTD` varchar(500) NOT NULL,
  `Founder` smallint(5) UNSIGNED NOT NULL,
  `Members` text NOT NULL,
  `Pending` varchar(64) NOT NULL DEFAULT '0',
  `Type` tinyint(1) NOT NULL DEFAULT '1',
  `DateCreated` varchar(50) NOT NULL DEFAULT 'Undefined',
  `Color` varchar(50) NOT NULL DEFAULT '16777215',
  `MaxMembers` int(5) NOT NULL DEFAULT '15',
  `GuildGold` int(254) NOT NULL DEFAULT '0',
  `GuildValor` int(254) NOT NULL DEFAULT '0',
  `GuildLevel` int(11) NOT NULL DEFAULT '1',
  `GuildEXP` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meh_users_guilds_logs`
--

CREATE TABLE `meh_users_guilds_logs` (
  `id` int(11) NOT NULL,
  `GuildID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Action` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meh_users_items`
--

CREATE TABLE `meh_users_items` (
  `id` bigint(225) UNSIGNED NOT NULL,
  `userid` smallint(3) UNSIGNED NOT NULL,
  `itemid` smallint(3) UNSIGNED NOT NULL,
  `equipped` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `equipment` char(6) NOT NULL,
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `quantity` mediumint(6) UNSIGNED NOT NULL DEFAULT '1',
  `inbank` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `enhid` int(20) NOT NULL DEFAULT '0',
  `dPurchase` varchar(256) NOT NULL DEFAULT '2014-01-01 01:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meh_users_logs`
--

CREATE TABLE `meh_users_logs` (
  `id` int(11) NOT NULL,
  `User` varchar(64) NOT NULL,
  `IP` varchar(64) NOT NULL,
  `Action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meh_users_suspicious`
--

CREATE TABLE `meh_users_suspicious` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `charname` varchar(40) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `address` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meh_warzones`
--

CREATE TABLE `meh_warzones` (
  `id` int(11) NOT NULL,
  `Name` varchar(254) NOT NULL,
  `QueuedUsers` varchar(254) NOT NULL,
  `bStarted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meh_warzones`
--

INSERT INTO `meh_warzones` (`id`, `Name`, `QueuedUsers`, `bStarted`) VALUES
(1, 'bludrutbrawl', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `meh_wheel`
--

CREATE TABLE `meh_wheel` (
  `id` int(11) NOT NULL,
  `Doom` text NOT NULL,
  `Destiny` text NOT NULL,
  `DoomBoost` int(11) NOT NULL DEFAULT '19189',
  `DestinyBoost` int(11) NOT NULL DEFAULT '19189',
  `FortunePotion` int(11) NOT NULL DEFAULT '18927'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meh_wheel`
--

INSERT INTO `meh_wheel` (`id`, `Doom`, `Destiny`, `DoomBoost`, `DestinyBoost`, `FortunePotion`) VALUES
(1, '3073,3074,3075,3076', '3128,3129,3130,3131', 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `web_contact`
--

CREATE TABLE `web_contact` (
  `id` int(11) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Description` text NOT NULL,
  `UPosted` varchar(264) NOT NULL,
  `bRead` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_designnotes`
--

CREATE TABLE `web_designnotes` (
  `id` int(11) NOT NULL,
  `strAvatar` varchar(254) NOT NULL,
  `strAuthor` varchar(254) NOT NULL,
  `strDate` varchar(254) NOT NULL,
  `strTitle` varchar(254) NOT NULL,
  `strContent` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_designnotes`
--

INSERT INTO `web_designnotes` (`id`, `strAvatar`, `strAuthor`, `strDate`, `strTitle`, `strContent`) VALUES
(1, 'Tigru', 'Tigru', 'March 15, 2015', 'Welcome to Orakle', 'Welcome one and all to Orakle! We are currently in alpha stages so if you happen to run into any bugs, please report them immediately. We have many custom features and we hope you enjoy your stay.'),
(2, 'Tigru', 'Tigru', 'March 21, 2015', 'Chest Of Goodies!', 'Let''s just keep the releases rolling! Now in game is the chest of goodies. This will allow you to redeem codes that we give out that will have a chance for gold, xp, items, or even KKs! In order to use this chest click on the Redeem Code button under your character button: [br][center][img]http://i.gyazo.com/e876821e7e9d6edbba540d5401687f7f.png[/img][br][img]http://i.gyazo.com/5497a2af04b2ca2da11c02b325e4d5c6.png[/img][br](An example of the chest)[/center][br]Try out these codes as a free gift from us: FreeGold, and FreeXP . Happy hunting and more releases are on the way!');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meh_achievements`
--
ALTER TABLE `meh_achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_classes`
--
ALTER TABLE `meh_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_codes`
--
ALTER TABLE `meh_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Code` (`Code`);

--
-- Indexes for table `meh_codes_redemeed`
--
ALTER TABLE `meh_codes_redemeed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_enhancements`
--
ALTER TABLE `meh_enhancements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_enhance_info`
--
ALTER TABLE `meh_enhance_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_factions`
--
ALTER TABLE `meh_factions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_hairs`
--
ALTER TABLE `meh_hairs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_hairshop`
--
ALTER TABLE `meh_hairshop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_items`
--
ALTER TABLE `meh_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_items_shops`
--
ALTER TABLE `meh_items_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_maps`
--
ALTER TABLE `meh_maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_maps_mtc`
--
ALTER TABLE `meh_maps_mtc`
  ADD KEY `FK_MAPID` (`mapid`);

--
-- Indexes for table `meh_monsters`
--
ALTER TABLE `meh_monsters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_panel_login`
--
ALTER TABLE `meh_panel_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_quests`
--
ALTER TABLE `meh_quests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_servers`
--
ALTER TABLE `meh_servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_settings_login`
--
ALTER TABLE `meh_settings_login`
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `meh_settings_rates`
--
ALTER TABLE `meh_settings_rates`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `meh_skills`
--
ALTER TABLE `meh_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_skills_auras`
--
ALTER TABLE `meh_skills_auras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_users`
--
ALTER TABLE `meh_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_users_factions`
--
ALTER TABLE `meh_users_factions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_users_friends`
--
ALTER TABLE `meh_users_friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_users_guilds`
--
ALTER TABLE `meh_users_guilds`
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `meh_users_guilds_logs`
--
ALTER TABLE `meh_users_guilds_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_users_items`
--
ALTER TABLE `meh_users_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `meh_users_logs`
--
ALTER TABLE `meh_users_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_users_suspicious`
--
ALTER TABLE `meh_users_suspicious`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_warzones`
--
ALTER TABLE `meh_warzones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meh_wheel`
--
ALTER TABLE `meh_wheel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_contact`
--
ALTER TABLE `web_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_designnotes`
--
ALTER TABLE `web_designnotes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meh_achievements`
--
ALTER TABLE `meh_achievements`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `meh_codes`
--
ALTER TABLE `meh_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `meh_codes_redemeed`
--
ALTER TABLE `meh_codes_redemeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT for table `meh_enhancements`
--
ALTER TABLE `meh_enhancements`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;
--
-- AUTO_INCREMENT for table `meh_enhance_info`
--
ALTER TABLE `meh_enhance_info`
  MODIFY `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `meh_factions`
--
ALTER TABLE `meh_factions`
  MODIFY `id` mediumint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `meh_hairs`
--
ALTER TABLE `meh_hairs`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;
--
-- AUTO_INCREMENT for table `meh_hairshop`
--
ALTER TABLE `meh_hairshop`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `meh_items`
--
ALTER TABLE `meh_items`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=986445;
--
-- AUTO_INCREMENT for table `meh_items_shops`
--
ALTER TABLE `meh_items_shops`
  MODIFY `id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12346;
--
-- AUTO_INCREMENT for table `meh_maps`
--
ALTER TABLE `meh_maps`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `meh_quests`
--
ALTER TABLE `meh_quests`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3077;
--
-- AUTO_INCREMENT for table `meh_servers`
--
ALTER TABLE `meh_servers`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `meh_skills`
--
ALTER TABLE `meh_skills`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `meh_skills_auras`
--
ALTER TABLE `meh_skills_auras`
  MODIFY `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `meh_users`
--
ALTER TABLE `meh_users`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `meh_users_factions`
--
ALTER TABLE `meh_users_factions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meh_users_friends`
--
ALTER TABLE `meh_users_friends`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `meh_users_guilds`
--
ALTER TABLE `meh_users_guilds`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meh_users_guilds_logs`
--
ALTER TABLE `meh_users_guilds_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meh_users_items`
--
ALTER TABLE `meh_users_items`
  MODIFY `id` bigint(225) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `meh_users_logs`
--
ALTER TABLE `meh_users_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meh_users_suspicious`
--
ALTER TABLE `meh_users_suspicious`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meh_warzones`
--
ALTER TABLE `meh_warzones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `meh_wheel`
--
ALTER TABLE `meh_wheel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `web_contact`
--
ALTER TABLE `web_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `web_designnotes`
--
ALTER TABLE `web_designnotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
