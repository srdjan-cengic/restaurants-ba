Restaurants.LoginRoute = Ember.Route.extend({
	model: function() {
		//console.log("LoginRoute"); console.log(this);
		
		//console.log("Trenutno samo u model hook-u LoginROute-a");
		return Ember.Object.create(); // Create empty model
	},
	setupController: function(controller, model) {
		console.log(this.currentModel);
		//console.log("Trenutno smo u setupControlleru LoginRoute-a");
		//console.log(this.currentModel);
		/* In the controller, model is aliased to content, 
		and it's automatically set on the controller by routes*/
		controller.set("content", model);
		/*return*/ controller.set("errorMsg", "");
		/* Ti sa ovim controller.set bukvalno dodajes propertije kontroleru */
		/* sada u login templejtu mozes napisati {{ controller.errorMessage1 }}*/
	},
	actions: {
		login: function() {
			//console.log("U actionsu LoginRoute-a...."); 
			//console.log(this.currentModel);
			return this.controllerFor("auth").login(this); // salje mu objekat this === LoginRoute
		},
		cancel: function() {
			$.ajax({
				url: "/api/test.json",
				type: "GET",
				success: function(data){
					console.log(data);
				}
			});

			console.log("LoginRoute currentModel");
			console.log(this.currentModel);
		}
	}
});

/*
	You can tell a template which model it should render by defining a route with the same name 
	as the template, and implementing its model hook. Tebi je ovdje model za "login" templejt prazan objekat.
*/

/*
 	App.ApplicationRoute = Ember.Route.extend({
      	setupController: function(controller) {
      		controller.set('title', "Hello world!");
   		}
	});
    VERSUS
	App.ApplicationController = Ember.Controller.extend({
    	appName: 'My First Example'
	});

	setupController is primarily for setting up some controller context dynamically. 
	In your example, if the title is always gonna be "Hello world!" it's fine to set it in class declaration.

	By default, setupController will set the model property of controller to the value returned from model hook 
	of the route.
*/

/*
	App.Router.map(function() {
  		this.resource('post', { path: '/posts/:post_id' });
	});

	App.PostRoute = Ember.Route.extend({
	  // The code below is the default behavior, so if this is all you
	  // need, you do not need to provide a setupController implementation
	  // at all.
	  setupController: function(controller, model) {
	    controller.set('model', model);
	  }
	});

	The setupController hook receives the route handler's associated controller as its first argument. 
	In this case, the PostRoute's setupController receives the application's instance of App.PostController.

	As a second argument, it receives the route handler's model.
*/

/*
	controllerFor is used to fetch singleton instances of a given controller.

*/

/*
	http://stackoverflow.com/questions/20856661/ember-js-form-instant-submit
*/