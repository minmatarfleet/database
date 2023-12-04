CREATE USER 'alliance_auth_readonly'@'%' IDENTIFIED BY 'PASSWORD';
GRANT SELECT ON alliance_auth.DISCORD_UID_LOOKUP TO 'alliance_auth_readonly'@'%';
GRANT SELECT ON alliance_auth.CHARACTER_UID_LOOKUP TO 'alliance_auth_readonly'@'%';
