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

if(!empty($_POST['description']) && isset($_POST['type']))
{
	$sNewItem = new Item();
	$sNewItem->uUserId = $sCurrentUser->sId;
	$sNewItem->uText = $_POST['description'];
	$sNewItem->uMust = ($_POST['type'] == "must");
	$sNewItem->uCreationDate = time();
	$sNewItem->InsertIntoDatabase();
	
	if($sCurrentUser->sCurrentItemId == 0)
	{
		/* Pick a new item... */
		$sCurrentUser->PickNewItem(true);
	}
}

redirect("/list");
