<?php
	require_once(LIB_PATH.DS.'database.php');
	class Tag extends DatabaseObject {	
		protected static $table_name="tags";
		protected static $db_fields = array('tag_id', 'tag_name');
		public $tag_id;
		public $tag_name;
		public function get_sanitized_tag_name() {
			return convert_to_camel_case($this->tag_name);
		}
		public static function get_tag_object_by_id($tag_id="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE tag_id='".$database->escape_value($tag_id)."' LIMIT 1");
			return !empty($result_array) ? array_shift($result_array) : false;
		}
		public static function get_all_tags() {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name);
			return $result_array;
		}
		public function add_new_tag() {
			global $database;
			$this->form_validation();
			return $this->create();
		}
		public function form_validation() {
			
		}
	}	
?>