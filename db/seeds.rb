# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Rental.destroy_all
Review.destroy_all
Boat.destroy_all
User.destroy_all

@benoit = User.new(email: 'benoit@hotmail.fr', password: 'password', first_name: 'Benoit', last_name: 'Beaman', address: 'rue de lyon', date_of_birth: '01/01/2000')
@alex = User.new(email: 'alex@hotmail.fr', password: 'password', first_name: 'Alex', last_name: 'Nordberg', address: 'rue de lyon', date_of_birth: '01/01/2000')
@julien = User.new(email: 'julien@hotmail.fr', password: 'password', first_name: 'Julien', last_name: 'Gregoire', address: 'rue de lyon', date_of_birth: '01/01/2000')
@benoit.save!
@alex.save!
@julien.save!

peniche = Boat.new(name: 'peniche', owner: @benoit, category: 'peniche', location: 'paris', description: 'tres sympa franchement', price: '50')
yacht = Boat.new(name: 'yacht', owner: @benoit, category: 'yacht', location: 'paris', description: 'tres grand franchement', price: '10000')
speedboat = Boat.new(name: 'speedboat', owner: @alex, category: 'speedboat', location: 'paris', description: 'tres rapide franchement', price:'500')
peniche.save!
yacht.save!
speedboat.save!

rental1 = Rental.new(user: @benoit, boat: speedboat, price: '500', date: '01/01/2020')
rental2 = Rental.new(user: @julien, boat: yacht, price: '1000', date: '01/01/2020')
rental3 = Rental.new(user: @alex, boat: peniche, price: '50', date: '01/01/2020')
rental1.save!
rental2.save!
rental3.save!

review1 = Review.new(user: @benoit, boat: speedboat, description:"cest vrai qui est rapide")
review2 = Review.new(user: @julien, boat: yacht, description:"cest vrai qui est grand")
review3 = Review.new(user: @alex, boat: peniche, description:"cest vrai qui est sympa")
review1.save!
review2.save!
review3.save!
