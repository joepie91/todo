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

$_APP = true;
require("includes/base.php");

if(strtolower($_SERVER["REQUEST_METHOD"]) == "post")
{
	try
	{
		CSRF::VerifyToken();
	}
	catch (CsrfException $e)
	{
		die();
	}
}

$router = new CPHPRouter();
$router->ignore_query = true;
$router->allow_slash = true;

$router->routes = array(
	0 => array(
		"^/$" => "modules/home.php",
		"^/about$" => "modules/about.php",
		"^/list$" => "modules/list.php",
		"^/register$" => "modules/register.php",
		"^/login$" => "modules/login.php",
		"^/logout$" => "modules/logout.php",
		"^/add$" => "modules/add.php",
		"^/done$" => array(
			"target" => "modules/done.php",
			"methods" => "post"
		),
		"^/skip$" => array(
			"target" => "modules/skip.php",
			"methods" => "post"
		)
	)
);

try
{
	$router->RouteRequest();
}
catch (RouterException $e)
{
	http_status_code(404);
	die("404 Not Found. Click <a href='/'>here</a> to continue to todo.cryto.net, the todo list for overworked hackers (and everyone else).");
}
