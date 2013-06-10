<!doctype html>
<html>
	<head>
		<title>todo.</title>
		<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.1.0/pure-min.css">
		<link rel="stylesheet" href="/static/pure-custom.css">
		<link rel="stylesheet" href="/static/style.css">
	</head>
	<body>
		<div class="pure-g-r wrapper">
			<div class="pure-u-1 header">
				<div class="stuff">
					<h1>todo.</h1>
				</div>
			</div>
			
			<div class="pure-u-1 current">
				<div class="stuff">
					<h2>The to-do list web-app for overworked hackers.</h2>
				</div>
			</div>
			
			<div class="pure-u-1">
				<div class="stuff">
					<div class="tldr">
						<strong>The tl;dr:</strong> this is a completely free, awesome to-do list web-app that you can try without even registering.
						It saves you from drowning in your to-do list and relieves stress by alternating work and play. <a href="/list">To the app!</a>
					</div>
					<p>
						<em>todo.</em> is a web application that lets you create a to-do list. It's designed specifically for overworked hackers (like myself),
						and was born as a weekend hack project.
					</p>
					<p>
						<em>todo.</em> aims to solve two problems:
					</p>
					<ol>
						<li>
							<strong>The 'I have so much to do, where do I start' problem.</strong> When your to-do list starts growing, you'll inevitable end
							up in a state where you have so many things in your list, that it seems impossible to even start on it. This leads to inability to
							choose a task to work on, which in turn leads to procrastination, which in turn makes the problem even bigger. <em>todo.</em> solves
							this by selecting a task for you to work on - one that, if it is something work-related, cannot be skipped until it's done.
						</li>
						<li>
							<strong>The stress during hobby projects from having so much work to do.</strong> When you schedule your own time and you
							have a lot to do, you'll most likely end up feeling stressed about work even during your own hobby projects. To really cool down outside
							work time, you'll need to have a separation between 'work' and 'play'. <em>todo.</em> attempts to solve this problem by alternating
							between tasks that you want to do, and tasks that you <em>have</em> to do.
						</li>
					</ol>
					<p>
						You can start using <em>todo.</em> straight away - you don't even have to register to try it out! When you decide you like it, you can
						register a (free!) account with just a username and a password, and your existing to-do list items will be saved to your new account. We
						don't even need to know your e-mail address! <a href="/list">Click here to try out <em>todo.</em>!</a>
					</p>
					<p>
						Contact me via any of the various available methods:
					</p>
					<ul>
						<li><strong>E-mail:</strong> <a href="mailto:todo@cryto.net">todo@cryto.net</a></li>
						<li><strong>XMPP:</strong> joepie91@neko.im</li>
						<li><strong>IRC:</strong> <a href="irc://irc.cryto.net/crytocc">irc.cryto.net #crytocc</a> (my nickname is joepie91)</li>
					</ul>
					<p>
						Like all my projects, this project is open-source (and licensed under the <a href="http://wtfpl.net">WTFPL</a>). While setup documentation 
						is currently a bit lacking, you can find the source code <a href="http://github.com/joepie91/todo">on GitHub</a>, and you can set it up 
						using PHP, any HTTPd of choice, and the equivalent of <em>FallbackResource</em> or <em>server.error-handler-404</em> for that HTTPd. You'll 
						also need to clone the <a href="http://github.com/joepie91/cphp">CPHP repository</a>, so the symlink resolves. Happy hacking!
					</p>
					<p>
						Now for the technical details... this project is built using:
					</p>
					<ul>
						<li>lighttpd (for this particular instance)</li>
						<li>PHP</li>
						<li><a href="http://github.com/joepie91/cphp">CPHP</a>, my own homebrew PHP framework</li>
						<li>MySQL</li>
						<li>Memcache</li>
						<li><a href="http://purecss.io/">Pure CSS</a></li>
						<li>Some code from <a href="http://www.99lime.com/elements/">HTML Kickstart</a></li>
						<li><a href="http://fancyapps.net/">fancyBox 2</a></li>
					</ul>
					<p>
						Now the question that quite some people will inevitably ask: how do I keep this running? I accept <a href="http://cryto.net/~joepie91/donate.html">
						donations</a> via Bitcoin, PayPal, and Flattr :)
					</p>
				</div>
			</div>
		</div>
	</body>
</html>
