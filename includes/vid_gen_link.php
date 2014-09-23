<?php
	require_once(LIB_PATH.DS.'database.php');
	class VideoGen extends DatabaseObject {	
		protected static $table_name="vid_gen_link";
		protected static $db_fields = array('vid_gen_id', 'vd_id', 'gn_id');
		public $vid_gen_id;
		public $vd_id;
		public $gn_id;
		public static function get_row_objects_by_gen_id($gn_id="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE gn_id=".$database->escape_value($gn_id));
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