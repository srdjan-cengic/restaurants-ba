Restaurants.AuthController = Ember.ObjectController.extend({
	currentUser: null,
	isAuthenticated: Em.computed.notEmpty("currentUser.email"),

	login: function(route) {
		var that = this; // AuthController?

		return $.ajax({
			url: "/users/sign_in.json", // http://localhost:3000/users/sign_in.json
			type: "POST",
			data: {
				"user[email]": route.currentModel.email,
				"user[password]": route.currentModel.password
			},
			success: function(data) {
				console.log(data);
				that.set("currentUser", data.user); // postavljas currentUser property na authcontroleru
				return route.transitionTo('index');
			},
			error: function(jqXHR, textStatus, errorThrown) {
				// Unauthorized (401)
				if(jqXHR.status === 401) {
					route.controllerFor('login').set('errorMsg', 'The email/password combo didnt work. Please try again.')
				}
				else {
					return p("Login error: " + jqXHR.status + " | " + errorThrown);
				}
			}
		});
	},
	register: function(route) {
		var that = this;

		return $.ajax({
			url: "/users.json",
			type: "POST",
			data: {
				"user[email]": route.currentModel.email,
				"user[password]": route.currentModel.password,
				"user[password_confirmation]": route.currentModel.password_confirmation
			},
			success: function(data) {
				that.set("currentUser", data.user);
				return route.transitionTo('index');
			},
			error: function(jqXHR, textStatus, errorThrown) {
				//console.log(jqXHR.responseText);

				var errors = $.parseJSON(jqXHR.responseText);
				console.log(errors);

				/*var output = "<div>";

				for(var key in errors.errors) {
					output += "<small>" + key + " " + errors.errors[key] + ".</small><br>";
				}

				output += "</div>";
				console.log(output);
				$('.alert-error').html(output);*/

				return route.controllerFor('registration').set('errorMsg', true);
			}
		});
	}
});	

/*
	DeviseController only respond to HTML by default. 
	You can add additional formats such as JSON though, which should solve your issue.
*/