-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2025 at 02:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_review`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `image_uri` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `description`, `release_year`, `genre`, `image_uri`) VALUES
(72, 'Berserk: The Golden Age Arc', 'The trilogy follows the story of Guts, a mercenary with a tragic past, who joins the Band of the Hawk, led by the charismatic Griffith. It explores themes of ambition, betrayal, and the struggle between fate and free will, culminating in a dark and tragic turn of events during the Eclipse.', 2013, 'Action, Animation, Adventure, Dark Fantasy, Drama', 'https://m.media-amazon.com/images/M/MV5BYmYwZGE5OGItOGYzNC00OTM3LThhYjEtMmU4OGMwYmIxYjQxXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),
(73, 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 1994, 'Drama', 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
(74, 'Jujutsu Kaisen 0', 'The movie follows Yuta Okkotsu, a cursed individual who is haunted by the spirit of his childhood friend, Rika, turned into a powerful curse. He is enrolled at the Tokyo Metropolitan Magic Technical College, where he trains alongside other jujutsu sorcerers to learn how to control his curse and confront the threats that come with it. The film delves into Yuta\'s journey of self-discovery and his battle against curses.', 2021, 'Action, Supernatural, Dark Fantasy, Horror, School, Anime', 'https://m.media-amazon.com/images/M/MV5BMzNhZTdmNDYtNTA0NC00MmNmLWIzYjUtNjg5NzNlYWQ0N2E5XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),
(75, 'Sing Street', 'Set in 1980s Dublin, the film follows a 14-year-old boy named Conor who forms a band to impress a mysterious girl named Raphina. As Conor navigates family troubles and the struggles of growing up, he uses music as an outlet for his emotions and desires. The film is a celebration of youth, creativity, and the power of music.', 2016, 'Musical, Drama, Comedy, Romance', 'https://m.media-amazon.com/images/M/MV5BMjEzODA3MDcxMl5BMl5BanBnXkFtZTgwODgxNDk3NzE@._V1_.jpg'),
(76, 'The Godfather', 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', 1972, 'Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(77, 'The Dark Knight', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 2008, 'Action, Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg'),
(78, 'The Godfather: Part II', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 1974, 'Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(79, '12 Angry Men', 'The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.', 1957, 'Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg'),
(81, 'The Lord of the Rings: The Return of the King', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 2003, 'Action, Adventure, Drama', 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(82, 'Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 1994, 'Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(83, 'The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 2001, 'Action, Adventure, Drama', 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg'),
(84, 'The Good, the Bad and the Ugly', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', 1966, 'Adventure, Western', 'https://m.media-amazon.com/images/M/MV5BNjJlYmNkZGItM2NhYy00MjlmLTk5NmQtNjg1NmM2ODU4OTMwXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg'),
(85, 'Forrest Gump', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweeth', 1994, 'Drama, Romance', 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'),
(86, 'Fight Club', 'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.', 1999, 'Drama', 'https://m.media-amazon.com/images/M/MV5BNDIzNDU0YzEtYzE5Ni00ZjlkLTk5ZjgtNjM3NWE4YzA3Nzk3XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg'),
(87, 'Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.', 2010, 'Action, Adventure, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg'),
(88, 'The Lord of the Rings: The Two Towers', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron\'s new ally, Saruman, and his hordes of Isengard.', 2002, 'Action, Adventure, Drama', 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(89, 'Star Wars: Episode V - The Empire Strikes Back', 'After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader and bounty hunter Boba Fett.', 1980, 'Action, Adventure, Fantasy', 'https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(90, 'The Matrix', 'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.', 1999, 'Action, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(91, 'Goodfellas', 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', 1990, 'Biography, Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(92, 'One Flew Over the Cuckoo\'s Nest', 'A criminal pleads insanity and is admitted to a mental institution, where he rebels against the oppressive nurse and rallies up the scared patients.', 1975, 'Drama', 'https://m.media-amazon.com/images/M/MV5BZjA0OWVhOTAtYWQxNi00YzNhLWI4ZjYtNjFjZTEyYjJlNDVlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'),
(93, 'Se7en', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', 1995, 'Crime, Drama, Mystery', 'https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(94, 'Seven Samurai', 'A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.', 1954, 'Action, Drama', 'https://m.media-amazon.com/images/I/51A53YH9vuL._AC_UF894,1000_QL80_.jpg'),
(96, 'The Silence of the Lambs', 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', 1991, 'Crime, Drama, Thriller', 'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(97, 'Bleach: Memories of Nobody', 'Bleach: Memories of Nobody (2006) follows Ichigo and Rukia as they protect Senna, a mysterious Soul Reaper, from the Dark Ones, who plan to merge the Human World and Soul Society.\n\n\n\n\n\n\n\n', 2006, 'Animation, Supernatural', 'https://i.pinimg.com/736x/83/ee/84/83ee84cb5bc71c0520b665a328c9cd62.jpg'),
(100, 'The Green Mile', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 1999, 'Crime, Drama, Fantasy', 'https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_SX300.jpg'),
(101, 'Star Wars', 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vad', 1977, 'Action, Adventure, Fantasy', 'https://m.media-amazon.com/images/I/81wW3zBzN-L._AC_UF894,1000_QL80_.jpg'),
(102, 'Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 2014, 'Adventure, Drama, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
(103, 'Terminator 2: Judgment Day', 'A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her ten-year-old son John from a more advanced and powerful cyborg.', 1991, 'Action, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(105, 'Spirited Away', 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.', 2001, 'Animation, Adventure, Family', 'https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
(106, 'Psycho', 'A Phoenix secretary embezzles $40,000 from her employer\'s client, goes on the run, and checks into a remote motel run by a young man under the domination of his mother.', 1960, 'Horror, Mystery, Thriller', 'https://m.media-amazon.com/images/M/MV5BNTQwNDM1YzItNDAxZC00NWY2LTk0M2UtNDIwNWI5OGUyNWUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(107, 'The Pianist', 'A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.', 2002, 'Biography, Drama, Music', 'https://m.media-amazon.com/images/M/MV5BOWRiZDIxZjktMTA1NC00MDQ2LWEzMjUtMTliZmY3NjQ3ODJiXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(109, 'Parasite', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', 2019, 'Comedy, Drama, Thriller', 'https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg'),
(110, 'The Lion King', 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', 1994, 'Animation, Adventure, Drama', 'https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_SX300.jpg'),
(111, 'Gladiator', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 2000, 'Action, Adventure, Drama', 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(115, 'The Prestige', 'After a tragic accident, two stage magicians in 1890s London engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.', 2006, 'Drama, Mystery, Thriller', 'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_SX300.jpg'),
(116, 'Casablanca', 'A cynical expatriate American cafe owner struggles to decide whether or not to help his former lover and her fugitive husband escape the Nazis in French Morocco.', 1942, 'Drama, Romance, War', 'https://m.media-amazon.com/images/M/MV5BY2IzZGY2YmEtYzljNS00NTM5LTgwMzUtMzM1NjQ4NGI0OTk0XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_SX300.jpg'),
(120, 'Once Upon a Time in the West', 'A mysterious stranger with a harmonica joins forces with a notorious desperado to protect a beautiful widow from a ruthless assassin working for the railroad.', 1968, 'Western', 'https://m.media-amazon.com/images/I/51rcTPOahuL._AC_UF1000,1000_QL80_.jpg'),
(122, 'Grave of the Fireflies', 'A young boy and his little sister struggle to survive in Japan during World War II.', 1988, 'Animation, Drama, War', 'https://m.media-amazon.com/images/M/MV5BZmY2NjUzNDQtNTgxNC00M2Q4LTljOWQtMjNjNDBjNWUxNmJlXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg'),
(123, 'Alien', 'The crew of a commercial spacecraft encounter a deadly lifeform after investigating an unknown transmission.', 1979, 'Horror, Sci-Fi', 'https://m.media-amazon.com/images/I/61H6wveXP+L._AC_UF1000,1000_QL80_.jpg'),
(126, 'Memento', 'A man with short-term memory loss attempts to track down his wife\'s murderer.', 2000, 'Mystery, Thriller', 'https://m.media-amazon.com/images/M/MV5BZTcyNjk1MjgtOWI3Mi00YzQwLWI5MTktMzY4ZmI2NDAyNzYzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(129, 'Indiana Jones and the Raiders of the Lost Ark', 'In 1936, archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before Adolf Hitler\'s Nazis can obtain its awesome powers.', 1981, 'Action, Adventure', 'https://m.media-amazon.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_SX300.jpg'),
(136, 'The Great Dictator', 'Dictator Adenoid Hynkel tries to expand his empire while a poor Jewish barber tries to avoid persecution from Hynkel\'s regime.', 1940, 'Comedy, Drama, War', 'https://m.media-amazon.com/images/M/MV5BMmExYWJjNTktNGUyZS00ODhmLTkxYzAtNWIzOGEyMGNiMmUwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(137, 'Avengers: Infinity War', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', 2018, 'Action, Adventure, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_SX300.jpg'),
(138, 'Made in Abyss: Dawn of the Deep Soul', 'a dark fantasy adventure film following Riko, Reg, and Nanachi as they descend into the Abyss’s fifth layer and confront the sinister Bondrewd.', 2020, 'Animation, dark fantasy', 'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p18029358_p_v8_aa.jpg'),
(139, 'Aliens', 'Fifty-seven years after surviving an apocalyptic attack aboard her space vessel by merciless space creatures, Officer Ripley awakens from hyper-sleep and tries to warn anyone who will listen about the predators.', 1986, 'Action, Adventure, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BZGU2OGY5ZTYtMWNhYy00NjZiLWI0NjUtZmNhY2JhNDRmODU3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(141, 'The Dark Knight Rises', 'Eight years after the Joker\'s reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.', 2012, 'Action, Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_SX300.jpg'),
(142, 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', 'An insane American general orders a bombing attack on the Soviet Union, triggering a path to nuclear holocaust that a war room full of politicians and generals frantically tries to stop.', 1964, 'Comedy, War', 'https://m.media-amazon.com/images/M/MV5BZWI3ZTMxNjctMjdlNS00NmUwLWFiM2YtZDUyY2I3N2MxYTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(143, 'Spider-Man: Into the Spider-Verse', 'Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.', 2018, 'Animation, Action, Adventure', 'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_SX300.jpg'),
(144, 'Joker', 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.', 2019, 'Crime, Drama, Thriller', 'https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'),
(145, 'Old Boy', 'After being kidnapped and imprisoned for fifteen years, Oh Dae-Su is released, only to find that he must find his captor in five days.', 2003, 'Action, Drama, Mystery', 'https://m.media-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_SX300.jpg'),
(147, 'Toy Story', 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy\'s room.', 1995, 'Animation, Adventure, Comedy', 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_SX300.jpg'),
(150, 'Spider-Man: No Way Home', 'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.', 2021, 'Action, Adventure, Fantasy', 'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_SX300.jpg'),
(153, 'Avengers: Endgame', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.', 2019, 'Action, Adventure, Drama', 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg'),
(154, 'Princess Mononoke', 'On a journey to find the cure for a Tatarigami\'s curse, Ashitaka finds himself in the middle of a war between the forest gods and Tatara, a mining colony. In this quest he also meets San, the Mononoke Hime.', 1997, 'Animation, Action, Adventure', 'https://m.media-amazon.com/images/M/MV5BNGIzY2IzODQtNThmMi00ZDE4LWI5YzAtNzNlZTM1ZjYyYjUyXkEyXkFqcGdeQXVyODEzNjM5OTQ@._V1_SX300.jpg'),
(155, 'Once Upon a Time in America', 'A former Prohibition-era Jewish gangster returns to the Lower East Side of Manhattan 35 years later, where he must once again confront the ghosts and regrets of his old life.', 1984, 'Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BMGFkNWI4MTMtNGQ0OC00MWVmLTk3MTktOGYxN2Y2YWVkZWE2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(156, 'Good Will Hunting', 'Will Hunting, a janitor at M.I.T., has a gift for mathematics, but needs help from a psychologist to find direction in his life.', 1997, 'Drama, Romance', 'https://m.media-amazon.com/images/M/MV5BOTI0MzcxMTYtZDVkMy00NjY1LTgyMTYtZmUxN2M3NmQ2NWJhXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'),
(157, 'Toy Story 3', 'The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it\'s up to Woody to convince the other toys that they weren\'t abandoned and to return home.', 2010, 'Animation, Adventure, Comedy', 'https://m.media-amazon.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@._V1_SX300.jpg'),
(158, 'Requiem for a Dream', 'The drug-induced utopias of four Coney Island people are shattered when their addictions run deep.', 2000, 'Drama', 'https://m.media-amazon.com/images/M/MV5BOTdiNzJlOWUtNWMwNS00NmFlLWI0YTEtZmI3YjIzZWUyY2Y3XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(159, '3 Idiots', 'Two friends are searching for their long lost companion. They revisit their college days and recall the memories of their friend who inspired them to think differently, even as the rest of the world called them \"idiots\".', 2009, 'Comedy, Drama', 'https://m.media-amazon.com/images/M/MV5BNTkyOGVjMGEtNmQzZi00NzFlLTlhOWQtODYyMDc2ZGJmYzFhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(160, 'Your Name.', 'Two strangers find themselves linked in a bizarre way. When a connection forms, will distance be the only thing to keep them apart?', 2016, 'Animation, Drama, Fantasy', 'https://m.media-amazon.com/images/M/MV5BODRmZDVmNzUtZDA4ZC00NjhkLWI2M2UtN2M0ZDIzNDcxYThjL2ltYWdlXkEyXkFqcGdeQXVyNTk0MzMzODA@._V1_SX300.jpg'),
(162, 'Star Wars: Episode VI - Return of the Jedi', 'After a daring mission to rescue Han Solo from Jabba the Hutt, the Rebels dispatch to Endor to destroy the second Death Star. Meanwhile, Luke struggles to help Darth Vader back from the dark side without falling into the Emperor\'s tr', 1983, 'Action, Adventure, Fantasy', 'https://m.media-amazon.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'),
(167, 'Citizen Kane', 'Following the death of publishing tycoon Charles Foster Kane, reporters scramble to uncover the meaning of his final utterance; \'Rosebud\'.', 1941, 'Drama, Mystery', 'https://m.media-amazon.com/images/M/MV5BYjBiOTYxZWItMzdiZi00NjlkLWIzZTYtYmFhZjhiMTljOTdkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(174, 'Amélie', 'Amélie is an innocent and naive girl in Paris with her own sense of justice. She decides to help those around her and, along the way, discovers love.', 2001, 'Comedy, Romance', 'https://m.media-amazon.com/images/M/MV5BNDg4NjM1YjMtYmNhZC00MjM0LWFiZmYtNGY1YjA3MzZmODc5XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg'),
(177, 'Scarface', 'In 1980 Miami, a determined Cuban immigrant takes over a drug cartel and succumbs to greed.', 1983, 'Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BNjdjNGQ4NDEtNTEwYS00MTgxLTliYzQtYzE2ZDRiZjFhZmNlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(181, 'Taxi Driver', 'A mentally unstable veteran works as a nighttime taxi driver in New York City, where the perceived decadence and sleaze fuels his urge for violent action.', 1976, 'Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BM2M1MmVhNDgtNmI0YS00ZDNmLTkyNjctNTJiYTQ2N2NmYzc2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(182, 'To Kill a Mockingbird', 'Atticus Finch, a widowed lawyer in Depression-era Alabama, defends a black man against an undeserved rape charge, and his children against prejudice.', 1962, 'Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BNmVmYzcwNzMtMWM1NS00MWIyLThlMDEtYzUwZDgzODE1NmE2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(191, 'Indiana Jones and the Last Crusade', 'In 1938, after his father Professor Henry Jones, Sr. goes missing while pursuing the Holy Grail, Professor Henry \"Indiana\" Jones, Jr. finds himself up against Adolf Hitler\'s Nazis again to stop them from obtaining its powers.', 1989, 'Action, Adventure', 'https://m.media-amazon.com/images/M/MV5BMjNkMzc2N2QtNjVlNS00ZTk5LTg0MTgtODY2MDAwNTMwZjBjXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg'),
(192, 'A Separation', 'A married couple are faced with a difficult decision - to improve the life of their child by moving to another country or to stay in Iran and look after a deteriorating parent who has Alzheimer\'s disease.', 2011, 'Drama', 'https://m.media-amazon.com/images/M/MV5BN2JmMjViMjMtZTM5Mi00ZGZkLTk5YzctZDg5MjFjZDE4NjNkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
(196, '1917', 'April 6th, 1917. As an infantry battalion assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.', 2019, 'Action, Drama, War', 'https://m.media-amazon.com/images/M/MV5BOTdmNTFjNDEtNzg0My00ZjkxLTg1ZDAtZTdkMDc2ZmFiNWQ1XkEyXkFqcGdeQXVyNTAzNzgwNTg@._V1_SX300.jpg'),
(204, 'The Batman', 'When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city\'s hidden corruption and question his family\'s involvement.', 2022, 'Action, Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_SX300.jpg'),
(218, 'The Truman Show', 'An insurance salesman discovers his whole life is actually a reality TV show.', 1998, 'Comedy, Drama', 'https://m.media-amazon.com/images/M/MV5BMDIzODcyY2EtMmY2MC00ZWVlLTgwMzAtMjQwOWUyNmJjNTYyXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg'),
(221, 'Shutter Island', 'In 1954, a U.S. Marshal investigates the disappearance of a murderer who escaped from a hospital for the criminally insane.', 2010, 'Mystery, Thriller', 'https://m.media-amazon.com/images/M/MV5BYzhiNDkyNzktNTZmYS00ZTBkLTk2MDAtM2U0YjU1MzgxZjgzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
(224, 'Jurassic Park', 'A pragmatic paleontologist touring an almost complete theme park on an island in Central America is tasked with protecting a couple of kids after a power failure causes the park\'s cloned dinosaurs to run loose.', 1993, 'Action, Adventure, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_SX300.jpg'),
(227, 'Finding Nemo', 'After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.', 2003, 'Animation, Adventure, Comedy', 'https://m.media-amazon.com/images/I/71u4lXw8PBL.jpg'),
(229, 'V for Vendetta', 'In a future British tyranny, a shadowy freedom fighter, known only by the alias of \"V,\" plots to overthrow it with the help of a young woman.', 2005, 'Action, Drama, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BOTI5ODc3NzExNV5BMl5BanBnXkFtZTcwNzYxNzQzMw@@._V1_SX300.jpg'),
(238, 'Howl\'s Moving Castle', 'When an unconfident young woman is cursed with an old body by a spiteful witch, her only chance of breaking the spell lies with a self-indulgent yet insecure young wizard and his companions in his legged, walking castle.', 2004, 'Animation, Adventure, Family', 'https://m.media-amazon.com/images/M/MV5BNmM4YTFmMmItMGE3Yy00MmRkLTlmZGEtMzZlOTQzYjk3MzA2XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
(245, 'My Neighbor Totoro', 'When two girls move to the country to be near their ailing mother, they have adventures with the wondrous forest spirits who live nearby.', 1988, 'Animation, Comedy, Family', 'https://m.media-amazon.com/images/M/MV5BYzJjMTYyMjQtZDI0My00ZjE2LTkyNGYtOTllNGQxNDMyZjE0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
(248, 'Blade Runner', 'A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.', 1982, 'Action, Drama, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(249, 'Catch Me If You Can', 'Barely 21 yet, Frank is a skilled forger who has passed as a doctor, lawyer and pilot. FBI agent Carl becomes obsessed with tracking down the con man, who only revels in the pursuit.', 2002, 'Biography, Crime, Drama', 'https://m.media-amazon.com/images/M/MV5BMTY5MzYzNjc5NV5BMl5BanBnXkFtZTYwNTUyNTc2._V1_SX300.jpg'),
(252, 'Children of Heaven', 'After a boy loses his sister\'s pair of shoes, he goes on a series of adventures in order to find them. When he can\'t, he tries a new way to \"win\" a new pair.', 1997, 'Drama, Family, Sport', 'https://m.media-amazon.com/images/M/MV5BZTYwZWQ4ZTQtZWU0MS00N2YwLWEzMDItZWFkZWY0MWVjODVhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(267, 'Sherlock Jr.', 'A film projectionist longs to be a detective, and puts his meagre skills to work when he is framed by a rival for stealing his girlfriend\'s father\'s pocketwatch.', 1924, 'Action, Comedy, Romance', 'https://m.media-amazon.com/images/M/MV5BZWFhOGU5NDctY2Q3YS00Y2VlLWI1NzEtZmIwY2ZiZjY4OTA2XkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_SX300.jpg'),
(283, 'Rocky', 'A small-time Philadelphia boxer gets a supremely rare chance to fight the world heavyweight champion in a bout in which he strives to go the distance for his self-respect.', 1976, 'Drama, Sport', 'https://m.media-amazon.com/images/M/MV5BMTY5MDMzODUyOF5BMl5BanBnXkFtZTcwMTQ3NTMyNA@@._V1_SX300.jpg'),
(287, 'Ford v Ferrari', 'American car designer Carroll Shelby and driver Ken Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order to defeat Ferrari at the 24 Hours of Le Mans in 1966.', 2019, 'Action, Biography, Drama', 'https://m.media-amazon.com/images/M/MV5BM2UwMDVmMDItM2I2Yi00NGZmLTk4ZTUtY2JjNTQ3OGQ5ZjM2XkEyXkFqcGdeQXVyMTA1OTYzOTUx._V1_SX300.jpg'),
(288, 'The Terminator', 'A human soldier is sent from 2029 to 1984 to stop an almost indestructible cyborg killing machine, sent from the same year, which has been programmed to execute a young woman whose unborn son is the key to humanity\'s future salvation', 1984, 'Action, Sci-Fi', 'https://m.media-amazon.com/images/M/MV5BYTViNzMxZjEtZGEwNy00MDNiLWIzNGQtZDY2MjQ1OWViZjFmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(298, 'The Exorcist', 'When a 12-year-old girl is possessed by a mysterious entity, her mother seeks the help of two priests to save her.', 1973, 'Horror', 'https://m.media-amazon.com/images/M/MV5BYjhmMGMxZDYtMTkyNy00YWVmLTgyYmUtYTU3ZjcwNTBjN2I1XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),
(299, 'Hachi: A Dog\'s Tale', 'A college professor bonds with an abandoned dog he takes into his home.', 2009, 'Biography, Drama, Family', 'https://m.media-amazon.com/images/I/71VLLE1FUhL._AC_UF894,1000_QL80_.jpg'),
(300, 'The Incredibles', 'A family of undercover superheroes, while trying to live the quiet suburban life, are forced into action to save the world.', 2004, 'Animation, Action, Adventure', 'https://m.media-amazon.com/images/M/MV5BMTY5OTU0OTc2NV5BMl5BanBnXkFtZTcwMzU4MDcyMQ@@._V1_SX300.jpg'),
(304, 'Rebecca', 'A self-conscious woman juggles adjusting to her new role as an aristocrat\'s wife and avoiding being intimidated by his first wife\'s spectral presence.', 1940, 'Drama, Film-Noir, Mystery', 'https://m.media-amazon.com/images/I/711yqg+26nL._AC_UF1000,1000_QL80_.jpg'),
(309, 'Pirates of the Caribbean: The Curse of the Black Pearl', 'Blacksmith Will Turner teams up with eccentric pirate \"Captain\" Jack Sparrow to save his love, the governor\'s daughter, from Jack\'s former pirate allies, who are now undead.', 2003, 'Action, Adventure, Fantasy', 'https://m.media-amazon.com/images/M/MV5BNGYyZGM5MGMtYTY2Ni00M2Y1LWIzNjQtYWUzM2VlNGVhMDNhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
(312, 'The Sound of Music', 'A young novitiate is sent by her convent in 1930s Austria to become a governess to the seven children of a widowed naval officer.', 1965, 'Biography, Drama, Family', 'https://m.media-amazon.com/images/M/MV5BM2Q3YWMzMWItMjY4NS00ZjQ4LWEwYzQtODMwMjU1ZDg4ZjA4XkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_SX300.jpg'),
(315, 'Persona', 'A nurse is put in charge of a mute actress and finds that their personae are melding together.', 1966, 'Drama, Thriller', 'https://m.media-amazon.com/images/I/619QYsqoZ5L._AC_UF894,1000_QL80_.jpg'),
(318, 'Aladdin', 'A kindhearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.', 1992, 'Adventure, Comedy', 'https://m.media-amazon.com/images/I/71h9oLF41SL._AC_UF1000,1000_QL80_.jpg'),
(319, 'Dune', 'Feature adaptation of Frank Herbert\'s science fiction novel about the son of a noble family entrusted with the protection of the most valuable asset and most vital element in the galaxy.', 2021, 'Action, Adventure, Drama', 'https://m.media-amazon.com/images/M/MV5BN2FjNmEyNWMtYzM0ZS00NjIyLTg5YzYtYThlMGVjNzE1OGViXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` float DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `movie_id`, `user_id`, `rating`, `comment`, `review_date`) VALUES
(1001, 72, 15, 4.5, 'Solid animation, but the pacing felt off at times.', '2024-01-18 23:00:00'),
(1002, 97, 3, 5, 'A masterpiece of anime storytelling—not for the faint-hearted!', '2025-02-09 23:00:00'),
(1003, 73, 27, 5, 'Timeless classic—hope and friendship shine through every scene!', '2023-11-29 23:00:00'),
(1004, 97, 51, 5, 'Morgan Freeman’s narration is perfection. A must-watch!', '2024-07-21 23:00:00'),
(1006, 74, 36, 4, 'Fun supernatural battles, but the plot was a bit predictable.', '2024-09-04 23:00:00'),
(1007, 97, 22, 4, 'The animation quality is insane—Bleach fans will love this!', '2025-01-27 23:00:00'),
(1008, 75, 48, 4, 'The music is catchy, and the 80s vibe is spot on!', '2023-08-08 23:00:00'),
(1010, 76, 33, 5, 'Marlon Brando is iconic—best crime drama ever made!', '2023-11-30 23:00:00'),
(1011, 76, 12, 4, 'The family dynamics are so gripping—pure genius!', '2024-06-12 23:00:00'),
(1014, 252, 54, 5, 'A superhero movie that’s more than just a blockbuster!', '2025-03-01 00:00:00'),
(1016, 79, 16, 5, 'Simple yet profound—acting and tension are top-notch!', '2024-02-13 23:00:00'),
(1017, 79, 38, 4, 'A slow burn, but the payoff is worth it!', '2023-09-24 23:00:00'),
(1018, 81, 23, 4, 'Epic conclusion to an epic trilogy—tears were shed!', '2023-04-08 00:00:00'),
(1019, 81, 50, 4, 'Visually stunning, though a bit long-winded.', '2024-11-10 23:00:00'),
(1021, 143, 44, 4, 'A fantastic start to the journey—pure adventure!', '2023-01-29 23:00:00'),
(1022, 83, 5, 4, 'The world-building is incredible—Hobbits rule!', '2024-08-15 23:00:00'),
(1023, 84, 11, 4, 'Clint Eastwood shines—best Western I’ve seen!', '2023-10-06 23:00:00'),
(1024, 85, 28, 4, 'Tom Hanks is lovable—heartwarming and funny!', '2024-03-21 00:00:00'),
(1025, 248, 39, 3, 'Sweet story, but a tad too sentimental for me.', '2025-01-04 23:00:00'),
(1026, 86, 17, 4, 'Mind-bending and raw—Brad Pitt kills it!', '2023-05-28 23:00:00'),
(1027, 87, 46, 4, 'Dreams within dreams—super creative concept!', '2024-12-08 23:00:00'),
(1029, 88, 34, 4, 'Middle chapter done right—battle scenes are epic!', '2024-02-27 23:00:00'),
(1030, 89, 20, 4, 'The Force is strong with this one—classic sci-fi!', '2023-11-14 23:00:00'),
(1031, 90, 53, 4, 'Keanu rocks—action and philosophy blend perfectly!', '2024-07-07 23:00:00'),
(1033, 91, 41, 4, 'Scorsese nails the mob life—gritty and real!', '2024-05-16 23:00:00'),
(1034, 92, 25, 4, 'Jack Nicholson is wild—dark humor at its best!', '2023-09-11 23:00:00'),
(1035, 93, 13, 4, 'Creepy and clever—keeps you on edge!', '2024-10-28 23:00:00'),
(1036, 93, 47, 4, 'Brad Pitt’s panic is so relatable—great thriller!', '2023-06-04 23:00:00'),
(1037, 94, 32, 5, 'Kurosawa’s masterpiece—timeless action!', '2024-01-09 23:00:00'),
(1038, 96, 6, 4, 'Hannibal Lecter is chilling—brilliant performances!', '2023-12-17 23:00:00'),
(1039, 97, 55, 4, 'Cool Bleach movie, but the story felt rushed.', '2024-04-22 23:00:00'),
(1042, 101, 43, 4, 'The original Star Wars—pure nostalgic fun!', '2023-02-10 23:00:00'),
(1047, 106, 21, 4, 'Hitchcock’s genius—shower scene still haunts me!', '2024-03-07 23:00:00'),
(1048, 107, 52, 4, 'Heartbreaking survival tale—great acting!', '2023-08-26 23:00:00'),
(1050, 109, 40, 5, 'Bong Joon-ho’s best—darkly funny and smart!', '2023-05-06 23:00:00'),
(1051, 110, 30, 4, 'Simba’s journey is timeless—great songs!', '2024-02-02 23:00:00'),
(1052, 111, 4, 4, 'Russell Crowe owns this—epic revenge story!', '2023-09-29 23:00:00'),
(1053, 115, 24, 4, 'Mind-twisting magic—Nolan strikes again!', '2024-07-13 23:00:00'),
(1054, 116, 56, 4, 'Bogart and Bergman—romance doesn’t get better!', '2023-12-24 23:00:00'),
(1055, 116, 1, 4, 'Classic vibes, though a bit slow for me.', '2024-10-09 23:00:00'),
(1056, 120, 15, 4, 'Leone’s Western epic—harmonica guy rules!', '2023-06-17 23:00:00'),
(1057, 122, 33, 5, 'Tear-jerking tragedy—animation at its deepest!', '2024-01-24 23:00:00'),
(1058, 123, 48, 4, 'Sci-fi horror done right—tense and creepy!', '2023-03-22 00:00:00'),
(1059, 126, 9, 4, 'Memory puzzle thriller—keeps you hooked!', '2024-08-30 23:00:00'),
(1106, 299, 4, 4, 'Hachi’s loyalty—cried my eyes out!', '2023-09-22 23:00:00'),
(1107, 300, 24, 4, 'Superhero family—Pixar fun!', '2024-10-24 23:00:00'),
(1108, 304, 56, 4, 'Gothic romance—Hitchcock vibes!', '2023-06-06 23:00:00'),
(1109, 309, 1, 4, 'Jack Sparrow sails—adventure blast!', '2024-01-11 23:00:00'),
(1110, 312, 15, 4, 'Maria’s songs—uplifting classic!', '2023-12-03 23:00:00'),
(1111, 315, 33, 4, 'Mind-bending drama—Bergman’s art!', '2024-08-08 23:00:00'),
(1112, 318, 48, 4, 'Aladdin’s magic—fun for all!', '2023-02-14 23:00:00'),
(1113, 319, 9, 4, 'Dune’s visuals—sci-fi grandeur!', '2024-11-29 23:00:00'),
(1953, 97, 9, 4, 'Yuta\'s story hit me hard—great action and emotional depth!', '2023-03-14 23:00:00'),
(1961, 75, 6, 4, 'Tried too hard to be quirky—meh.', '2024-08-26 23:00:00'),
(1962, 76, 33, 5, 'Marlon Brando is iconic—best crime drama ever made!', '2023-11-30 23:00:00'),
(1966, 77, 45, 4, 'Heath Ledger\'s Joker steals the show—intense and thrilling!', '2023-02-26 23:00:00'),
(1967, 252, 7, 4, 'Great action, but the plot gets convoluted at times.', '2024-10-02 23:00:00'),
(1968, 77, 54, 5, 'A superhero movie that\'s more than just a blockbuster!', '2025-03-01 00:00:00'),
(1971, 78, 29, 4, 'The sequel outdoes the original—Vito\'s backstory is gold!', '2023-07-18 23:00:00'),
(1977, 79, 55, 4, 'Acting\'s okay, but it\'s dated.', '2024-09-02 23:00:00'),
(1978, 81, 23, 4, 'Epic conclusion to an epic trilogy—tears were shed!', '2023-04-08 00:00:00'),
(1980, 81, 31, 5, 'Too many endings—got tired of it.', '2023-08-11 23:00:00'),
(1981, 81, 4, 4, 'Looks nice, but the story\'s weak.', '2024-03-25 00:00:00'),
(1982, 82, 31, 4, 'Tarantino\'s dialogue is unmatched—wild ride from start to finish!', '2023-06-21 23:00:00'),
(1983, 82, 17, 4, 'Too violent—didn\'t get the appeal.', '2023-11-28 23:00:00'),
(1985, 83, 44, 4, 'A fantastic start to the journey—pure adventure!', '2023-01-29 23:00:00'),
(1988, 143, 53, 4, 'Pretty scenery, but that\'s it.', '2024-12-13 23:00:00'),
(1989, 84, 11, 4, 'Clint Eastwood shines—best Western I\'ve seen!', '2023-10-06 23:00:00'),
(1990, 143, 41, 5, 'It\'s okay, but way too long.', '2023-02-19 23:00:00'),
(1991, 84, 8, 4, 'Westerns aren\'t my thing—boring.', '2024-06-27 23:00:00'),
(1992, 85, 28, 4, 'Tom Hanks is lovable—heartwarming and funny!', '2024-03-21 00:00:00'),
(1993, 160, 39, 3, 'Sweet story, but a tad too sentimental for me.', '2025-01-04 23:00:00'),
(1994, 160, 13, 4, 'Sappy and predictable—meh.', '2023-07-16 23:00:00'),
(1995, 85, 32, 4, 'Tom\'s fine, but it\'s cheesy.', '2024-09-20 23:00:00'),
(1996, 160, 17, 4, 'Mind-bending and raw—Brad Pitt kills it!', '2023-05-28 23:00:00'),
(1997, 86, 6, 5, 'Weird twist, but not my vibe.', '2023-10-24 23:00:00'),
(1998, 86, 55, 4, 'Confusing and overrated.', '2024-04-09 00:00:00'),
(2002, 87, 21, 4, 'Lost me halfway—pretentious.', '2024-11-04 23:00:00'),
(2005, 88, 10, 4, 'Not as good as the first—meh.', '2024-08-17 23:00:00'),
(2008, 89, 26, 4, 'Overhyped—didn\'t click for me.', '2024-12-21 23:00:00'),
(2011, 90, 37, 5, 'Action\'s cool, but it\'s confusing.', '2023-09-09 23:00:00'),
(2012, 90, 14, 4, 'Overrated—didn\'t get the hype.', '2024-02-06 23:00:00'),
(2015, 91, 52, 4, 'It\'s fine, but drags a lot.', '2024-10-14 23:00:00'),
(2016, 92, 25, 4, 'Jack Nicholson is wild—dark humor at its best!', '2023-09-11 23:00:00'),
(2017, 92, 4, 5, 'Funny at times, but dated.', '2023-02-04 23:00:00'),
(2018, 92, 56, 4, 'Didn\'t connect—too old-school.', '2024-07-22 23:00:00'),
(2025, 94, 1, 4, 'Action\'s fine, but it\'s dated.', '2024-12-10 23:00:00'),
(2028, 96, 33, 4, 'Okay thriller—nothing special.', '2024-09-27 23:00:00'),
(2030, 97, 48, 5, 'Animation\'s nice, but plot\'s weak.', '2023-07-08 23:00:00'),
(2031, 97, 9, 4, 'For fans only—didn\'t grab me.', '2024-11-16 23:00:00'),
(2034, 100, 27, 5, 'Sad, but overly dramatic.', '2023-01-13 23:00:00'),
(2035, 100, 42, 4, 'Too long—lost interest.', '2024-06-04 23:00:00'),
(2038, 101, 50, 4, 'Not my thing—too old.', '2024-08-12 23:00:00'),
(2040, 102, 45, 5, 'Looks good, but story\'s thin.', '2023-03-31 00:00:00'),
(2041, 102, 7, 4, 'Nolan tries too hard—meh.', '2024-12-28 23:00:00'),
(2042, 103, 10, 4, 'Arnold\'s back—action-packed and iconic!', '2023-10-21 23:00:00'),
(2043, 103, 49, 4, 'T-1000 is terrifying—best sci-fi sequel ever!', '2024-12-14 23:00:00'),
(2045, 103, 29, 4, 'Action\'s okay, but dated.', '2024-02-23 23:00:00'),
(2046, 105, 35, 5, 'Magical and beautiful—Studio Ghibli perfection!', '2023-04-19 00:00:00'),
(2047, 105, 16, 5, 'Pretty, but slow as heck.', '2023-09-25 23:00:00'),
(2051, 106, 31, 4, 'Creepy, but not that great.', '2024-10-03 23:00:00'),
(2052, 107, 52, 4, 'Heartbreaking survival tale—great acting!', '2023-08-26 23:00:00'),
(2053, 107, 44, 5, 'Sad, but drags too much.', '2023-02-15 23:00:00'),
(2055, 109, 14, 4, 'Class satire at its finest—twists galore!', '2024-11-22 23:00:00'),
(2056, 109, 40, 5, 'Bong Joon-ho\'s best—darkly funny and smart!', '2023-05-06 23:00:00'),
(2057, 109, 11, 4, 'Weird and slow—didn\'t get it.', '2023-12-08 23:00:00'),
(2058, 109, 20, 4, 'Twists are okay, but overhyped.', '2024-08-24 23:00:00'),
(2060, 110, 53, 5, 'Kids might like it—songs are meh.', '2023-06-20 23:00:00'),
(2061, 110, 8, 4, 'Cute, but too childish.', '2024-01-27 23:00:00'),
(2062, 111, 4, 4, 'Russell Crowe owns this—epic revenge story!', '2023-09-29 23:00:00'),
(2063, 111, 41, 4, 'Loud and long—nothing special.', '2023-04-15 00:00:00'),
(2067, 115, 32, 4, 'Too clever for its own good.', '2024-03-12 00:00:00'),
(2070, 116, 6, 4, 'Old and boring—didn\'t care.', '2023-05-23 23:00:00'),
(2071, 116, 55, 4, 'Romance is okay, but dated.', '2024-09-05 23:00:00'),
(2074, 120, 9, 4, 'Western drag—not my style.', '2024-07-18 23:00:00'),
(2077, 122, 42, 4, 'Well-made, but depressing.', '2024-11-30 23:00:00'),
(2080, 123, 50, 4, 'Alien\'s cool, but pacing\'s off.', '2024-04-19 23:00:00'),
(2083, 126, 7, 4, 'Clever idea, poor execution.', '2024-11-25 23:00:00'),
(2085, 129, 54, 5, 'Action\'s okay, but cheesy.', '2023-06-14 23:00:00'),
(2086, 129, 29, 4, 'Indy\'s fine, but it\'s dated.', '2024-08-03 23:00:00'),
(2088, 136, 16, 4, 'Old humor—didn\'t laugh.', '2023-09-17 23:00:00'),
(2089, 136, 38, 4, 'Some funny bits, but dull.', '2024-12-12 23:00:00'),
(2092, 137, 23, 5, 'Big fights, thin story.', '2023-01-20 23:00:00'),
(2093, 137, 31, 4, 'Too many heroes—messy.', '2024-06-08 23:00:00'),
(2095, 138, 4, 4, 'Creepy, but made no sense.', '2023-11-02 23:00:00'),
(2096, 138, 56, 4, 'Odd anime—didn\'t click.', '2024-10-21 23:00:00'),
(2098, 139, 11, 5, 'Aliens are cool, but it\'s long.', '2023-05-30 23:00:00'),
(2099, 139, 20, 4, 'Okay sequel—nothing wow.', '2024-02-16 23:00:00'),
(2101, 141, 53, 4, 'Bane\'s voice annoyed me—weak.', '2023-12-05 23:00:00'),
(2102, 141, 8, 4, 'Big action, small payoff.', '2024-07-24 23:00:00'),
(2104, 142, 41, 5, 'Some laughs, but dated.', '2023-08-27 23:00:00'),
(2105, 142, 25, 4, 'Weird war flick—not funny.', '2024-03-14 00:00:00'),
(2107, 143, 13, 4, 'Cartoon overload—too flashy.', '2023-04-07 00:00:00'),
(2108, 143, 32, 4, 'Spidey\'s fine, but overhyped.', '2024-11-09 23:00:00'),
(2110, 144, 6, 5, 'Dark, but drags too much.', '2023-07-12 23:00:00'),
(2111, 144, 55, 4, 'Joker\'s okay, story\'s weak.', '2024-08-31 23:00:00'),
(2113, 145, 48, 4, 'Twisted, but too weird for me.', '2023-12-22 23:00:00'),
(2114, 145, 9, 4, 'Violent and slow—pass.', '2024-05-07 23:00:00'),
(2116, 147, 27, 5, 'Cute for kids, not me.', '2023-02-11 23:00:00'),
(2117, 147, 42, 4, 'Toys talk—kinda boring.', '2024-10-26 23:00:00'),
(2119, 150, 19, 4, 'Too many Spiders—messy.', '2023-11-15 23:00:00'),
(2120, 150, 50, 4, 'Fun cameos, weak plot.', '2024-07-03 23:00:00'),
(2122, 153, 45, 5, 'Big finale, but exhausting.', '2023-09-04 23:00:00'),
(2123, 153, 7, 4, 'Too long—lost focus.', '2024-12-17 23:00:00'),
(2125, 154, 54, 4, 'Pretty, but no story.', '2023-06-25 23:00:00'),
(2126, 154, 29, 4, 'Slow and weird—meh.', '2024-08-10 23:00:00'),
(2128, 155, 16, 5, 'Too long—got bored.', '2023-03-08 23:00:00'),
(2129, 155, 38, 4, 'Okay, but drags a lot.', '2024-10-30 23:00:00'),
(2131, 156, 23, 4, 'Sappy and slow—pass.', '2023-11-26 23:00:00'),
(2132, 156, 31, 4, 'Smart guy, dull movie.', '2024-04-13 00:00:00'),
(2134, 157, 4, 5, 'Toys again—kinda lame.', '2023-08-01 23:00:00'),
(2135, 157, 56, 4, 'Cute, but overdone.', '2024-12-23 23:00:00'),
(2137, 158, 13, 4, 'Grim and gross—hated it.', '2023-10-18 23:00:00'),
(2138, 158, 32, 4, 'Dark, but pointless.', '2024-05-21 23:00:00'),
(2140, 159, 6, 5, 'Some laughs, but drags.', '2023-02-24 23:00:00'),
(2141, 159, 55, 4, 'Okay comedy—nothing wow.', '2024-11-11 23:00:00'),
(2143, 160, 48, 4, 'Weird plot—nice visuals.', '2023-07-07 23:00:00'),
(2144, 160, 9, 4, 'Pretty, but confusing.', '2024-09-14 23:00:00'),
(2146, 162, 27, 5, 'Lightsabers are cool, story\'s meh.', '2023-01-29 23:00:00'),
(2147, 162, 42, 4, 'Old sci-fi—didn\'t click.', '2024-06-16 23:00:00'),
(2149, 167, 19, 4, 'Old and dry—yawn.', '2023-12-13 23:00:00'),
(2150, 167, 50, 4, 'Fancy, but boring.', '2024-08-28 23:00:00'),
(2152, 174, 45, 5, 'Cute, but too quirky.', '2023-05-10 23:00:00'),
(2153, 174, 7, 4, 'French fluff—not my thing.', '2024-02-20 23:00:00'),
(2155, 177, 54, 4, 'Loud and crude—pass.', '2023-11-29 23:00:00'),
(2156, 177, 29, 4, 'Pacino yells, plot drags.', '2024-07-15 23:00:00'),
(2158, 181, 16, 5, 'Dark, but slow as heck.', '2023-03-12 23:00:00'),
(2159, 181, 38, 4, 'Taxi guy\'s weird—meh.', '2024-10-06 23:00:00'),
(2161, 182, 23, 4, 'Old courtroom snooze.', '2023-08-15 23:00:00'),
(2162, 182, 31, 4, 'Moral stuff—kinda dull.', '2024-12-19 23:00:00'),
(2164, 191, 4, 5, 'Fun bits, but cheesy.', '2023-06-03 23:00:00'),
(2165, 191, 56, 4, 'Indy\'s okay, but dated.', '2024-03-27 00:00:00'),
(2167, 192, 13, 4, 'Boring family fight—yawn.', '2023-11-24 23:00:00'),
(2168, 192, 32, 4, 'Drama\'s fine, not gripping.', '2024-09-08 23:00:00'),
(2170, 196, 6, 5, 'Cool shots, weak story.', '2023-04-18 00:00:00'),
(2171, 196, 55, 4, 'War stuff—didn\'t care.', '2024-11-20 23:00:00'),
(2173, 204, 48, 4, 'Gloomy and slow—nah.', '2023-07-26 23:00:00'),
(2174, 204, 9, 4, 'Batman\'s fine, plot\'s dull.', '2024-05-13 23:00:00'),
(2176, 218, 27, 5, 'Weird idea, but flat.', '2023-10-01 23:00:00'),
(2177, 218, 42, 4, 'Okay concept—boring execution.', '2024-12-07 23:00:00'),
(2179, 221, 19, 4, 'Twist was lame—overrated.', '2023-02-25 23:00:00'),
(2180, 221, 50, 4, 'Confusing and slow—meh.', '2024-06-29 23:00:00'),
(2182, 224, 45, 5, 'Dinos are cool, story\'s weak.', '2023-05-19 23:00:00'),
(2183, 224, 7, 4, 'Big lizards, little plot.', '2024-08-05 23:00:00'),
(2185, 227, 54, 4, 'Fish talk—kinda dumb.', '2023-12-10 23:00:00'),
(2186, 227, 29, 4, 'Cute for kids, not me.', '2024-02-14 23:00:00'),
(2188, 229, 16, 5, 'Looks neat, story\'s thin.', '2023-09-13 23:00:00'),
(2189, 229, 38, 4, 'Masks are cool, rest is meh.', '2024-10-27 23:00:00'),
(2191, 238, 23, 4, 'Pretty, but so slow.', '2023-03-05 23:00:00'),
(2192, 238, 31, 4, 'Nice art, dull tale.', '2024-12-04 23:00:00'),
(2194, 245, 4, 5, 'Cute critter, boring film.', '2023-07-21 23:00:00'),
(2195, 245, 56, 4, 'For kids—didn\'t grab me.', '2024-09-16 23:00:00'),
(2197, 248, 13, 4, 'Dark and dull—yawn.', '2023-11-07 23:00:00'),
(2198, 248, 32, 4, 'Neon vibes, weak story.', '2024-04-23 23:00:00'),
(2200, 249, 6, 5, 'Clever, but drags a bit.', '2023-01-16 23:00:00'),
(2201, 249, 55, 4, 'Okay caper—nothing wow.', '2024-07-27 23:00:00'),
(2203, 252, 48, 4, 'Slow and basic—meh.', '2023-12-18 23:00:00'),
(2204, 252, 9, 4, 'Sweet, but forgettable.', '2024-09-30 23:00:00'),
(2206, 267, 27, 5, 'Stunts are neat, but old.', '2023-06-11 23:00:00'),
(2207, 267, 42, 4, 'Silent stuff—not my thing.', '2024-03-23 00:00:00'),
(2209, 283, 19, 4, 'Boxing\'s fine, story\'s dull.', '2023-09-19 23:00:00'),
(2210, 283, 50, 4, 'Okay fight flick—meh.', '2024-11-23 23:00:00'),
(2212, 287, 45, 5, 'Cars are cool, plot\'s flat.', '2023-02-08 23:00:00'),
(2213, 287, 7, 4, 'Racing\'s fine, but boring.', '2024-08-14 23:00:00'),
(2215, 288, 54, 4, 'Loud robot mess—pass.', '2023-04-24 23:00:00'),
(2216, 288, 29, 4, 'Arnold\'s okay, story\'s weak.', '2024-12-09 23:00:00'),
(2218, 298, 16, 5, 'Spooky, but overdone.', '2023-07-28 23:00:00'),
(2219, 298, 38, 4, 'Creepy kid—kinda lame.', '2024-02-17 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist`
--

CREATE TABLE `token_blacklist` (
  `token` varchar(512) NOT NULL,
  `expiry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist`
--

INSERT INTO `token_blacklist` (`token`, `expiry`) VALUES
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTExNzE1NCwiZXhwIjoxNzQxMTIwNzU0fQ.IO8L-jCaXxBtnu0SC8LDSVfk_SQsV9tYlFk4iL6Gd3s', '2025-03-04 20:41:52'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTExNzk4MSwiZXhwIjoxNzQxMTIxNTgxfQ.cBIWLzk02f12UM1ZQBeIXZPbumm7Xzd1eqUAEhQZ81o', '2025-03-04 20:54:02'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTExODI5NSwiZXhwIjoxNzQxMTIxODk1fQ.RL-sUPqFbymZuEKfossENQdQnFvrf8u4cvweqgB29pU', '2025-03-04 20:59:18'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTExOTMzMiwiZXhwIjoxNzQxMTIyOTMyfQ.jLudumLHREQNwS0T4IfdelALZAEPbcE6Uac1fHfYATc', '2025-03-04 21:23:33'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTEyMTExOCwiZXhwIjoxNzQxMTI0NzE4fQ.kg2juJVE-s9zm1h62O1t8pOhtzSEVeLEw79Cf7hTcGc', '2025-03-04 21:46:45'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTEyMzA4MiwiZXhwIjoxNzQxMTI2NjgyfQ.Pa-VrtSdpU_sa86i0ZEQjfOl5mNeU3vdQWc7nVgP8dU', '2025-03-04 22:24:35'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTM3MDk5MCwiZXhwIjoxNzQxMzc0NTkwfQ.xu2dhJKEucUZpA0vSmzMeWW2XwA4xK302JdbIhsHW_Q', '2025-03-07 19:10:47'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTM3MTEwOCwiZXhwIjoxNzQxMzc0NzA4fQ.iaIMS5pd2hL77IECU8Y3AOIM9i0wkXP0WuHY920lsvw', '2025-03-07 19:12:45'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTU2MDY2OSwiZXhwIjoxNzQxNTY0MjY5fQ.hQLAzqqv8Tw9SLGfFdBGL4yLJTUqBN-HWDVbTG9h0-E', '2025-03-09 23:53:23'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTU5NjEyOCwiZXhwIjoxNzQxNTk5NzI4fQ.VS7wXWEhcxeZMFVRVV74jH4dP9bdme8sOH3f9Jf92J4', '2025-03-10 09:46:38'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTYwMjY4NCwiZXhwIjoxNzQxNjA2Mjg0fQ.0uHQB-edOi2M_QyPVrqNNSZrxdRP3g50pCGBcrFEi8o', '2025-03-10 11:40:16'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTYwNDY2MywiZXhwIjoxNzQxNjA4MjYzfQ.6ppUAItboj_RWJnJM0C4RnVZh95mbMKXO0uB2wY7W3Y', '2025-03-10 12:14:51'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTYwNjA5NiwiZXhwIjoxNzQxNjA5Njk2fQ.RCkV58hoes4LRhWqx8QoV2phpKNLu8Waebl1Nvb-8Ug', '2025-03-10 12:31:33'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTYwNjQ3NywiZXhwIjoxNzQxNjEwMDc3fQ.Xid0oZFiDrRaJxH9N9qEI_sa7bru-vql03MQRqzw2lk', '2025-03-10 12:37:11'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTYwNzM2MywiZXhwIjoxNzQxNjEwOTYzfQ.-r8RxnwxzQlKGQAKo8qm8ml91Ie1eKftf4DWmVujbxM', '2025-03-10 12:55:48'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTYxMzM5NCwiZXhwIjoxNzQxNjE2OTk0fQ.2CVSTPBcJ0BE2ZOpfANxwNW8K6NwBaLZj5t9JjjnbRY', '2025-03-10 14:32:27'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcl9pZCI6MTcsImlhdCI6MTc0MTYxMzY4NCwiZXhwIjoxNzQxNjE3Mjg0fQ.j60wx9GWoS03Nl3jzJYetLUgHj53nPHbQoNID5sf7nE', '2025-03-10 14:54:55'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ5YXNzZXIiLCJ1c2VyX2lkIjoxOSwiaWF0IjoxNzQwNTI3NTY4LCJleHAiOjE3NDA1MzExNjh9.FU8vWnKSgV_8EivT65Co2hAu8Hr-bDAL55QFEwnAbPU', '2025-02-26 00:55:28'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ5YXNzZXIiLCJ1c2VyX2lkIjoxOSwiaWF0IjoxNzQwNTI3OTUxLCJleHAiOjE3NDA1MzE1NTF9.G-9KKcWzBmH1DLulJTM6gwaTwPpp07C1KBPsJpnGjwY', '2025-02-26 00:59:24'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ5YXNzZXIiLCJ1c2VyX2lkIjoxOSwiaWF0IjoxNzQwNTI5NTM5LCJleHAiOjE3NDA1MzMxMzl9.WoZCiMlUTNZEYMRALxdG9b0HiwKSqvtqVmtSD92QPiE', '2025-02-26 01:26:56'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ5YXNzZXIiLCJ1c2VyX2lkIjoxOSwiaWF0IjoxNzQwNTMwMTgxLCJleHAiOjE3NDA1MzM3ODF9.jQkDX-YLs1PK6--cY9Dalxw3vf1uNUDNvJYJabr_cEs', '2025-02-26 01:36:50'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ5YXNzZXIiLCJ1c2VyX2lkIjoxOSwiaWF0IjoxNzQwNTMxNjIxLCJleHAiOjE3NDA1MzUyMjF9.-7GFPwGkVVh8WkCusA6TUQfZQ0ia32eoxAe70dA3SYE', '2025-02-26 02:06:18'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJBYmRlbGhhZGkiLCJ1c2VyX2lkIjo1NiwiaWF0IjoxNzQwODcwNTY2LCJleHAiOjE3NDA4NzQxNjZ9.e0OdlVyeVfTApjYtIrfRBRXdQbAqICCwolJ3w5HCbYE', '2025-03-02 00:11:26'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDE1NjA4MTIsImV4cCI6MTc0MTU2NDQxMn0.hj2wYc0hB2WC0UkHGT-l6Byl0pXM7evgh0duKZwNO3E', '2025-03-10 00:04:18'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDE1OTY0MDksImV4cCI6MTc0MTYwMDAwOX0.gGQN2W0jrKWSCYNtSsUBQxKn3gkVFhHtsw7J3Qac2TY', '2025-03-10 09:47:40'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDE2MDc4MDAsImV4cCI6MTc0MTYxMTQwMH0.lxjOElD7M0VlsOZGYLjS-kRba2a6eTXy_3pB35RflMk', '2025-03-10 12:57:21'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDE2MDMyODMsImV4cCI6MTc0MTYwNjg4M30.yBOfjU1R4Tx3TsCB2Fo8nPT13csJTzCvukLTQldXptc', '2025-03-10 11:49:13'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDE2MDUyOTksImV4cCI6MTc0MTYwODg5OX0.LaMoDAdEAb0IfVCh-R4O3JnnGcfF9NJ1FayswV_GB8A', '2025-03-10 12:19:24'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDE2MDYzMDAsImV4cCI6MTc0MTYwOTkwMH0.jsGpK9lggmNCnQ-jW214FA6_IWfEjY5rtKfnhmumEQ4', '2025-03-10 12:32:17'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDE2MTM1NTcsImV4cCI6MTc0MTYxNzE1N30.a3n3AvbxhZA0j3Rg_0TZzSQAXfaEHd70neyaPfk7gjQ', '2025-03-10 14:34:33'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDE2MTQ5MDEsImV4cCI6MTc0MTYxODUwMX0.DMRMKURLQkgmvMDvOarlHbILk0u9UVUKdXn7GLXGAh0', '2025-03-10 14:56:26'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDExMjEyMTUsImV4cCI6MTc0MTEyNDgxNX0.tOAHPQd1WBLh1Ka5QV650Hj_GHylnhzeKIffKLzLuvE', '2025-03-04 21:48:05'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDExMjM0ODgsImV4cCI6MTc0MTEyNzA4OH0.0tBdzTXWygZ7Ciwe_ig0kmehpZzfyBVq_Vx34bF4dko', '2025-03-04 22:28:05'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDEzNzEwNTcsImV4cCI6MTc0MTM3NDY1N30.1KU1gSiT7oL4fP64V4-rfi-LfaxYlO4JvW50lxSKvZg', '2025-03-07 19:11:34'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1Mjc1MTMsImV4cCI6MTc0MDUzMTExM30.c7dzsbbqUssnwZCfo8neNawNiRlE90DICKVt0Pm4pIs', '2025-02-26 00:52:06'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1Mjc3MzUsImV4cCI6MTc0MDUzMTMzNX0.vfr5XJijdutBnG2nDY3XLnYkFZfS9HcqKYN-ipCIKG8', '2025-02-26 00:59:04'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1Mjc5NzAsImV4cCI6MTc0MDUzMTU3MH0.XL3Ua8LejwnMKkC_a7EZLmKUwpyMvplRlAL-Cv3kTsc', '2025-02-26 01:23:45'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1Mjk0MzcsImV4cCI6MTc0MDUzMzAzN30.D_A-iZG2-uRyKSOfbJlcZS7vz4135C7eaDglRYJhksE', '2025-02-26 01:25:32'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1MjYwOTYsImV4cCI6MTc0MDUyOTY5Nn0.bHtqhhLZFKb1TCreC-vqyx0MFtgB1WRXN67SkeWIB48', '2025-02-26 00:29:01'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1MjYxNzYsImV4cCI6MTc0MDUyOTc3Nn0.ttI1wbnsJ5MzK8L349Gm5wjehFwKIwhnkjlwQ-t2MHQ', '2025-02-26 00:46:59'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1MTc4MDMsImV4cCI6MTc0MDUyMTQwM30.PiE4UGzZH2djPt3wRFd4Jt1HSfNZq0jwQghHpEe6zAk', '2025-02-25 22:13:46'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1MzA1MTEsImV4cCI6MTc0MDUzNDExMX0.E5ugvl1MlzZHXRzPsrZOv_-SI3OmxtkN_lpbncigPzA', '2025-02-26 01:42:47'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1MzAxMzIsImV4cCI6MTc0MDUzMzczMn0.B8dNgPWW4wW7kZxUfdFb_4waumNDv5H20HixbpzQ1s0', '2025-02-26 01:36:13'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1MzE5ODUsImV4cCI6MTc0MDUzNTU4NX0.BsdEdCT-4QttXrFQ2wb7MC2cT-pzDEtgpN3Jeedu5_M', '2025-02-26 02:12:33'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1MzEwNjUsImV4cCI6MTc0MDUzNDY2NX0.DaqQvxr7FPvAkGgIL0U3UBpgYIfDnHpGwQdLWKCh8lY', '2025-02-26 02:00:13'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1OTQ5MjIsImV4cCI6MTc0MDU5ODUyMn0.GL_yy5KCCZzCnR99Tl8DBDsr1ocm_5v_xfgx0RwZoSg', '2025-02-26 19:37:01'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1OTQwOTksImV4cCI6MTc0MDU5NzY5OX0.EDFffi5MSX-sGNpDTCRKX9usOSi40azCz5JLY99HOXg', '2025-02-26 19:29:59'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1OTU4MTAsImV4cCI6MTc0MDU5OTQxMH0.i-cjulAarAzxVA9JcvFHNf3SJ6nJoODPZqTzF7hlupI', '2025-02-26 19:53:39'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA1OTYwNTcsImV4cCI6MTc0MDU5OTY1N30.-Mza--N6yN2dgig6l_LQLlbybKkzAnc3Lt_34gvzYXU', '2025-02-26 20:26:28'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA2MTU5MDMsImV4cCI6MTc0MDYxOTUwM30.dAqCqO3mZ72vb8j5qv4yIbzjVCCNnYxgnYv4Wk_s2ak', '2025-02-27 02:14:40'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA2NzM3NjUsImV4cCI6MTc0MDY3NzM2NX0.nU2A-D8ZF5-8MOJtatmbduWMwReb8ekMtnbjuLzW528', '2025-02-27 17:29:42'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA3NDIzNzAsImV4cCI6MTc0MDc0NTk3MH0.nPgR5AXAGDKLyLulTkXB8KvWu5i9MlqDH7Pf7h6bThA', '2025-02-28 12:42:12'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA3Njc5ODUsImV4cCI6MTc0MDc3MTU4NX0.dBMJMBdeV9g7T7ZG_9MmlSZZOXCORz75_1QLh2lro7o', '2025-02-28 19:40:14'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA3NTU3ODYsImV4cCI6MTc0MDc1OTM4Nn0.O_8h2wDTk46LBLy5FpA8p58UGs4zUu0UByvykG9_5bc', '2025-02-28 16:17:44'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA3NzEyNTEsImV4cCI6MTc0MDc3NDg1MX0.aFvDTn1T5opfa4TPOkg19ECuDauwLTOkmRxv3r6u8SU', '2025-02-28 20:42:19'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA3NzkzODAsImV4cCI6MTc0MDc4Mjk4MH0.qOJUdDA5JyCGu-8cECvjcuHwAZz5Alr2BU-Gk4Sk2ZQ', '2025-02-28 22:52:31'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA3ODQ0NDMsImV4cCI6MTc0MDc4ODA0M30.xSfIaecJvnk54j4jur3nw_YNyVGKLE1Ig3K_6nIL6hQ', '2025-03-01 00:26:18'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA3ODQwNTAsImV4cCI6MTc0MDc4NzY1MH0.SkKmolv6HzHdAL99Gufzpd2SVOT8j0RQaUN4En31oAs', '2025-03-01 00:13:08'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA4NDE0MTgsImV4cCI6MTc0MDg0NTAxOH0.5VfxvG7hYNvEjHcZZA5tLoBn-MsCI-yudFim2j8b3aU', '2025-03-01 16:12:42'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDA4NDU0NjYsImV4cCI6MTc0MDg0OTA2Nn0.tULY7ib7w2pi4q-DUY4Jsv-V1IhIw3pEwYveDVOERQ4', '2025-03-01 17:38:18'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDEwMzI4MDUsImV4cCI6MTc0MTAzNjQwNX0.dpwvqzBl2wvytOQrzZRSZfAZuEzAUJr-vTA0y4P35bQ', '2025-03-03 21:15:20'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtb3VhZCIsInVzZXJfaWQiOjE3LCJpYXQiOjE3NDEwMzI5MjYsImV4cCI6MTc0MTAzNjUyNn0.kcuY7ZWaiXJT-HnCeHKXf2g5WwrG2e3flugXctmAPNk', '2025-03-03 21:16:05'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA0OTc1ODQsImV4cCI6MTc0MDUwMTE4NH0.ppZVsCcNI7X4uYrpdzCVBwy-TTsd0hWBS8HGzsk0xGg', '2025-02-25 16:34:50'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA0OTQ0MDUsImV4cCI6MTc0MDQ5ODAwNX0.hKjMI7mhRjJ_T_bR_8Eo1jSboMbsqC3XXQahE30oPC0', '2025-02-25 16:33:27'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA1Mjk2MjMsImV4cCI6MTc0MDUzMzIyM30.fDqcs05xJT4X75WwwaqBvBEgXgXiC1MoE95IoGSoUkA', '2025-02-26 01:29:38'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA1MTgwNDIsImV4cCI6MTc0MDUyMTY0Mn0.pW9MiVqH2G3S-H87rZnjegaa4vGj5-o2fqXBGTCsqLY', '2025-02-25 22:14:49'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA1MzAyMTYsImV4cCI6MTc0MDUzMzgxNn0.fv8qpJVMp0bkilOfWG5VtEj7fX6xoqApt51spNxxY3s', '2025-02-26 01:37:09'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA1OTgyMjYsImV4cCI6MTc0MDYwMTgyNn0.iz2IPMI1i5QD5vYmjnmueTcvUCIp8q5yNGTEbfIpjb8', '2025-02-26 20:30:33'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA1OTgyNDAsImV4cCI6MTc0MDYwMTg0MH0.GWwzTv6s7MR57pKIHgSmTnLppPt5j1R599fQhwENUh4', '2025-02-26 20:30:42'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA1OTU3NDIsImV4cCI6MTc0MDU5OTM0Mn0.nnxkMX1olUAGtzatmbsRwQpv7Ni7UCa2RBUqIVCuvbg', '2025-02-26 19:50:02'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA1OTUwNTYsImV4cCI6MTc0MDU5ODY1Nn0.v4axdc41oviXNfGUqiXBMfuCuXG-9VH5olhuZGNIoLM', '2025-02-26 19:37:42'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDA4NDE5NzIsImV4cCI6MTc0MDg0NTU3Mn0.hyD0qO-sBgTBb9qXJzNoizdDZY1mDrix4qoPN-pgqbo', '2025-03-01 17:10:33'),
('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYXJvdWFuZSIsInVzZXJfaWQiOjE2LCJpYXQiOjE3NDEwMzMwNDIsImV4cCI6MTc0MTAzNjY0Mn0.AjnVDNqGGcUt1-LVUzSe5UpirOgx20loUPl7NZ2ajh0', '2025-03-03 21:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `token`, `is_admin`) VALUES
(1, 'Mohamed', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Mohamed@gmail.com', NULL, 0),
(2, 'Ahmed', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Ahmed@gmail.com', NULL, 0),
(3, 'Imane', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Ali@gmail.com', NULL, 0),
(4, 'Youssef', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Youssef@gmail.com', NULL, 0),
(5, 'Said', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Said@gmail.com', NULL, 0),
(6, 'Abdallah', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Abdallah@gmail.com', NULL, 0),
(7, 'Omar', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Omar@gmail.com', NULL, 0),
(8, 'Ibrahim', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Ibrahim@gmail.com', NULL, 0),
(9, 'Khaled', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Khaled@gmail.com', NULL, 0),
(10, 'Yassine', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Yassine@gmail.com', NULL, 0),
(11, 'Ismail', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Ismail@gmail.com', NULL, 0),
(12, 'Ayoub', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Ayoub@gmail.com', NULL, 0),
(13, 'Tarek', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Tarek@gmail.com', NULL, 0),
(14, 'Wassim', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Wassim@gmail.com', NULL, 0),
(15, 'Hamza', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Hamza@gmail.com', NULL, 0),
(16, 'admin', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'marouane@m7b.dev', NULL, 1),
(17, 'user', '$2a$10$gmFbwgYTy0AY/YEigS.ft.7Az5h2CPdF8Zse/AiwcHuVk.gSZi2tK', 'mouad@m7b.dev', NULL, 0),
(18, 'marouane_m7b', '$2a$10$G0sBtX/S2YkIHtwJYlU9DervSK5AP12t6l0V2rEfP53EVmmr3CIq.', 'marouane.ma7boub@gmail.com', NULL, 0),
(19, 'yasser', '$2a$10$G3xk3eAqENyOUg3M/26x1OnMQYBSaAnGq9ekfN83u0OZRNFZu1PV2', 'yasser@gmail.com', NULL, 0),
(20, 'Adel', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Adel@gmail.com', NULL, 0),
(21, 'Bilal', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Bilal@gmail.com', NULL, 0),
(22, 'Fares', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Fares@gmail.com', NULL, 0),
(23, 'Sami', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Sami@gmail.com', NULL, 0),
(24, 'Anas', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Anas@gmail.com', NULL, 0),
(25, 'Jawad', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Jawad@gmail.com', NULL, 0),
(26, 'Hicham', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Hicham@gmail.com', NULL, 0),
(27, 'Sofiane', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Sofiane@gmail.com', NULL, 0),
(28, 'Nabil', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Nabil@gmail.com', NULL, 0),
(29, 'Yahya', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Yahya@gmail.com', NULL, 0),
(30, 'Ziad', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Ziad@gmail.com', NULL, 0),
(31, 'Amina', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Amina@gmail.com', NULL, 0),
(32, 'Sara', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Sara@gmail.com', NULL, 0),
(33, 'Fatima', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Fatima@gmail.com', NULL, 0),
(34, 'Kenza', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Kenza@gmail.com', NULL, 0),
(35, 'Nadia', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Nadia@gmail.com', NULL, 0),
(36, 'Israe', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Imane@gmail.com', NULL, 0),
(37, 'Lina', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Lina@gmail.com', NULL, 0),
(38, 'Meriem', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Meriem@gmail.com', NULL, 0),
(39, 'Rania', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Rania@gmail.com', NULL, 0),
(40, 'Salma', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Salma@gmail.com', NULL, 0),
(41, 'Yasmine', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Yasmine@gmail.com', NULL, 0),
(42, 'Ines', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Ines@gmail.com', NULL, 0),
(43, 'Sabrina', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Sabrina@gmail.com', NULL, 0),
(44, 'Loubna', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Loubna@gmail.com', NULL, 0),
(45, 'Houda', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Houda@gmail.com', NULL, 0),
(46, 'Samira', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Samira@gmail.com', NULL, 0),
(47, 'Asma', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Asma@gmail.com', NULL, 0),
(48, 'Nada', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Nada@gmail.com', NULL, 0),
(49, 'Malak', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Malak@gmail.com', NULL, 0),
(50, 'Hanae', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Hanae@gmail.com', NULL, 0),
(51, 'Chaima', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Chaima@gmail.com', NULL, 0),
(52, 'Nour', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Nour@gmail.com', NULL, 0),
(53, 'Ilham', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Ilham@gmail.com', NULL, 0),
(54, 'Rim', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Rim@gmail.com', NULL, 0),
(55, 'Dounia', '$2a$10$b7TF3cO8bO0HHlfjxFzuFOolL4GJm/ppo01.HXMHMKJbqD9Q7H8Wq', 'Dounia@gmail.com', NULL, 0),
(56, 'Abdelhadi', '$2a$10$ckPYcnID4Yeei.0dvY2R.uOsQ3yaXk.khfxgjV75YPlXs.ao2rBUS', 'Abdelhadi@gmail.com', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_movie_lists`
--

CREATE TABLE `user_movie_lists` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `list_type` enum('watchlist','watched','dropped','favorites') NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_movie_lists`
--

INSERT INTO `user_movie_lists` (`user_id`, `movie_id`, `list_type`, `added_date`) VALUES
(16, 81, 'watchlist', '2025-03-10 13:55:16'),
(17, 76, 'favorites', '2025-03-10 13:30:28'),
(17, 84, 'favorites', '2025-03-10 13:30:15'),
(17, 97, 'dropped', '2025-03-10 13:31:17'),
(17, 97, 'favorites', '2025-03-10 13:30:42'),
(17, 109, 'watchlist', '2025-03-10 13:30:10'),
(17, 252, 'watchlist', '2025-03-10 13:30:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`user_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `token_blacklist`
--
ALTER TABLE `token_blacklist`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_movie_lists`
--
ALTER TABLE `user_movie_lists`
  ADD PRIMARY KEY (`user_id`,`movie_id`,`list_type`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2227;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_movie_lists`
--
ALTER TABLE `user_movie_lists`
  ADD CONSTRAINT `user_movie_lists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_movie_lists_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
