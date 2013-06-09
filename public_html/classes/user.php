<?php
/*
 * Todo is more free software. It is licensed under the WTFPL, which
 * allows you to do pretty much anything with it, without having to
 * ask permission. Commercial use is allowed, and no attribution is
 * required. We do politely request that you share your modifications
 * to benefit other developers, but you are under no enforced
 * obligation to do so :)
 * 
 * Please read the accompanying LICENSE document for the full WTFPL
 * licensing text.
 */
 
if(!isset($_APP)) { die("Unauthorized."); }

class User extends CPHPDatabaseRecordClass
{
	public $table_name = "users";
	public $fill_query = "SELECT * FROM users WHERE `Id` = :Id";
	public $verify_query = "SELECT * FROM users WHERE `Id` = :Id";
	
	public $prototype = array(
		'string' => array(
			'Username'		=> "Username",
			'Hash'			=> "Hash",
			'Salt'			=> "Salt"
		),
		'numeric' => array(
			"CurrentItemId"		=> "CurrentItemId"
		),
		'boolean' => array(
			'IsAdmin'		=> "Admin",
			'IsBanned'		=> "Banned",
			'IsGuest'		=> "Guest"
		),
		'timestamp' => array(
			"RegistrationDate"	=> "RegistrationDate",
			"LastSeen"		=> "LastSeen"
		),
		'item' => array(
			"CurrentItem"		=> "CurrentItemId"
		)
	);
	
	public function GenerateSalt()
	{
		$this->uSalt = random_string(10);
	}
	
	public function GenerateHash()
	{
		if(!empty($this->uSalt))
		{
			if(!empty($this->uPassword))
			{
				$this->uHash = $this->CreateHash($this->uPassword);
			}
			else
			{
				throw new Exception("User object is missing a password.");
			}
		}
		else
		{
			throw new Exception("User object is missing a salt.");
		}
	}
	
	public function CreateHash($input)
	{
		global $cphp_config;
		$hash = crypt($input, "$5\$rounds=50000\${$this->uSalt}{$cphp_config->salt}$");
		$parts = explode("$", $hash);
		return $parts[4];
	}
	
	public function VerifyPassword($password)
	{
		if($this->CreateHash($password) == $this->sHash)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public function Authenticate()
	{
		$_SESSION['user_id'] = $this->sId;
		$_SESSION['logout_key'] = random_string(32);
		$_SESSION['is_admin'] = $this->sIsAdmin;
		
		$this->SetGlobalVariables();
	}
	
	public function Deauthenticate()
	{
		unset($_SESSION['user_id']);
		unset($_SESSION['is_admin']);
	}
	
	public function SetGlobalVariables()
	{
		NewTemplater::SetGlobalVariable("my-username", $this->sUsername);
		NewTemplater::SetGlobalVariable("logout-key", $_SESSION['logout_key']);
	}
	
	public static function CheckIfUsernameExists($username)
	{
		try
		{
			$result = User::FindByUsername($username);
			return true;
		}
		catch (NotFoundException $e)
		{
			return false;
		}
	}
	
	public static function FindByUsername($username)
	{
		return self::CreateFromQuery("SELECT * FROM users WHERE `Username` = :Username AND `Guest` = 0", array(':Username' => $username), 0, true);
	}
	
	public function MarkCurrentItemDone()
	{
		$this->sCurrentItem->MarkDone();
		$this->PickNewItem(!$this->sCurrentItem->sMust);
	}
	
	public function SkipCurrentItem()
	{
		$this->PickNewItem(!$this->sCurrentItem->sMust);
	}
	
	public function PickNewItem($must)
	{
		try
		{
			$sNewItem = Item::CreateFromQuery("SELECT * FROM items WHERE `UserId` = :UserId AND `Completed` = 0 AND `Must` = :Must ORDER BY RAND() LIMIT 1", 
							  array(":UserId" => $this->sId, ":Must" => $must), 0, true);
		}
		catch (NotFoundException $e)
		{
			/* If no item of the desired sort exists, then maybe there's an item of a different type? */
			try
			{
				$sNewItem = Item::CreateFromQuery("SELECT * FROM items WHERE `UserId` = :UserId AND `Completed` = 0 ORDER BY RAND() LIMIT 1", 
								  array(":UserId" => $this->sId), 0, true);
			}
			catch (NotFoundException $e)
			{
				/* Give up. */
				$this->uCurrentItemId = 0;
				$this->InsertIntoDatabase();
				return;
			}
		}
		
		$this->uCurrentItemId = $sNewItem->sId;
		$this->InsertIntoDatabase();
	}
}
