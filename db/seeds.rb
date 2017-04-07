# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create! :nombre => 'Admin', :email => 'admin@admin.com', :password => 'asdfasdf', :password_confirmation => 'asdfasdf', :aprobado => true, :admin => true
Content.create(title: 'DECOVI', body: 'Bienvenidos a DECOVI')
Content.create(title: 'DECOVI', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
Content.create(title: 'DECOVI', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
Content.create(title: 'DECOVI', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
Content.create(title: 'DECOVI', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
Content.create(title: 'DECOVI', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
Content.create(title: 'DECOVI', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
Content.create(title: 'DECOVI', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')


