-- TDB 837.20081 auth
UPDATE `updates` SET `state`='ARCHIVED',`speed`=0;
REPLACE INTO `updates_include` (`path`, `state`) VALUES ('$/sql/old/8.x/auth', 'ARCHIVED');
