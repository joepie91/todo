<!doctype html>
<html>
	<head>
		<title>todo.</title>
		<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.1.0/pure-min.css">
		<link rel="stylesheet" href="/static/pure-custom.css">
		<link rel="stylesheet" href="/static/style.css">
		<link rel="stylesheet" href="/static/fancybox/jquery.fancybox.css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/static/fancybox/jquery.fancybox.pack.js"></script>
		<script src="/static/script.js"></script>
	</head>
	<body>
		<div class="pure-g-r wrapper">
			<div class="pure-u-1 header">
				<div class="stuff">
					<h1>todo.</h1>
					<div class="dashboard">
						{%if logged-in == true}
							<a href="/logout/?key={%?logout-key}" class="pure-button pure-button-primary">logout</a>
						{%else}
							<a href="#modal_login" class="fancybox pure-button pure-button-primary">login</a>
							<a href="#modal_register" class="fancybox pure-button pure-button-primary register">register &amp; save</a>
						{%/if}
					</div>
				</div>
			</div>
			
			<div class="pure-u-1 current">
				<div class="stuff clearfix">
					{%if isempty|current-task-description == true}
						<h2>Your current task: <span class="current-task">None.</span></h2>
					{%else}
						<h2>Your current task: <span class="current-task">
							{%if current-task-must == true}
								<span class="type-marker must">Must</span>
							{%else}
								<span class="type-marker want">Want</span>
							{%/if}
							
							{%?current-task-description}
						</span></h2>
						<div class="actions">
							<form method="post" action="/done" class="inline-form">
								<button class="pure-button">I'm done with that.</button>
							</form>
							{%if current-task-must == false}
								<form method="post" action="/skip" class="inline-form">
									<button class="pure-button">I want to do something else!</button>
								</form>
							{%else}
								<span class="non-button">You can't skip a <em>MUST</em>!</span>
							{%/if}
						</div>
					{%/if}
				</div>
			</div>
			
			<div class="pure-u-5-8">
				<div class="stuff">
					<h2>Your other tasks...</h2>
					<ul class="tasks">
						<li class="create">
							<form class="pure-form" method="post" action="/add">
								<select name="type" class="type-input">
									<option value="must">Must</option>
									<option value="want">Want</option>
								</select>
								<input name="description" type="text" class="description-input">
								<button name="submit" type="submit" class="pure-button add-button">add task</button>
							</form>
						</li>
						{%if isempty|items == false}
							{%foreach task in items}
								<li class="task clearfix">
									{%if task[must] == true}
										<div class="type must">Must</div>
									{%else}
										<div class="type want">Want</div>
									{%/if}
									
									<span class="description">{%?task[description]}</span>
								</li>
							{%/foreach}
						{%/if}
					</ul>
				</div>
			</div>
			<div class="pure-u-3-8">
				<div class="stuff no-header sidebar">
					<p>
						<strong>Confused?</strong> Don't be! It's quite simple.
					</p>
					<p>
						Add a new task with the form on your left. If it's something you <em>have</em> to do - for example,
						a chore or some kind of work - select the <strong>MUST</strong> type. 
					</p>
					<p>
						If it's something you <em>want</em> to do - say, a hobby project or generally something non-urgent 
						that you want to do soon - select the <strong>WANT</strong> type.
					</p>
					<p>
						The app will assign you a new task every time you finish one. To balance between work and play, it'll
						alternate between <strong>MUST</strong> and <strong>WANT</strong> tasks. 
					</p>
					<p>
						If you get a <strong>WANT</strong> assignment and you don't like it, you can swap it for another random 
						<strong>WANT</strong> assignment - but you can't skip the <strong>MUST</strong> assignments!
					</p>
					<p>
						If you decide to swap out your <strong>WANT</strong> assignment for another one, you'll always get another
						<strong>WANT</strong> assignment and <em>not</em> a <strong>MUST</strong> assignment - that would throw off
						the balance.
					</p>
					<p>
						<strong>Questions?</strong> E-mail me at <a href="mailto:todo@cryto.net">todo@cryto.net</a> or add me on 
						XMPP: joepie91@neko.im. You can also talk to me (and others!) on IRC: <a href="irc://irc.cryto.net/crytocc">
						#crytocc on irc.cryto.net</a>.
					</p>
					<p>
						<strong>Donations are very much appreciated.</strong> This is a free service, without ads, data mining,
						or any other kind of forced 'monetization'. As I only write open-source code, my income is very limited 
						and even small voluntary donations are tremendously helpful.
					</p>
					<p>
						You can <a href="http://cryto.net/~joepie91/donate.html">make a voluntary donation</a> via Bitcoin, PayPal 
						or Flattr. You can also <a href="http://cryto.net/~joepie91">click to learn more</a> about what kind of 
						things I work on.
					</p>
					<p>
						The source code can be found <a href="http://github.com/joepie91/todo">here</a>.
					</p>
				</div>
			</div>
		</div>
		<div id="modal_login" class="modal">
			<form class="pure-form pure-form-aligned" method="post" action="/login">
				<div class="pure-control-group">
					<label for="input_login_username">Username</label>
					<input type="text" id="input_login_username" name="username">
				</div>
				
				<div class="pure-control-group">
					<label for="input_login_password">Password</label>
					<input type="password" id="input_login_password" name="password">
				</div>
				
				<div class="pure-controls">
					<button class="pure-button" type="submit">Login</button>
				</div>
			</form>
		</div>
		<div id="modal_register" class="modal">
			<form class="pure-form pure-form-aligned" method="post" action="/register">
				<div class="pure-control-group">
					<label for="input_register_username">Username</label>
					<input type="text" id="input_register_username" name="username">
				</div>
				
				<div class="pure-control-group">
					<label for="input_register_password">Password</label>
					<input type="password" id="input_register_password" name="password">
				</div>
				
				<div class="pure-control-group">
					<label for="input_register_password2">Confirm password</label>
					<input type="password" id="input_register_password2" name="password2">
				</div>
				
				<div class="pure-controls">
					<button class="pure-button" type="submit">Register and save</button>
				</div>
			</form>
		</div>
	</body>
</html>
