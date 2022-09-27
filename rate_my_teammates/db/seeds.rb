# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = [ {:uni=> 'lc3533', :name => 'Charles Chen', :description => 'MSCS_2021', :self_time_management => 5, :self_communication => 5, :self_reliability => 5, :self_critical_thinking => 5, :self_collaboration => 5}]


users.each do |u|
    user = User.create(u)
end
