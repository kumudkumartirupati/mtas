<?php
	require_once(LIB_PATH.DS.'database.php');
	class Video extends DatabaseObject {	
		protected static $table_name="videos";
		protected static $db_fields = array('vid_id', 'ct_id', 'vid_name', 'vid_yt_id');
		public $vid_id;
		public $ct_id;
		public $vid_name;
		public $vid_yt_id;
		public function print_sanitized_vid_name() {
			if ($this->ct_id == 1) {
				$temp = convert_to_camel_case($this->vid_name) . " Full Movie";
			} elseif ($this->ct_id == 2) {
				$temp = convert_to_camel_case($this->vid_name) . " Movie Trailer";
			} elseif($this->ct_id == 3) {
				$temp = convert_to_camel_case($this->vid_name) . " TV Show / TV Serial";
			} else {
				$temp = convert_to_camel_case($this->vid_name) . " Movie Songs Jukebox / Music Video / Video Song";
			}
			echo "<a href='http://www.youtube.com/embed/" . $this->vid_yt_id . "' target='_blank'><b>" . $temp . "</b></a><br />";
		}
		public static function get_vid_object_by_vid_id($vid_id="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE vid_id='".$database->escape_value($vid_id)."' LIMIT 1");
			return !empty($result_array) ? array_shift($result_array) : false;
		}
		public static function get_vid_object_by_cat_id($ct_id="") {
			global $database;
			$result_array = self::find_by_sql("SELECT * FROM ".self::$table_name." WHERE ct_id=".$database->escape_value($ct_id));
			return $result_array;
		}
		public function get_yt_embed_html() {
			echo "<a href='http://www.youtube.com/embed/" . $this->vid_yt_id . "' target='_blank'><img src='http://img.youtube.com/vi/" . $this->vid_yt_id . "/0.jpg' width='200px' height='120px'/></a><br />";
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