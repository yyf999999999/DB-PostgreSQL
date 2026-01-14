-- アイテムを基準に所持キャラを列挙（論理削除を除く）適切なSQL
SELECT
  i.item_id,
  i.name AS "item",
  c.name,
  COALESCE(ci.qty, 0) AS "qty"
FROM
  y_items AS i
  LEFT JOIN (
    y_character_items AS ci
    JOIN y_characters AS c ON (
      c.character_id = ci.character_id AND
      c.deleted_at IS NULL
    )
  ) ON i.item_id = ci.item_id
ORDER BY
  i.item_id;
