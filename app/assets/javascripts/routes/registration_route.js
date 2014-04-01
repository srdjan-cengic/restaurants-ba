Restaurants.RegistrationRoute = Ember.Route.extend({
	model: function() {
		return Ember.Object.create();
	},
	setupController: function(controller, model) {
		controller.set("model", model);
		return controller.set("errorMsg", false);
	},
	actions: {
		register: function() {
			this.controllerFor("auth").register(this);
		}
	}
});