-- Rank the nine selected 2025 Seahawks players by scrimmage yards
SELECT
    p.player_name,
    p.position,
    s.rushing_yards + s.receiving_yards AS scrimmage_yards
FROM players AS p
JOIN player_stats AS s
    ON p.player_id = s.player_id
WHERE s.season = 2025
ORDER BY scrimmage_yards DESC;
-- Compare total scrimmage yards and touchdowns by position
SELECT
    p.position,
    SUM(s.rushing_yards + s.receiving_yards) AS total_scrimmage_yards,
    SUM(s.total_tds) AS total_touchdowns
FROM players AS p
JOIN player_stats AS s
    ON p.player_id = s.player_id
WHERE s.season = 2025
GROUP BY p.position
ORDER BY total_scrimmage_yards DESC;
