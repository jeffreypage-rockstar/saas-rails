# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['personal', 'startup', 'growth', 'enterprise'].each do |plan_name|

end

Plan.create( name: 'personal', price: 9, response_limit: 1000, survey_limit: 5 )
Plan.create( name: 'startup', price: 20, response_limit: 5000, survey_limit: 10 )
Plan.create( name: 'growth', price: 59, response_limit: 25000, survey_limit: 0 )
Plan.create( name: 'enterprise', price: 149, response_limit: 0, survey_limit: 0 )