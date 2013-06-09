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

class Item extends CPHPDatabaseRecordClass
{
	public $table_name = "items";
	public $fill_query = "SELECT * FROM items WHERE `Id` = :Id";
	public $verify_query = "SELECT * FROM items WHERE `Id` = :Id";
	
	public $prototype = array(
		'string' => array(
			'Text'			=> "Text"
		),
		'numeric' => array(
			"UserId"		=> "UserId"
		),
		'boolean' => array(
			"Completed"		=> "Completed",
			"Must"			=> "Must"
		),
		'timestamp' => array(
			"CreationDate"		=> "CreationDate",
			"CompletionDate"	=> "CompletionDate",
			"Deadline"		=> "Deadline"
		),
		'user' => array(
			"User"			=> "UserId"
		)
	);
	
	public function MarkDone()
	{
		$this->uCompletionDate = time();
		$this->uCompleted = true;
		$this->InsertIntoDatabase();
	}
}
