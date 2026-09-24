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
