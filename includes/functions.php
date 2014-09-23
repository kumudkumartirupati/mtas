<?php
	function convert_to_camel_case ($str) {
		return mb_convert_case($str, MB_CASE_TITLE, "UTF-8");
	}
	function convert_to_query_words_array ($str) {
		return preg_split('/ +/', trim($str));
	}
	function strip_zeros_from_date( $marked_string="" ) {
		$no_zeros = str_replace('*0', '', $marked_string);
		$cleaned_string = str_replace('*', '', $no_zeros);
		return $cleaned_string;
	}
	function redirect_to( $location = NULL ) {
		if ($location != NULL) {
		header("Location: {$location}");
		exit;
		}
	}
	function output_message($message="") {
		if (!empty($message)) {
			return "<p class=\"message\">{$message}</p>";
		} else {
			return "";
		}
	}
	function __autoload($class_name) {
		$class_name = strtolower($class_name);
		$path = LIB_PATH.DS."{$class_name}.php";
		if(file_exists($path)) {
			require_once($path);
		} else {
			die("The file {$class_name}.php could not be found.");
		}
	}
	function include_layout_template($template="") {
		include(SITE_ROOT.DS.'public'.DS.'layouts'.DS.$template);
	}
	function log_action($action, $message="") {
		$logfile = SITE_ROOT.DS.'logs'.DS.'log.txt';
		$new = file_exists($logfile) ? false : true;
		if($handle = fopen($logfile, 'a')) {
			$timestamp = strftime("%Y-%m-%d %H:%M:%S", time());
			$content = "{$timestamp} | {$action}: {$message}\n";
			fwrite($handle, $content);
			fclose($handle);
			if($new) { chmod($logfile, 0755); }
		} else {
			echo "Could not open log file for writing.";
		}
	}
	function datetime_to_text($datetime="") {
		$unixdatetime = strtotime($datetime);
		return strftime("%Y-%B-%d %I:%M:%p", $unixdatetime);
	}
	function form_errors() {
		if(isset($_GET['logout']) && $_GET['logout'] == 1) {
			$message = "<span style='color: red'><b>You have logged out Successfully. Login again to access your profile</b></span>";
		}
	}
	function filter_by_vid($q_words = "") {
		$vid_alias = array();
		foreach ($q_words as $word) {
			$vid_alias = array_merge($vid_alias, VidAlias::get_row_objects_for_vid_alias($word));
		}
		$vid_filter_vid_id = array();
		foreach ($vid_alias as $vid_alias_object) {
			$vid_filter_vid_id[] = $vid_alias_object->vd_id;
		}
		return array_values(array_unique($vid_filter_vid_id));
	}
	function filter_by_cat($q_words = "") {
		$cat_alias = array();
		foreach ($q_words as $word) {
			$cat_alias = array_merge($cat_alias, CatAlias::get_row_objects_for_cat_alias($word));
		}
		$cat_filter_id = array();
		foreach ($cat_alias as $cat_alias_object) {
			$cat_filter_id[] = $cat_alias_object->ct_id;
		}
		$cat_filter_vid_obj_id = array();
		foreach ($cat_filter_id as $cat_id) {
			$cat_filter_vid_obj_id = array_merge($cat_filter_vid_obj_id, Video::get_vid_object_by_cat_id($cat_id));
		}
		$cat_filter_vid_id = array();
		foreach ($cat_filter_vid_obj_id as $cat_filter_vid_object) {
			$cat_filter_vid_id[] = $cat_filter_vid_object->vid_id;
		}
		return array_values(array_unique($cat_filter_vid_id));
	}
	function filter_by_tag($q_words = "") {
		$tag_alias = array();
		foreach ($q_words as $word) {
			$tag_alias = array_merge($tag_alias, TagAlias::get_row_objects_for_tag_alias($word));
		}
		$tag_filter_id = array();
		foreach ($tag_alias as $tag_alias_object) {
			$tag_filter_id[] = $tag_alias_object->tg_id;
		}
		$tag_filter_vid_obj_id = array();
		foreach ($tag_filter_id as $tag_id) {
			$tag_filter_vid_obj_id[] = VideoTag::get_row_objects_by_tag_id($tag_id);
		}
		$tag_filter_vid_id_temp = array(array());
		$i = 0;
		foreach ($tag_filter_vid_obj_id as $tag_filter_vid_object_array) {
			foreach($tag_filter_vid_object_array as $tag_filter_vid_object) {
				$tag_filter_vid_id_temp[$i][] = $tag_filter_vid_object->vd_id;
			}
			$i++;
		}
		$temp = sizeof($tag_filter_vid_id_temp)-1;
		$tag_filter_vid_id = array();
		if ($temp >= 1) {
			$temp_array = array_intersect($tag_filter_vid_id_temp[$temp], $tag_filter_vid_id_temp[$temp-1]);
			while ($temp >= 0) {
				$temp_array = array_intersect($temp_array, $tag_filter_vid_id_temp[$temp]);
				$temp--;
			}
			foreach ($tag_filter_vid_id_temp as $blah) {
				$temp_array = array_merge($temp_array, $blah);
			}
			$tag_filter_vid_id = array_values(array_unique($temp_array));
		} else {
			$tag_filter_vid_id = array_values(array_unique($tag_filter_vid_id_temp[0]));
		}
		return $tag_filter_vid_id;
	}
	function filter_by_gen($q_words = "") {
		$gen_alias = array();
		foreach ($q_words as $word) {
			$gen_alias = array_merge($gen_alias, GenAlias::get_row_objects_for_gen_alias($word));
		}
		$gen_filter_id = array();
		foreach ($gen_alias as $gen_alias_object) {
			$gen_filter_id[] = $gen_alias_object->gn_id;
		}
		$gen_filter_vid_obj_id = array();
		foreach ($gen_filter_id as $gen_id) {
			$gen_filter_vid_obj_id[] = VideoGen::get_row_objects_by_gen_id($gen_id);
		}
		$gen_filter_vid_id_temp = array(array());
		$i = 0;
		foreach ($gen_filter_vid_obj_id as $gen_filter_vid_object_array) {
			foreach($gen_filter_vid_object_array as $gen_filter_vid_object) {
				$gen_filter_vid_id_temp[$i][] = $gen_filter_vid_object->vd_id;
			}
			$i++;
		}
		$temp = sizeof($gen_filter_vid_id_temp)-1;
		$tgen_filter_vid_id = array();
		if ($temp >= 1) {
			$temp_array = array_intersect($gen_filter_vid_id_temp[$temp], $gen_filter_vid_id_temp[$temp-1]);
			while ($temp >= 0) {
				$temp_array = array_intersect($temp_array, $gen_filter_vid_id_temp[$temp]);
				$temp--;
			}
			foreach ($gen_filter_vid_id_temp as $blah) {
				$temp_array = array_merge($temp_array, $blah);
			}
			$gen_filter_vid_id = array_values(array_unique($temp_array));
		} else {
			$gen_filter_vid_id = array_values(array_unique($gen_filter_vid_id_temp[0]));
		}
		return $gen_filter_vid_id;
	}
	function fully_filtered_query($vid="", $cat="", $tag="", $gen="") {
		$temp = array_intersect($vid, array_intersect($cat, array_intersect($tag, $gen)));
		$temp = array_merge($temp, array_intersect($vid, array_intersect($cat, $tag)));
		$temp = array_merge($temp, array_intersect($vid, array_intersect($cat, $gen)));
		$temp = array_merge($temp, array_intersect($vid, array_intersect($tag, $gen)));
		$temp = array_merge($temp, array_intersect($cat, array_intersect($tag, $gen)));
		$temp = array_merge($temp, array_intersect($vid, $cat));
		$temp = array_merge($temp, array_intersect($vid, $tag));
		$temp = array_merge($temp, array_intersect($vid, $gen));
		$temp = array_merge($temp, array_intersect($tag, $gen));
		$temp = array_merge($temp, array_intersect($tag, $cat));
		$temp = array_merge($temp, array_intersect($cat, $gen));
		$temp = array_merge($temp, $vid);
		$temp = array_merge($temp, $tag);
		$temp = array_merge($temp, $gen);
		$temp = array_merge($temp, $cat);
		return array_values(array_unique($temp));
	}
?>