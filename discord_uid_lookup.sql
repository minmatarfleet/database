CREATE VIEW DISCORD_UID_LOOKUP AS
WITH user_groups as (SELECT aug.user_id, ag.name
                     from auth_user_groups aug
                              join auth_group ag on ag.id = aug.group_id),
     characters AS (SELECT ac.user_id, ee.character_id, ee.character_name
                    from eveonline_evecharacter ee
                             join authentication_characterownership ac on ac.character_id = ee.id)
SELECT p.uid as discord_uid, GROUP_CONCAT(c.character_id) AS character_ids, GROUP_CONCAT(s.name) AS roles
FROM user_groups s
         INNER JOIN discord_discorduser p ON (s.user_id = p.user_id)
         INNER JOIN characters c ON (s.user_id = c.user_id)
GROUP BY p.uid;
