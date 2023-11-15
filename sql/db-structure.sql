-- ----------------------------------------------database-

CREATE DATABASE IF NOT EXISTS animecre_ait_sports;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------tables8---

USE animecre_ait_sports;

DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `match_date` date DEFAULT NULL,
  `home_team` text DEFAULT NULL,
  `away_team` text DEFAULT NULL,
  `score_home` int(11) DEFAULT NULL,
  `score_away` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------------------------views---

DROP VIEW IF EXISTS view_goal_difference;
CREATE VIEW view_goal_difference AS
SELECT
  id,
  match_date,
  home_team,
  away_team,
  score_home,
  score_away,
  ABS(score_home - score_away) AS "goal_difference"
FROM matches;

-- --------------------------------------------------- Procedures
DROP PROCEDURE IF EXISTS `proc_insert_moviment`;
