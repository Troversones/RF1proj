-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 18. 20:29
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `imdb2`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ertekeles`
--

CREATE TABLE `ertekeles` (
  `felhasznaloID` int(11) NOT NULL,
  `filmID` int(11) NOT NULL,
  `tartalom` text DEFAULT NULL,
  `csillagok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `ertekeles`
--

INSERT INTO `ertekeles` (`felhasznaloID`, `filmID`, `tartalom`, `csillagok`) VALUES
(1, 1, 'Teljesen lenyűgöző film, remek színészi játék.', 5),
(1, 4, 'Lenyűgöző sci-fi élmény.', 5),
(1, 7, 'A Gyűrűk Ura mindig jó választás!', 4),
(1, 10, 'Quentin Tarantino egyik legjobb alkotása.', 5),
(1, 13, 'Matrix világépítése lenyűgöző.', 5),
(2, 2, 'Klasszikus film, felejthetetlen jelenetekkel.', 5),
(2, 5, 'Megragadó történet és harcjelenetek.', 4),
(2, 8, 'Harry Potter kezdete. Varászlatos!', 4),
(2, 11, 'Inspiráló történet egy különleges emberről.', 5),
(2, 14, 'Izgalmas film egy szökött emberről.', 4),
(3, 3, 'Eposzi történet a jó és rossz közötti harcról, komplex hőssel.', 4),
(3, 6, 'Nagyon érdekes film.', 5),
(3, 9, 'A Star Wars-saga kezdete. Kihagyhatatlan.', 5),
(3, 12, 'Szívszorító történet és gyönyörű látvány.', 4),
(3, 15, 'Joaquin Phoenix zseniális alakítása.', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fbejegyzes`
--

CREATE TABLE `fbejegyzes` (
  `bejegyzesID` int(11) NOT NULL,
  `cim` varchar(255) DEFAULT NULL,
  `tartalom` text DEFAULT NULL,
  `szerzoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `fbejegyzes`
--

INSERT INTO `fbejegyzes` (`bejegyzesID`, `cim`, `tartalom`, `szerzoID`) VALUES
(1, 'Gondolataim az Eredetről', 'Ez a film egy mestermű, tele részletekkel és lenyűgöző cselekménnyel!', 1),
(2, 'A keresztapa - Időtlen klasszikus', 'Egy film, ami újradefiniálta a krimi műfaját.', 2),
(3, 'A sötét lovag - Modern hős', 'A legjobb Batman ábrázolás és mély betekintés a pszichéjébe.', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `felhasznaloID` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `szuldatum` date DEFAULT NULL,
  `nev` varchar(255) DEFAULT NULL,
  `jelszo` varchar(255) DEFAULT NULL,
  `jogosultsagok` enum('Felhasználó','Admin') DEFAULT 'Felhasználó'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`felhasznaloID`, `email`, `szuldatum`, `nev`, `jelszo`, `jogosultsagok`) VALUES
(1, 'admin@example.com', NULL, 'admin', '12345678', 'Admin'),
(2, 'john.smith@example.com', NULL, 'John Smith', '12345678', 'Felhasználó'),
(3, 'alice.wonder@example.com', NULL, 'Alice Wonder', '12345678', 'Felhasználó'),
(4, 'gamervideo478@gmail.com', '2002-03-13', 'TheRealDoesman', '$2a$08$fI5cPfTuytdgd4IgW13JKu70pXhlNNEHQC3TQ61lLH6MaLRSGt1jq', 'Felhasználó');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `film`
--

CREATE TABLE `film` (
  `filmID` int(11) NOT NULL,
  `cim` varchar(255) DEFAULT NULL,
  `mufaj` varchar(255) DEFAULT NULL,
  `leiras` text DEFAULT NULL,
  `kep` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `film`
--

INSERT INTO `film` (`filmID`, `cim`, `mufaj`, `leiras`, `kep`) VALUES
(1, 'Eredet', 'Sci-Fi', 'Egy tolvaj, aki álommegosztó technológia segítségével lop üzleti titkokat.', 'eredet.jpg'),
(2, 'A keresztapa', 'Krimi', 'Egy maffiavezér átadja birodalma irányítását vonakodó fiának.', 'keresztapa.jpg'),
(3, 'A sötét lovag', 'Akció', 'Amikor a Joker fenyegetést jelent, Batmannek szembe kell néznie a legnagyobb próbáival.', 'sotet_lovag.jpg'),
(4, 'Interstellar', 'Sci-Fi', 'Űrkutató utazás időn és téren keresztül.', 'interstellar.jpg'),
(5, 'Gladiator', 'Történelmi', 'Római tábornok bosszút áll családja haláláért.', 'gladiator.jpg'),
(6, 'Fight Club', 'Dráma', 'Két férfi alternatív közösséget alapít.', 'fight_club.jpg'),
(7, 'A Gyűrűk Ura: A Gyűrű Szövetsége', 'Fantasy', 'Kis hobbit szembenéz a sötét erőkkel.', 'lotr1.jpg'),
(8, 'Harry Potter és a Bölcsek Köve', 'Fantasy', 'Egy fiatal varázsló kalandjai.', 'hp1.jpg'),
(9, 'Star Wars IV: Egy új remény', 'Sci-Fi', 'Lázadók szembeszállnak a Birodalommal.', 'star_wars4.jpg'),
(10, 'Ponyvaregény', 'Krimi', 'Több szálon futó történet különleges karakterekkel.', 'pulp_fiction.jpg'),
(11, 'Forrest Gump', 'Dráma', 'Egy különleges ember életútja.', 'forrest_gump.jpg'),
(12, 'Titanic', 'Romantikus', 'Szerelmi történet egy elsüllyedt hajón.', 'titanic.jpg'),
(13, 'Matrix', 'Sci-Fi', 'Egy ember rájön a világának igazi természetére.', 'matrix.jpg'),
(14, 'Szökevény', 'Akció', 'Orvos, aki saját igazát próbálja bizonyítani.', 'fugitive.jpg'),
(15, 'Joker', 'Dráma', 'Egy férfi átalakulása a körülmények hatására.', 'joker.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hozzaszol`
--

CREATE TABLE `hozzaszol` (
  `hozzaszolasID` int(11) NOT NULL,
  `bejegyzesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `hozzaszol`
--

INSERT INTO `hozzaszol` (`hozzaszolasID`, `bejegyzesID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hozzaszolas`
--

CREATE TABLE `hozzaszolas` (
  `hozzaszolasID` int(11) NOT NULL,
  `tartalom` text DEFAULT NULL,
  `szerzoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `hozzaszolas`
--

INSERT INTO `hozzaszolas` (`hozzaszolasID`, `tartalom`, `szerzoID`) VALUES
(1, 'Teljesen egyetértek! Az Eredet zseniális volt.', 2),
(2, 'A keresztapa valóban mestermű. Brando fantasztikus volt.', 3),
(3, 'A Batman történet több mint egy egyszerű szuperhősfilm.', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szerepel`
--

CREATE TABLE `szerepel` (
  `filmID` int(11) NOT NULL,
  `szineszID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `szerepel`
--

INSERT INTO `szerepel` (`filmID`, `szineszID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szinesz`
--

CREATE TABLE `szinesz` (
  `szineszID` int(11) NOT NULL,
  `nev` varchar(255) DEFAULT NULL,
  `szuletesi_datum` date DEFAULT NULL,
  `nemzetiseg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `szinesz`
--

INSERT INTO `szinesz` (`szineszID`, `nev`, `szuletesi_datum`, `nemzetiseg`) VALUES
(1, 'Leonardo DiCaprio', '1974-11-11', 'amerikai'),
(2, 'Marlon Brando', '1924-04-03', 'amerikai'),
(3, 'Christian Bale', '1974-01-30', 'brit'),
(4, 'Matthew McConaughey', '1969-11-04', 'amerikai'),
(5, 'Russell Crowe', '1964-04-07', 'új-zélandi'),
(6, 'Brad Pitt', '1963-12-18', 'amerikai'),
(7, 'Elijah Wood', '1981-01-28', 'amerikai'),
(8, 'Daniel Radcliffe', '1989-07-23', 'brit'),
(9, 'Mark Hamill', '1951-09-25', 'amerikai'),
(10, 'John Travolta', '1954-02-18', 'amerikai'),
(11, 'Tom Hanks', '1956-07-09', 'amerikai'),
(12, 'Kate Winslet', '1975-10-05', 'brit'),
(13, 'Keanu Reeves', '1964-09-02', 'kanadai'),
(14, 'Harrison Ford', '1942-07-13', 'amerikai'),
(15, 'Joaquin Phoenix', '1974-10-28', 'amerikai');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `watchlist`
--

CREATE TABLE `watchlist` (
  `listaID` int(11) NOT NULL,
  `felhasznaloID` int(11) DEFAULT NULL,
  `filmID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `watchlist`
--

INSERT INTO `watchlist` (`listaID`, `felhasznaloID`, `filmID`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 2),
(4, 3, 1),
(5, 3, 3);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ertekeles`
--
ALTER TABLE `ertekeles`
  ADD PRIMARY KEY (`felhasznaloID`,`filmID`),
  ADD KEY `filmID` (`filmID`);

--
-- A tábla indexei `fbejegyzes`
--
ALTER TABLE `fbejegyzes`
  ADD PRIMARY KEY (`bejegyzesID`),
  ADD KEY `szerzoID` (`szerzoID`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`felhasznaloID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`filmID`);

--
-- A tábla indexei `hozzaszol`
--
ALTER TABLE `hozzaszol`
  ADD PRIMARY KEY (`hozzaszolasID`,`bejegyzesID`),
  ADD KEY `bejegyzesID` (`bejegyzesID`);

--
-- A tábla indexei `hozzaszolas`
--
ALTER TABLE `hozzaszolas`
  ADD PRIMARY KEY (`hozzaszolasID`),
  ADD KEY `szerzoID` (`szerzoID`);

--
-- A tábla indexei `szerepel`
--
ALTER TABLE `szerepel`
  ADD PRIMARY KEY (`filmID`,`szineszID`),
  ADD KEY `szineszID` (`szineszID`);

--
-- A tábla indexei `szinesz`
--
ALTER TABLE `szinesz`
  ADD PRIMARY KEY (`szineszID`);

--
-- A tábla indexei `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`listaID`),
  ADD KEY `felhasznaloID` (`felhasznaloID`),
  ADD KEY `filmID` (`filmID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `fbejegyzes`
--
ALTER TABLE `fbejegyzes`
  MODIFY `bejegyzesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `felhasznaloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `film`
--
ALTER TABLE `film`
  MODIFY `filmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `hozzaszolas`
--
ALTER TABLE `hozzaszolas`
  MODIFY `hozzaszolasID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `szinesz`
--
ALTER TABLE `szinesz`
  MODIFY `szineszID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `listaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `ertekeles`
--
ALTER TABLE `ertekeles`
  ADD CONSTRAINT `ertekeles_ibfk_1` FOREIGN KEY (`felhasznaloID`) REFERENCES `felhasznalo` (`felhasznaloID`),
  ADD CONSTRAINT `ertekeles_ibfk_2` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`);

--
-- Megkötések a táblához `fbejegyzes`
--
ALTER TABLE `fbejegyzes`
  ADD CONSTRAINT `fbejegyzes_ibfk_1` FOREIGN KEY (`szerzoID`) REFERENCES `felhasznalo` (`felhasznaloID`);

--
-- Megkötések a táblához `hozzaszol`
--
ALTER TABLE `hozzaszol`
  ADD CONSTRAINT `hozzaszol_ibfk_1` FOREIGN KEY (`hozzaszolasID`) REFERENCES `hozzaszolas` (`hozzaszolasID`),
  ADD CONSTRAINT `hozzaszol_ibfk_2` FOREIGN KEY (`bejegyzesID`) REFERENCES `fbejegyzes` (`bejegyzesID`);

--
-- Megkötések a táblához `hozzaszolas`
--
ALTER TABLE `hozzaszolas`
  ADD CONSTRAINT `hozzaszolas_ibfk_1` FOREIGN KEY (`szerzoID`) REFERENCES `felhasznalo` (`felhasznaloID`);

--
-- Megkötések a táblához `szerepel`
--
ALTER TABLE `szerepel`
  ADD CONSTRAINT `szerepel_ibfk_1` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`),
  ADD CONSTRAINT `szerepel_ibfk_2` FOREIGN KEY (`szineszID`) REFERENCES `szinesz` (`szineszID`);

--
-- Megkötések a táblához `watchlist`
--
ALTER TABLE `watchlist`
  ADD CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`felhasznaloID`) REFERENCES `felhasznalo` (`felhasznaloID`),
  ADD CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
