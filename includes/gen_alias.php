<?php
	require_once(LIB_PATH.DS.'database.php');
	class GenAlias extends DatabaseObject {	
		protected static $table_name="gen_alias";
		protected static $db_fields = array('gen_alias_id', 'gn_id', 'gn_alias');
		public $gen_alias_id;
		public $gn_id;
		public $gn_alias;
		public static function get_row_objects_for_gen_alias($gn_alias="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE gn_alias='".$database->escape_value($gn_alias)."'");
			return $result_array;
		}
		public function add_new_gen_alias() {
			global $database;
			$this->form_validation();
			return $this->create();
		}
		public function form_validation() {
			
		}
	}	
?>