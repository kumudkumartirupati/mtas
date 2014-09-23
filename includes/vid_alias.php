<?php
	require_once(LIB_PATH.DS.'database.php');
	class VidAlias extends DatabaseObject {	
		protected static $table_name="vid_alias";
		protected static $db_fields = array('vid_alias_id', 'vd_id', 'vd_alias');
		public $vid_alias_id;
		public $vd_id;
		public $vd_alias;
		public static function get_row_objects_for_vid_alias($vd_alias="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE vd_alias='".$database->escape_value($vd_alias)."'");
			return $result_array;
		}
		public function add_new_vid_alias() {
			global $database;
			$this->form_validation();
			return $this->create();
		}
		public function form_validation() {
			
		}
	}	
?>