-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 11. říj 2020, 22:06
-- Verze serveru: 10.1.38-MariaDB
-- Verze PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `remante-test`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `producer`
--

CREATE TABLE `producer` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `producer`
--

INSERT INTO `producer` (`id`, `name`) VALUES
(1, 'Bosch'),
(2, 'Zexel'),
(3, 'Denso'),
(4, 'Siemens VDO'),
(5, 'Mitsubishi'),
(6, 'Garrett'),
(7, 'Delphi');

-- --------------------------------------------------------

--
-- Struktura tabulky `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_type` int(11) NOT NULL,
  `producer` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8_czech_ci NOT NULL,
  `code` varchar(20) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `product`
--

INSERT INTO `product` (`id`, `product_type`, `producer`, `price`, `description`, `code`) VALUES
(1, 1, 1, 11979, 'Vstřikovací čerpadlo BOSCH 0470004004 s řídící jednotkou implementovanou do konstrukce čerpadla. Řídící jednotka čerpadla na základě informací z řídící jednotky motoru řídí funkci mechanických komponentů, především však dávkování paliva. Opravujeme pouze vstřikovací čerpadla opatřená jednokonektorovou řídící jednotkou typu PSG2 nebo PSG5. Čerpadla Bosch VP se dvěma konektory z řídící jednotky (tzv. typ PSG16) aktuálně nabízíme pouze nová či fabričně repasovaná. Správná funkce vstřikovacího čerpadla je garantována přiloženým protokolem o testu, který je součástí výstupní kontroly v průběhu repasování.', '002-001-000061R'),
(2, 1, 2, 34969, 'Vstřikovací čerpadlo ZEXEL 109144-3062 s řídící jednotkou implementovanou do konstrukce čerpadla. Řídící jednotka čerpadla na základě informací z řídící jednotky motoru řídí funkci mechanických komponentů, především však dávkování paliva. Opravujeme pouze vstřikovací čerpadla opatřená jednokonektorovou řídící jednotkou typu PSG2 nebo PSG5. Čerpadla Bosch VP se dvěma konektory z řídící jednotky (tzv. typ PSG16) aktuálně nabízíme pouze nová či fabričně repasovaná. Správná funkce vstřikovacího čerpadla je garantována přiloženým protokolem o testu, který je součástí výstupní kontroly v průběhu repasování.', '002-004-000001R'),
(3, 2, 3, 2889, 'Common Rail vstřikovač DENSO 095000-5800 dávkuje palivo ze vstřikovacího čerpadla do spalovacího motoru v prostoru jednotlivých válců. Všechny vstřikovače repasujeme výhradně za použití nových originálních náhradních dílů a dodržujeme postupy stanovené výrobci vstřikovačů. Jednotlivé součástky byly důkladně prověřeny, nevyhovující nahrazeny novými (včetně ventilku a koncovky vstřikovače). V rámci výstupní kontroly byl vstřikovač otestován na certifikované testovací a kalibrační stanici.', '002-003-000086R'),
(4, 3, 4, 7714, 'Plně repasované vysokotlaké čerpadlo SIEMENS/VDO 5WS40836 odpovídá stavu nového originálního dílu a je dodáváno včetně protokolu z autorizované testovací stanice. Každá součástka musí odpovídat kvalitě originálního dílu. Při repasi vysokotlakých čerpadel se klade důraz na kvalitu nových komponentů (např. těsnění, čidel) a preciznost kompletace. Pro kontrolu kvality čerpadla po repasi provádíme test na speciální stolici. Repasujeme vysokotlaká čerpadla a vstřikovače všech výrobců: Bosch, Delphi, Denso, Continental VDO.', '002-002-000513R'),
(5, 3, 1, 7230, 'Plně repasované vysokotlaké čerpadlo BOSCH 0445010646 odpovídá stavu nového originálního dílu a je dodáváno včetně protokolu z autorizované testovací stanice. Každá součástka musí odpovídat kvalitě originálního dílu. Při repasi vysokotlakých čerpadel se klade důraz na kvalitu nových komponentů (např. těsnění, čidel) a preciznost kompletace. Pro kontrolu kvality čerpadla po repasi provádíme test na speciální stolici. Repasujeme vysokotlaká čerpadla a vstřikovače všech výrobců: Bosch, Delphi, Denso, Continental VDO.', '002-002-000554R'),
(6, 3, 3, 6806, 'Plně repasované vysokotlaké čerpadlo DENSO 294000-050 odpovídá stavu nového originálního dílu a je dodáváno včetně protokolu z autorizované testovací stanice. Každá součástka musí odpovídat kvalitě originálního dílu. Při repasi vysokotlakých čerpadel se klade důraz na kvalitu nových komponentů (např. těsnění, čidel) a preciznost kompletace. Pro kontrolu kvality čerpadla po repasi provádíme test na speciální stolici. Repasujeme vysokotlaká čerpadla a vstřikovače všech výrobců: Bosch, Delphi, Denso, Continental VDO.', '002-002-000012R'),
(7, 2, 4, 3490, 'Common Rail vstřikovač SIEMENS/VDO 5WS40539 dávkuje palivo ze vstřikovacího čerpadla do spalovacího motoru v prostoru jednotlivých válců. Všechny vstřikovače repasujeme výhradně za použití nových originálních náhradních dílů a dodržujeme postupy stanovené výrobci vstřikovačů. Jednotlivé součástky byly důkladně prověřeny, nevyhovující nahrazeny novými (včetně ventilku a koncovky vstřikovače). V rámci výstupní kontroly byl vstřikovač otestován na certifikované testovací a kalibrační stanici.', '002-003-000988R'),
(8, 2, 4, 3490, 'Common Rail vstřikovač SIEMENS/VDO 5WS40677 dávkuje palivo ze vstřikovacího čerpadla do spalovacího motoru v prostoru jednotlivých válců. Všechny vstřikovače repasujeme výhradně za použití nových originálních náhradních dílů a dodržujeme postupy stanovené výrobci vstřikovačů. Jednotlivé součástky byly důkladně prověřeny, nevyhovující nahrazeny novými (včetně ventilku a koncovky vstřikovače). V rámci výstupní kontroly byl vstřikovač otestován na certifikované testovací a kalibrační stanici.', '002-003-001142R'),
(9, 4, 6, 5490, 'Turbodmychadlo GARRETT 753420-5006S bylo plně repasováno, poškozené a nezpůsobilé díly byly vyměněny za nové originální. Původní funkční komponenty, které v turbodmychadle zůstaly, byly důkladně opískovány. Následně odborně vyškolený personál turbodmychadlo zkompletoval a nastavil správnou podtlakovou/elektronickou regulaci. Proběhlo také dynamické vyvážení rotačního systému a kontrola středu kvůli zabránení úniku oleje. Součástí balení je montážní postup, který vám pomůže vyvarovat se opětovnému poškození repasovaného turbodmychadla. A také kalibrační protokol, který garantuje 100% funkčnost.', '003-001-000230R'),
(10, 4, 6, 4989, 'Turbodmychadlo GARRETT 724930-5009S bylo plně repasováno, poškozené a nezpůsobilé díly byly vyměněny za nové originální. Původní funkční komponenty, které v turbodmychadle zůstaly, byly důkladně opískovány. Následně odborně vyškolený personál turbodmychadlo zkompletoval a nastavil správnou podtlakovou/elektronickou regulaci. Proběhlo také dynamické vyvážení rotačního systému a kontrola středu kvůli zabránení úniku oleje. Součástí balení je montážní postup, který vám pomůže vyvarovat se opětovnému poškození repasovaného turbodmychadla. A také kalibrační protokol, který garantuje 100% funkčnost.', '003-001-000072R'),
(11, 4, 5, 7490, 'Turbodmychadlo MITSUBISHI 49135-05895 bylo plně repasováno, poškozené a nezpůsobilé díly byly vyměněny za nové originální. Původní funkční komponenty, které v turbodmychadle zůstaly, byly důkladně opískovány. Následně odborně vyškolený personál turbodmychadlo zkompletoval a nastavil správnou podtlakovou/elektronickou regulaci. Proběhlo také dynamické vyvážení rotačního systému a kontrola středu kvůli zabránení úniku oleje. Součástí balení je montážní postup, který vám pomůže vyvarovat se opětovnému poškození repasovaného turbodmychadla. A také kalibrační protokol, který garantuje 100% funkčnost.', '003-002-000002R'),
(12, 5, 1, 4205, 'Repasovaná čerpadlo-tryska BOSCH 0414720210', '002-010-000075R'),
(13, 5, 1, 3691, 'Repasovaná čerpadlo-tryska BOSCH 0414720215', '002-010-000070R'),
(14, 5, 1, 3691, 'Repasovaná čerpadlo-tryska BOSCH 0414720404', '002-010-000076R'),
(15, 1, 2, 19238, 'Vstřikovací čerpadlo ZEXEL 104700-3040 s řídící jednotkou implementovanou do konstrukce čerpadla. Řídící jednotka čerpadla na základě informací z řídící jednotky motoru řídí funkci mechanických komponentů, především však dávkování paliva. Opravujeme pouze vstřikovací čerpadla opatřená jednokonektorovou řídící jednotkou typu PSG2 nebo PSG5. Čerpadla Bosch VP se dvěma konektory z řídící jednotky (tzv. typ PSG16) aktuálně nabízíme pouze nová či fabričně repasovaná. Správná funkce vstřikovacího čerpadla je garantována přiloženým protokolem o testu, který je součástí výstupní kontroly v průběhu repasování.', '002-004-001003R'),
(16, 1, 3, 6806, 'Plně repasované vysokotlaké čerpadlo DENSO 294000-086 odpovídá stavu nového originálního dílu a je dodáváno včetně protokolu z autorizované testovací stanice. Každá součástka musí odpovídat kvalitě originálního dílu. Při repasi vysokotlakých čerpadel se klade důraz na kvalitu nových komponentů (např. těsnění, čidel) a preciznost kompletace. Pro kontrolu kvality čerpadla po repasi provádíme test na speciální stolici. Repasujeme vysokotlaká čerpadla a vstřikovače všech výrobců: Bosch, Delphi, Denso, Continental VDO.', '002-002-000428R'),
(17, 1, 7, 5990, 'Plně repasované vysokotlaké čerpadlo DELPHI R9042A041A odpovídá stavu nového originálního dílu a je dodáváno včetně protokolu z autorizované testovací stanice. Každá součástka musí odpovídat kvalitě originálního dílu. Při repasi vysokotlakých čerpadel se klade důraz na kvalitu nových komponentů (např. těsnění, čidel) a preciznost kompletace. Pro kontrolu kvality čerpadla po repasi provádíme test na speciální stolici. Repasujeme vysokotlaká čerpadla a vstřikovače všech výrobců: Bosch, Delphi, Denso, Continental VDO.', '002-002-000468R'),
(18, 3, 7, 6625, 'Plně repasované vysokotlaké čerpadlo DELPHI R9044A030A odpovídá stavu nového originálního dílu a je dodáváno včetně protokolu z autorizované testovací stanice. Každá součástka musí odpovídat kvalitě originálního dílu. Při repasi vysokotlakých čerpadel se klade důraz na kvalitu nových komponentů (např. těsnění, čidel) a preciznost kompletace. Pro kontrolu kvality čerpadla po repasi provádíme test na speciální stolici. Repasujeme vysokotlaká čerpadla a vstřikovače všech výrobců: Bosch, Delphi, Denso, Continental VDO.', '002-002-000477R'),
(19, 3, 7, 9136, 'Plně repasované vysokotlaké čerpadlo DELPHI 28351705 odpovídá stavu nového originálního dílu a je dodáváno včetně protokolu z autorizované testovací stanice. Každá součástka musí odpovídat kvalitě originálního dílu. Při repasi vysokotlakých čerpadel se klade důraz na kvalitu nových komponentů (např. těsnění, čidel) a preciznost kompletace. Pro kontrolu kvality čerpadla po repasi provádíme test na speciální stolici. Repasujeme vysokotlaká čerpadla a vstřikovače všech výrobců: Bosch, Delphi, Denso, Continental VDO.', '002-002-001032R'),
(20, 2, 7, 2889, 'Common Rail vstřikovač DELPHI R05101D dávkuje palivo ze vstřikovacího čerpadla do spalovacího motoru v prostoru jednotlivých válců. Všechny vstřikovače repasujeme výhradně za použití nových originálních náhradních dílů a dodržujeme postupy stanovené výrobci vstřikovačů. Jednotlivé součástky byly důkladně prověřeny, nevyhovující nahrazeny novými (včetně ventilku a koncovky vstřikovače). V rámci výstupní kontroly byl vstřikovač otestován na certifikované testovací a kalibrační stanici.', '002-003-000115R');

-- --------------------------------------------------------

--
-- Struktura tabulky `product_type`
--

CREATE TABLE `product_type` (
  `id` int(11) NOT NULL,
  `type` varchar(40) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `product_type`
--

INSERT INTO `product_type` (`id`, `type`) VALUES
(1, 'Vstřikovací čerpadlo'),
(2, 'Vstřikovače'),
(3, 'Vysokotlaké čerpadlo'),
(4, 'Turbodmychadlo'),
(5, 'Čerpadlo - tryska PDE/UIS');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_type_fk` (`product_type`),
  ADD KEY `producer_fk` (`producer`);

--
-- Klíče pro tabulku `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pro tabulku `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `producer_fk` FOREIGN KEY (`producer`) REFERENCES `producer` (`id`),
  ADD CONSTRAINT `product_type_fk` FOREIGN KEY (`product_type`) REFERENCES `product_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
