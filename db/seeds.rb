# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Boat.destroy_all
Rental.destroy_all
Review.destroy_all
User.destroy_all

@benoit = User.new(email: 'benoit@hotmail.fr', encrypted_password: 'password', first_name: 'Benoit', last_name: 'Beaman', address: 'rue de lyon', date_of_birth: '01/01/2000')
@alex = User.new(email: 'alex@hotmail.fr', encrypted_password: 'password', first_name: 'Alex', last_name: 'Nordberg', address: 'rue de lyon', date_of_birth: '01/01/2000')
@julien = User.new(email: 'julien@hotmail.fr', encrypted_password: 'password', first_name: 'Julien', last_name: 'Gregoire', address: 'rue de lyon', date_of_birth: '01/01/2000')

peniche = Boat.new(name: 'peniche', owner: @benoit, type: 'peniche', location: 'paris', description: 'tres sympa franchement')
yacht = Boat.new(name: 'yacht', owner: @benoit, type: 'yacht', location: 'paris', description: 'tres grand franchement')
speedboat = Boat.new(name: 'speedboat', owner: @alex, type: 'speedboat', location: 'paris', description: 'tres rapide franchement')

rental1 = Rental.new(user: @benoit, boat: @speedboat)
rental2 = Rental.new(user: @julien, boat: @yacht)
rental3 = Rental.new(user: @alex, boat: @peniche)

review1 = Review.new(user: @benoit, boat: @speedboat, description:"cest vrai qui est rapide")
review2 = Review.new(user: @julien, boat: @yacht, description:"cest vrai qui est grand")
review3 = Rseview.new(user: @alex, boat: @peniche, description:"cest vrai qui est sympa")
