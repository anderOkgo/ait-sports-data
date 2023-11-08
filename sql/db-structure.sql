-- ----------------------------------------------database-

CREATE DATABASE IF NOT EXISTS animecre_finan;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------tables---

USE animecre_finan;

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

DROP VIEW IF EXISTS view_moviments; -- ----------
CREATE OR REPLACE VIEW view_moviments AS
SELECT
    m.id,
    m.name,
    m.value AS val,
    tag,
    ts.name AS 'source',
    LEFT(DATE_FORMAT(m.date_moviment, '%Y-%m-%d %H:%i:%s'),16) AS datemov
FROM
    moviments m
JOIN type_sources ts ON
    m.type_source_id = ts.id
ORDER BY
    m.date_moviment DESC
LIMIT 100;


-- --------------------------------------------------- Procedures
DROP PROCEDURE IF EXISTS `proc_insert_moviment`;
DELIMITER $$
CREATE  PROCEDURE proc_insert_moviment  (
  IN p_name VARCHAR(255),
  IN p_value DECIMAL(10,2),
  IN p_date DATETIME,
  IN p_type_source_id INT,
  IN p_tag VARCHAR(150)
  ) SQL SECURITY INVOKER
BEGIN
    INSERT INTO animecre_finan.moviments
    (name, value, date_moviment, type_source_id, tag)
    VALUES (p_name, p_value, p_date, p_type_source_id, p_tag);
END
$$
DELIMITER ;
