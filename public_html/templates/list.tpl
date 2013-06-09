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
			
			<div class="pure-u-1">
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
