<?php
	require_once(LIB_PATH.DS.'database.php');
	class Genre extends DatabaseObject {	
		protected static $table_name="genres";
		protected static $db_fields = array('gen_id', 'gen_name');
		public $gen_id;
		public $gen_name;
		public function get_sanitized_gen_name() {
			return convert_to_camel_case($this->gen_name);
		}
		public static function get_gen_object_by_id($gen_id="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE gen_id='".$database->escape_value($gen_id)."' LIMIT 1");
			return !empty($result_array) ? array_shift($result_array) : false;
		}
		public static function get_all_gens() {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name);
			return $result_array;
		}
		public function add_new_gen() {
			global $database;
			$this->form_validation();
			return $this->create();
		}
		public function form_validation() {
			
		}
	}	
?>