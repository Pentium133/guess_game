# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Season.create name: '2015'
puts 'Season created: 2015'

Team.create code: 'ALM', short_name: 'AG2R', country: 'FR'
Team.create code: 'AST', short_name: 'ASTANA', country: 'KZ'
Team.create code: 'BMC', short_name: 'BMC', country: 'US'
Team.create code: 'EQS', short_name: 'QUICK STEP', country: 'BE'
Team.create code: 'FDJ', short_name: 'FDJ', country: 'FR'
Team.create code: 'IAM', short_name: 'CYCLING', country: 'CH'
Team.create code: 'LAM', short_name: 'LAMPRE', country: 'IT'
Team.create code: 'LTS', short_name: 'LOTTO', country: 'BE'
Team.create code: 'MOV', short_name: 'MOVISTAR', country: 'ES'
Team.create code: 'OGE', short_name: 'ORICA', country: 'AU'
Team.create code: 'TCG', short_name: 'CANNONDALE', country: 'US'
Team.create code: 'TGA', short_name: 'GIANT', country: 'DE'
Team.create code: 'KAT', short_name: 'KATUSHA', country: 'RU'
Team.create code: 'TLJ', short_name: 'LOTTO', country: 'NL'
Team.create code: 'SKY', short_name: 'SKY', country: 'GB'
Team.create code: 'TCS', short_name: 'TINKOFF', country: 'RU'
Team.create code: 'TFR', short_name: 'TREK', country: 'US'