Restaurants.IndexRoute = Ember.Route.extend({
	model: function() {
		return this.store.find('restaurant'); // By model name?
	},
	setupController: function(controller, model) {
		console.log("Evo me u setupController-u index route-a");
	}
});

/*
For example, if you were writing a web application for placing orders at a restaurant, 
you might have models like Order, LineItem, and MenuItem.
Fetching orders becomes very easy:
this.store.find('order'); */