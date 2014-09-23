<?php
	require_once(LIB_PATH.DS.'database.php');
	class CatAlias extends DatabaseObject {	
		protected static $table_name="cat_alias";
		protected static $db_fields = array('cat_alias_id', 'ct_id', 'ct_alias');
		public $cat_alias_id;
		public $ct_id;
		public $ct_alias;
		public static function get_row_objects_for_cat_alias($ct_alias="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE ct_alias='".$database->escape_value($ct_alias)."'");
			return $result_array;
		}
		public function add_new_cat_alias() {
			global $database;
			$this->form_validation();
			return $this->create();
		}
		public function form_validation() {
			
		}
	}	
?>