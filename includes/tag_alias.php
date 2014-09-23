<?php
	require_once(LIB_PATH.DS.'database.php');
	class TagAlias extends DatabaseObject {	
		protected static $table_name="tag_alias";
		protected static $db_fields = array('tag_alias_id', 'tg_id', 'tg_alias');
		public $tag_alias_id;
		public $tg_id;
		public $tg_alias;
		public static function get_row_objects_for_tag_alias($tg_alias="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE tg_alias='".$database->escape_value($tg_alias)."'");
			return $result_array;
		}
		public function add_new_tag_alias() {
			global $database;
			$this->form_validation();
			return $this->create();
		}
		public function form_validation() {
			
		}
	}	
?>