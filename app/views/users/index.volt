{{ content() }}

<div align="center">

	<h2>Log In</h2>

	{{ form('users/login', 'class' : 'form-inline', 'autocomplete' : 'off') }}

		<p>
			<label class="control-label" for="login">Username/Email</label><br/>
			{{ text_field('login', 'size' : "30") }}
		</p>

		<p>
			<label class="control-label" for="password">Password</label><br/>
			{{ password_field('password', 'size' : "30") }}
		</p>

		<p>
			{{ submit_button('Login', 'class' : 'btn btn-primary btn-large') }}
		</p>

	{{ end_form() }}
</div>