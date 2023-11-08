-- ----------------------------------------------database-

CREATE DATABASE IF NOT EXISTS animecre_finan;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------tables---

USE animecre_finan;

DROP TABLE IF EXISTS `money_sources`;
DROP TABLE IF EXISTS `moviments`;
DROP TABLE IF EXISTS `constants`;
DROP TABLE IF EXISTS `variables`;
DROP TABLE IF EXISTS `currencies`;
DROP TABLE IF EXISTS `type_sources`;

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
