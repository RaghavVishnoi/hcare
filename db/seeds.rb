# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create!([
	{name: 'admin'},
	{name: 'user'},
	{name: 'trainer'}
])

User.create([
	{:first_name => 'Raghav',:last_name => 'Pratap',:email => 'raghavvishnoi10@gmail.com',:contact_number => '7053747100',:gender => 'male',:password => 'raghav@12345',:role_ids => [1]}
]);

Category.create!([
	{name: 'GYM',status: 'Active'},
	{name: 'YOGA',status: 'Active'}	
])
Country.create!([
	{name: 'India',status: 'Active'}
])
State.create!([
	{name: 'Andhra Pradesh',country_id:1,status: 'Active'},
	{name: 'Arunachal Pradesh',country_id:1,status: 'Active'},
	{name: 'Assam',country_id:1,status: 'Active'},
	{name: 'Bihar',country_id:1,status: 'Active'},
	{name: 'Chhattisgarh',country_id:1,status: 'Active'},
	{name: 'Goa',country_id:1,status: 'Active'},
	{name: 'Gujarat',country_id:1,status: 'Active'},
	{name: 'Haryana',country_id:1,status: 'Active'},
	{name: 'Himachal Pradesh',country_id:1,status: 'Active'},
	{name: 'Jammu & Kashmir',country_id:1,status: 'Active'},
	{name: 'Jharkhand',country_id:1,status: 'Active'},
	{name: 'Karnataka',country_id:1,status: 'Active'},
	{name: 'Kerala',country_id:1,status: 'Active'},
	{name: 'Madhya Pradesh',country_id:1,status: 'Active'},
	{name: 'Maharashtra',country_id:1,status: 'Active'},
	{name: 'Manipur',country_id:1,status: 'Active'},
	{name: 'Meghalaya',country_id:1,status: 'Active'},
	{name: 'Mizoram',country_id:1,status: 'Active'},
	{name: 'Nagaland',country_id:1,status: 'Active'},
	{name: 'Odisha (Orissa)',country_id:1,status: 'Active'},
	{name: 'Punjab',country_id:1,status: 'Active'},
	{name: 'Rajasthan',country_id:1,status: 'Active'},
	{name: 'Sikkim',country_id:1,status: 'Active'},
	{name: 'Tamil Nadu',country_id:1,status: 'Active'},
	{name: 'Telangana (from June 2, 2014)',country_id:1,status: 'Active'},
	{name: 'Tripura',country_id:1,status: 'Active'},
	{name: 'Uttar Pradesh',country_id:1,status: 'Active'},
	{name: 'Uttarakhand',country_id:1,status: 'Active'},
	{name: 'West Bengal',country_id:1,status: 'Active'}

])
