<?php
	require_once("../includes/initialize.php");
	if (trim($_GET['q']) != "") {
		$q = $_GET['q'];
		$q_words = convert_to_query_words_array($q);
	}
	else {
		redirect_to("../");
	}	
	$vid_filtered_vid_ids = filter_by_vid ($q_words);
	$cat_filtered_vid_ids = filter_by_cat ($q_words);
	$tag_filtered_vid_ids = filter_by_tag ($q_words);
	$gen_filtered_vid_ids = filter_by_gen ($q_words);
	$final_filtered_vid_ids = fully_filtered_query($vid_filtered_vid_ids, $cat_filtered_vid_ids, $tag_filtered_vid_ids, $gen_filtered_vid_ids);
?>
<!DOCTYPE html>
<html>
	<head>
		<title>MTAS.com - Search - <?php echo $q; ?></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body style="max-width: 100%; background-color: silver; padding: 0px 0px 0px 0px margin: 0px 0px 0px 0px; overflow-x: hidden;">
		<div style="width: 70%; margin: 0 15%; padding: 10px 0px 0px 10px; border: solid 1px lightgrey; background-color: lightgrey; box-shadow: 0 0 10px rgba(0,0,0,0.6); -moz-box-shadow: 0 0 10px rgba(0,0,0,0.6); -webkit-box-shadow: 0 0 10px rgba(0,0,0,0.6); -o-box-shadow: 0 0 10px rgba(0,0,0,0.6);">
			<div style="width: 50%; margin: 10px 25%;">
				<form action="search.php" method="get">
					<input style="width: 70%; height: 30px; font-size: 100%; padding: 0px 2px;" type="text" name="q" value="<?php echo $q; ?>">
					<input style="width: 100px; height: 35px; font-size: 100%;" type="submit" name="qs" value="Search">
				</form>
			</div>
			<div>
				<?php
					if (sizeof($final_filtered_vid_ids) != 0) {
						foreach ($final_filtered_vid_ids as $video) {
							$video_object = Video::get_vid_object_by_vid_id($video);
							$tag_names = array();
							$gen_names = array();
							$temp_cat = Category::get_cat_object_by_id($video_object->ct_id);
							$cat_name = $temp_cat->get_sanitized_cat_name();
							$tag_vid_objects = VideoTag::get_row_objects_by_vid_id($video);
							$gen_vid_objects = VideoGen::get_row_objects_by_vid_id($video);
							foreach ($tag_vid_objects as $tag_vid_object) {
								$temp_tag = Tag::get_tag_object_by_id($tag_vid_object->tg_id);
								if (isset($tag_vid_object->tg_id)) {
									$tag_names[] = $temp_tag->get_sanitized_tag_name();
								}
							}
							foreach ($gen_vid_objects as $gen_vid_object) {
								$temp_gen = Genre::get_gen_object_by_id($gen_vid_object->gn_id);
								if (isset($gen_vid_object->gn_id)) {
									$gen_names[] = $temp_gen->get_sanitized_gen_name();									
								}
							}
							echo "<br />";
							$video_object->print_sanitized_vid_name();
							echo "<br />";
							$video_object->get_yt_embed_html();
							echo "<label>Category:</label>&nbsp&nbsp;<a href='search.php?q=" . urlencode($cat_name) . "&qs=Search'><span>{$cat_name}</span></a>";
							if (sizeof($tag_names) != 0) {
								echo "<br /><label>Tags:</label>&nbsp&nbsp;";
							}
							foreach ($tag_names as $tag_name) {
								echo "<a href='search.php?q=" . urlencode($tag_name) . "&qs=Search'><span>{$tag_name}</span></a>&nbsp;&nbsp;";
							}
							if (sizeof($gen_names) != 0) {
								echo "<br /><label>Genres:</label>&nbsp;&nbsp;";
							}
							foreach ($gen_names as $gen_name) {
								echo "<a href='search.php?q=" . urlencode($gen_name) . "&qs=Search'><span>{$gen_name}</span></a>&nbsp;&nbsp;";
							}
							echo "<br /><hr />";
						}
					} else {
						echo "<br /><span style='font-color: red;'><em>Your query didn't matched with any of the videos in our database. Please try something else or take a look at the categories, tags and genres below.</em></span><br /><br />";
						$tag_object_array = Tag::get_all_tags();
						$tag_names_array = array();
						foreach ($tag_object_array as $tag_object) {
							$tag_names_array[] = $tag_object->get_sanitized_tag_name();
						}
						$cat_object_array = Category::get_all_cats();
						$cat_names_array = array();
						foreach ($cat_object_array as $cat_object) {
							$cat_names_array[] = $cat_object->get_sanitized_cat_name();
						}
						$gen_object_array = Genre::get_all_gens();
						$gen_names_array = array();
						foreach ($gen_object_array as $gen_object) {
							$gen_names_array[] = $gen_object->get_sanitized_gen_name();
						}
						echo "<h3>Categories:</h3><br /><ul>";
						foreach ($cat_names_array as $cat_name) {
							echo "<li><a href='search.php?q=" . urlencode($cat_name) . "&qs=Search'>{$cat_name}</a></li>";
						}
						echo "</ul><br /><h3>Genres:</h3><br /><ul>";
						foreach ($gen_names_array as $gen_name) {
							echo "<li><a href='search.php?q=" . urlencode($gen_name) . "&qs=Search'>{$gen_name}</a></li>";
						}
						echo "</ul><br /><h3>Tags:</h3><br /><ul>";
						foreach ($tag_names_array as $tag_name) {
							echo "<li><a href='search.php?q=" . urlencode($tag_name) . "&qs=Search'>{$tag_name}</a></li>";
						}
						echo "</ul><br />";
					}
				?>
			</div>
		</div>
	</body>
</html>
<?php
	if(isset($database)) { $database->close_connection(); }
?>