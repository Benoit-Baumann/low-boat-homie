Rental.destroy_all
Review.destroy_all
Boat.destroy_all
User.destroy_all

@benoit = User.new(email: 'benoit@hotmail.fr', password: 'password', first_name: 'Benoit', last_name: 'Baumann', address: '42 rue Mercière, Lyon, France', date_of_birth: '01/01/2000')
@alex = User.new(email: 'Axel@hotmail.fr', password: 'password', first_name: 'Axel', last_name: 'Nordberg', address: '134 rue de Bâle, Strasbourg, France', date_of_birth: '01/01/2000')
@julien = User.new(email: 'julien@hotmail.fr', password: 'password', first_name: 'Julien', last_name: 'Gregoire', address: '25 rue de Corse, Bonifacio, France', date_of_birth: '01/01/2000')
@benoit.save!
@alex.save!
@julien.save!

boat1 = Boat.new(name: 'La douce', owner: @benoit, category: 'Peniche', location: 'Brest', description: 'tres sympa franchement', price: '50')
boat2 = Boat.new(name: 'Le saumon doré', owner: @benoit, category: 'Yacht', location: 'Vieux-port, Marseille', description: 'tres grand franchement', price: '10000')
boat3 = Boat.new(name: 'Le rapide', owner: @alex, category: 'Speedboat', location: 'Bonifacio', description: 'tres rapide franchement', price:'500')
boat4 = Boat.new(name: 'Le baleno', owner: @benoit, category: 'Catamaran', location: "L'Estaque", description: 'tres sympa franchement', price: '50')
boat5 = Boat.new(name: 'La truite cendrée', owner: @julien, category: 'Voilier', location: 'Vallon des Auffes, Marseille', description: 'tres grand franchement', price: '10000')
boat6 = Boat.new(name: 'Le Bélème', owner: @julien, category: 'Optimist', location: 'Bonifacio', description: 'tres rapide franchement', price:'500')
boat1.save!
boat2.save!
boat3.save!
boat4.save!
boat5.save!
boat6.save!

rental1 = Rental.new(user: @benoit, boat: boat1, price: '500', date: '01/01/2020')
rental2 = Rental.new(user: @julien, boat: boat3, price: '1000', date: '01/01/2020')
rental3 = Rental.new(user: @alex, boat: boat5, price: '50', date: '01/01/2020')
rental1.save!
rental2.save!
rental3.save!

review1 = Review.new(user: @benoit, boat: boat1, description:"cest vrai qui est rapide")
review2 = Review.new(user: @julien, boat: boat3, description:"cest vrai qui est grand")
review3 = Review.new(user: @alex, boat: boat5, description:"cest vrai qui est sympa")
review1.save!
review2.save!
review3.save!
