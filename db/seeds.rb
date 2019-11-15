Rental.destroy_all
Review.destroy_all
Boat.destroy_all
User.destroy_all

joseph_avatar = Pathname.new("#{Rails.root}/app/assets/images/jojo2.jpg").open
kevin_avatar = Pathname.new("#{Rails.root}/app/assets/images/kevcha2.jpg").open
benjamin_avatar = Pathname.new("#{Rails.root}/app/assets/images/benji.png").open
mac_avatar = Pathname.new("#{Rails.root}/app/assets/images/mac.jpg").open

joseph_bateau = Pathname.new("#{Rails.root}/app/assets/images/jo-PussyPalace.jpg").open
kevin_bateau = Pathname.new("#{Rails.root}/app/assets/images/kev-pussyslayer.jpg").open
benjamin_bateau = Pathname.new("#{Rails.root}/app/assets/images/ben-Treasurecolor.jpg").open



@benoit = User.new(email: 'benoit@hotmail.fr', password: 'password', first_name: 'Benoit', last_name: 'Baumann', address: '42 rue Mercière, Lyon, France', date_of_birth: '02/04/1990')
@alex = User.new(email: 'Axel@hotmail.fr', password: 'password', first_name: 'Axel', last_name: 'Nordberg', address: '134 rue de Bâle, Strasbourg, France', date_of_birth: '01/01/1991')
@julien = User.new(email: 'julien@hotmail.fr', password: 'password', first_name: 'Julien', last_name: 'Gregoire', address: '25 rue de Corse, Bonifacio, France', date_of_birth: '04/05/1990')
@mac = User.new(email: 'mac@hotmail.fr', password: 'password', first_name: 'Mackenzie', last_name: 'Jomard', address: '420 Paris street, Detroit, US', date_of_birth: '04/05/1990', photo: mac_avatar)
@joseph = User.new(email: 'joseph@hotmail.fr', password: 'password', first_name: 'Joseph', last_name: 'Blanchard', address: '10 rue des Moldus, Lyon, France', date_of_birth: '24/12/1960', photo: joseph_avatar)
@kevin = User.new(email: 'kevin@hotmail.fr', password: 'password', first_name: 'Kevin', last_name: 'Chavanne', address: '42 impasse de la Défaite, St-Etienne, France', date_of_birth: '15/10/1969', photo: kevin_avatar)
@benjamin = User.new(email: 'benjamin@hotmail.fr', password: 'password', first_name: 'Benjamin', last_name: 'Jolivot', address: '69 Boulevard des Rageux, Marseille, France', date_of_birth: '06/06/2001', photo: benjamin_avatar)

@benoit.save!
@alex.save!
@julien.save!
@mac.save!
@joseph.save!
@kevin.save!
@benjamin.save!

boat1 = Boat.new(name: 'P****Slayer', owner: @kevin, category: 'Yacht', location: 'Piscine Municipale, St-Etienne', description: 'tres sympa franchement', price: '3500', photo: kevin_bateau)
boat2 = Boat.new(name: 'P****Palace', owner: @joseph, category: 'Voilier', location: 'Vieux-port, Toulouse', description: 'tres grand franchement', price: '5000', photo: joseph_bateau)
boat3 = Boat.new(name: 'Le Rapide', owner: @benjamin, category: 'Speedboat', location: 'Bonifacio', description: 'tres rapide franchement', price:'1400', photo: benjamin_bateau)
boat4 = Boat.new(name: 'Le Baleno', owner: @mac, category: 'Catamaran', location: "L'Estaque", description: 'tres sympa franchement', price: '1500')
boat5 = Boat.new(name: 'La Truite Cendrée', owner: @joseph, category: 'Voilier', location: 'Vallon des Auffes, Marseille', description: 'tres grand franchement', price: '2000')
boat6 = Boat.new(name: 'Le Bélème', owner: @mac, category: 'Aéroglisseur', location: 'Bonifacio', description: 'tres rapide franchement', price:'1100')
boat7 = Boat.new(name: 'La Loup des Mers', owner: @benjamin, category: 'Péniche', location: 'Pointe-Rouge, Marseille', description: 'tres sympa franchement', price: '950')
boat8 = Boat.new(name: 'Le Moby Dick', owner: @kevin, category: 'Galion', location: 'Les Goudes, Marseille', description: 'tres sympa franchement', price: '15000')

boat1.save!
boat2.save!
boat3.save!
boat4.save!
boat5.save!
boat6.save!
boat7.save!
boat8.save!


rental1 = Rental.new(user: @benoit, boat: boat1, price: '500', date: '01/01/2020')
rental2 = Rental.new(user: @julien, boat: boat3, price: '1000', date: '01/01/2020')
rental3 = Rental.new(user: @alex, boat: boat5, price: '50', date: '01/01/2020')
rental1.save!
rental2.save!
rental3.save!

review1 = Review.new(user: @benoit, boat: boat1, description:"cest vrai qui est rapide")
review2 = Review.new(user: @julien, boat: boat3, description:"cest vrai qui est grand")
review3 = Review.new(user: @alex, boat: boat5, description:"cest vrai qui est sympa")
review4 = Review.new(user: @benoit, boat: boat1, description:"cest vrai qui est rapide")
review5 = Review.new(user: @benoit, boat: boat1, description:"cest vrai qui est rapide")
review1 = Review.new(user: @benoit, boat: boat3, description:"cest vrai qui est rapide")
review1 = Review.new(user: @benoit, boat: boat5, description:"cest vrai qui est rapide")
review1.save!
review2.save!
review3.save!
