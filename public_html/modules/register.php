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

if(!empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['password2']))
{
	if(strlen($_POST['username']) > 48)
	{
		die("Username too long.");
	}
	
	if($_POST['password'] !== $_POST['password2'])
	{
		die("Passwords do not match.");
	}
	
	if(strlen($_POST['password']) < 6)
	{
		die("Password must be at least 6 characters.");
	}
	
	$sCurrentUser->uUsername = $_POST['username'];
	$sCurrentUser->uPassword = $_POST['password'];
	$sCurrentUser->uRegistrationDate = time();
	$sCurrentUser->uIsGuest = false;
	$sCurrentUser->GenerateSalt();
	$sCurrentUser->GenerateHash();
	$sCurrentUser->InsertIntoDatabase();
}

redirect("/list");
