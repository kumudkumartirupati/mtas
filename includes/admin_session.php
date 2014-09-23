<?php
	class UserSession {	
		private $logged_in=false;
		public $user_id;
		public $user_message;	
		function __construct() {
			if (session_status() == PHP_SESSION_NONE) {
				session_start();
			}
			$this->check_user_message();
			$this->check_login();
			if($this->logged_in) {
			} else {
			}
		}
		public function is_logged_in() {
			return $this->logged_in;
		}
		public function login($user) {
			if($user){
				$this->user_id = $_SESSION['user_id'] = $user->id;
				$this->logged_in = true;
			}
		}
		public function logout() {
			if($this->logged_in) {
				unset($_SESSION['user_id']);
				unset($this->user_id);
				$this->logged_in = false;
			}
		}
		public function user_message($msg="") {
			if(!empty($msg)) {
				$_SESSION['user_message'] = $msg;
			} else {
				return $this->user_message;
			}
		}
		private function check_login() {
			if(isset($_SESSION['user_id'])) {
				$this->user_id = $_SESSION['user_id'];
				$this->logged_in = true;
			} else {
				unset($this->user_id);
				$this->logged_in = false;
			}
		}
		private function check_user_message() {
			if(isset($_SESSION['user_message'])) {
				$this->user_message = $_SESSION['user_message'];
				unset($_SESSION['user_message']);
			} else {
				$this->user_message = "";
			}
		}
	}
		$user_session = new UserSession();
		$user_message = $user_session->user_message();
?>