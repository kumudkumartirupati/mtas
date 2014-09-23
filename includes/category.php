<?php
	require_once(LIB_PATH.DS.'database.php');
	class Category extends DatabaseObject {	
		protected static $table_name="categories";
		protected static $db_fields = array('cat_id', 'cat_name');
		public $cat_id;
		public $cat_name;
		public function get_sanitized_cat_name() {
			return convert_to_camel_case($this->cat_name);
		}
		public static function get_cat_object_by_id($cat_id="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE cat_id='".$database->escape_value($cat_id)."' LIMIT 1");
			return !empty($result_array) ? array_shift($result_array) : false;
		}
		public static function get_all_cats() {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name);
			return $result_array;
		}
		public function add_new_cat() {
			global $database;
			$this->form_validation();
			return $this->create();
		}
		public function form_validation() {
			
		}
	}	
?>