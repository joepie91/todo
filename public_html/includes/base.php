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

$_CPHP_CONFIG = "../config.json";
$_CPHP = true;
require("cphp/base.php");

if(isset($_SESSION['user_id']))
{
	try
	{
		$sCurrentUser = new User($_SESSION['user_id']);
	}
	catch (NotFoundException $e)
	{
		/* pass */
	}
}

if(empty($sCurrentUser))
{
	/* Guest, create new session */
	$sCurrentUser = new User();
	$sCurrentUser->uIsGuest = true;
	$sCurrentUser->uIsAdmin = false;
	$sCurrentUser->uIsBanned = false;
	$sCurrentUser->InsertIntoDatabase();
	$sCurrentUser->Authenticate();
}

NewTemplater::SetGlobalVariable("logged-in", ($sCurrentUser->sIsGuest === false));

$sCurrentUser->uLastSeen = time();
$sCurrentUser->InsertIntoDatabase();

$sCurrentUser->SetGlobalVariables();
