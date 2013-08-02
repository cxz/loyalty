# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.where(:username => 'admin').first_or_create!({:password => 'admin123', :password_confirmation => 'admin123', :admin => true, :email => 'admin@example.com'})
User.where(:username => 'guest').first_or_create!({:password => 'guest123', :password_confirmation => 'guest123', :admin => false, :email => 'guest@example.com'})

['cervantes', 'camus', 'alighieri', 'thomas_mann', 'poe', 'hemingway', 'kafka'].each do |u|
  User.where(:username => u).first_or_create!({:points => rand(10000), :password => 'password', :password_confirmation => 'password', :admin => false, :email => "#{u}@milchito.com"})
end

Company.where(:name => 'acme').first_or_create!

not_redeemed = Giftcard.where(:owner_id => nil).count

if not_redeemed < 10 then
  (10 - not_redeemed).times do |i|
    Giftcard.create!({:code => rand(36**8).to_s(36), :value => (i+1) * 100.0})
  end
end

Reward.where(:name => 'Trip to Vegas').first_or_create({:price => 2000.00})
Reward.where(:name => 'Nice Office').first_or_create({:price => 10000.00})
Reward.where(:name => 'Chocolate').first_or_create({:price => 5.00})



