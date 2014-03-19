Restaurants.Restaurant = DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  telephone: DS.attr('string'),
  fbPage: DS.attr('string'),
  videoUrl: DS.attr('string')
});