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

try
{
	$result = Item::CreateFromQuery("SELECT * FROM items WHERE `UserId` = :UserId AND `Completed` = 0 AND `Id` != :CurrentId", array(":UserId" => $sCurrentUser->sId, ":CurrentId" => $sCurrentUser->sCurrentItemId));
}
catch (NotFoundException $e)
{
	$result = array();
}

$sItems = array();

foreach($result as $sItem)
{
	$sItems[] = array(
		"description"	=> $sItem->sText,
		"must"		=> $sItem->sMust
	);
}

try
{
	$sCurrentMust = $sCurrentUser->sCurrentItem->sMust;
	$sCurrentDescription = $sCurrentUser->sCurrentItem->sText;
}
catch (NotFoundException $e)
{
	$sCurrentMust = false;
	$sCurrentDescription = "";
}

echo(NewTemplater::Render("list", $locale->strings, array(
	"items" => $sItems,
	"current-task-must" => $sCurrentMust,
	"current-task-description" => $sCurrentDescription,
	"can-skip"
)));
