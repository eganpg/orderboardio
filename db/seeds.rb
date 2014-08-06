# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
logins = Login.create([{firstName: 'Peter', lastName: 'Egan', email: 'eganpg@gmail.com'},
												{firstName: 'Alden', lastName: 'Egan', email: 'alden_egan@yahoo.com'},
												{firstName: 'Luke', lastName: 'Egan', email: 'trishegan5@hotmail.com'}
				])

products = Product.create([
	{name: 'Baby Fennel', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Baby Artichoke', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Celery', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Plugra', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Apple Cider', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Beets', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Whole Milk', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Buttermilk', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'AP Flour', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Cayenne', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Semolina Flour', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Buckwheat Flour', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Petite Hearts on Fire', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'},
	{name: 'Oregano', price: '$5.00', description: 'Weiser Farms', picture: "", unit: 'cs'}

	])