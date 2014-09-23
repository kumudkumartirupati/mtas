<?php
	defined('DS') ? null : define('DS', DIRECTORY_SEPARATOR);
	defined('SITE_ROOT') ? null : define('SITE_ROOT', 'C:'.DS.'wamp'.DS.'www'.DS.'mtas');
	defined('LIB_PATH') ? null : define('LIB_PATH', SITE_ROOT.DS.'includes');
	require_once(LIB_PATH.DS.'config.php');
	require_once(LIB_PATH.DS.'functions.php');
	require_once(LIB_PATH.DS.'database.php');
	require_once(LIB_PATH.DS.'database_object.php');
	require_once(LIB_PATH.DS.'video.php');
	require_once(LIB_PATH.DS.'cat_alias.php');
	require_once(LIB_PATH.DS.'vid_alias.php');
	require_once(LIB_PATH.DS.'tag_alias.php');
	require_once(LIB_PATH.DS.'gen_alias.php');
	require_once(LIB_PATH.DS.'category.php');
	require_once(LIB_PATH.DS.'tag.php');
	require_once(LIB_PATH.DS.'genre.php');
	require_once(LIB_PATH.DS.'vid_tag_link.php');
	require_once(LIB_PATH.DS.'vid_gen_link.php');
?>