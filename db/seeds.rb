# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

restourant_list = [
	["Elemnt Illy", 
	 "Svi gurmani, ali i ljubitelji kafe i caja istancanog cula okusa, 
	 ponovo su dobili mjesto za izlazak po svojoj mjeri. Novootvoreni 
	 restoran i caffe slasticarna Element Illy u Importanne centru od 
	 jucer ima svoj potpuno novi izgled. 
	 Ovo je mjesto dobre hrane i ukusnih slastica pripremljenih od 
	 vrhunskih namirnica",
	 "033 943-845",
	 "https://www.facebook.com/pages/Element-Sarajevo/604630479567968",
	 "https://www.youtube.com/watch?v=2daor2cv264"],
	 ["Mala pivnica",
	  "Pivnica Sarajevo je restoran u kojem se redovito sastaju razna 
	  prijateljska drustva, a mi prepoznajemo njihove navike i potrebe. 
	  Cuveni gradski boemi i umjetnici odabrali su Pivnicu Sarajevo 
	  kao kultno mjesto koje im uljepsava dane.U ugodnom ambijentu 
	  imaju priliku uzivati u nasim delicijama, vinima i rakijama, 
	  i umjecu nasih  gostujucih muzicara. Ovo je mjesto za one koji 
	  znaju da prepoznaju dobar ukus i stil.",
	  "062 318-624",
	  "https://www.facebook.com/pages/Pivnica-HS-Sarajevo/191359830900109?rf=191428997567001",
	  "https://www.youtube.com/watch?v=2daor2cv264"
	]
]

restourant_list.each do |name, desc, telephone, fb, video|
	Restaurant.create(name: name, 
					  description: desc, 
					  telephone: telephone, 
					  fb_page: fb, 
					  video_url: video)
end
