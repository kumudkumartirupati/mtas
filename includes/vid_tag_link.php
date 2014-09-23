<?php
	require_once(LIB_PATH.DS.'database.php');
	class VideoTag extends DatabaseObject {	
		protected static $table_name="vid_tag_link";
		protected static $db_fields = array('vid_tag_id', 'vd_id', 'tg_id');
		public $vid_tag_id;
		public $vd_id;
		public $tg_id;
		public static function get_row_objects_by_tag_id($tg_id="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE tg_id=".$database->escape_value($tg_id));
			return $result_array;
		}
		public static function get_row_objects_by_vid_id($vd_id="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE vd_id=".$database->escape_value($vd_id));
			return $result_array;
		}
		public function add_video() {
			global $database;
			$this->form_validation();
			return $this->create();
		}
		public function form_validation() {
			
		}
	}	
?>