SELECT
  character_id,
  name,
  deleted_at
FROM
  x_characters
WHERE
  character_id NOT IN (
    SELECT
      character_id
    FROM
      x_guild_characters
  )
ORDER BY
  character_id;
