Restaurants.Restaurant = DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  telephone: DS.attr('string'),
  fbPage: DS.attr('string'),
  videoUrl: DS.attr('string'),

  nekaFunkcija: function() {
  	return "neka bussines logika!?";
  }
});

/*
After you have defined a model class, you can start finding and creating records 
of that type. When interacting with the store, you will need to specify a record's 
type using the model name. For example, the store's find() method expects 
a string as the first argument to tell it what type of record to find:

App.Person = DS.Model.extend();
store.find('person', 1); // store.find('model_name')
store.find('person'); // will fetch all
*/