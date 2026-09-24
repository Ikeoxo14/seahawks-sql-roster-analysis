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
-- Rank players within each position by 2025 scrimmage yards
SELECT
    p.position,
    p.player_name,
    s.rushing_yards + s.receiving_yards AS scrimmage_yards,
    RANK() OVER (
        PARTITION BY p.position
        ORDER BY s.rushing_yards + s.receiving_yards DESC
    ) AS position_rank
FROM players AS p
JOIN player_stats AS s
    ON p.player_id = s.player_id
WHERE s.season = 2025
ORDER BY p.position, position_rank;
