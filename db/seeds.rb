require 'open-uri'

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

Team.create code: 'ALM', short_name: 'AG2R', country: 'FR', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/AG2R-La-Mondiale-2015.jpg'
Team.create code: 'AST', short_name: 'ASTANA', country: 'KZ', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-03/thumb/Astana_Pro_Team-2015.jpg'
Team.create code: 'BMC', short_name: 'BMC', country: 'US', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/BMC-Racing-Team-2015.jpg'
Team.create code: 'EQS', short_name: 'QUICK STEP', country: 'BE', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Etixx-Quick-Step-2015.jpg'
Team.create code: 'FDJ', short_name: 'FDJ', country: 'FR', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/FDJ-2015.jpg'
Team.create code: 'IAM', short_name: 'CYCLING', country: 'CH', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/IAM-Cycling-2015.jpg'
Team.create code: 'LAM', short_name: 'LAMPRE', country: 'IT', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-03/thumb/Lampre_Merida-2015.jpg'
Team.create code: 'LTS', short_name: 'LOTTO', country: 'BE', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Lotto-Soudal-2015.jpg'
Team.create code: 'MOV', short_name: 'MOVISTAR', country: 'ES', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Movistar-Team-2015.jpg'
Team.create code: 'OGE', short_name: 'ORICA', country: 'AU', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Orica-GreenEDGE-2015.jpg'
Team.create code: 'TCG', short_name: 'CANNONDALE', country: 'US', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-03/thumb/Team_Cannondale_garmin-2015.jpg'
Team.create code: 'TGA', short_name: 'GIANT', country: 'DE', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Team-Giant-Alpecin-2015.jpg'
Team.create code: 'KAT', short_name: 'KATUSHA', country: 'RU', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Team-Katusha-2015.jpg'
Team.create code: 'TLJ', short_name: 'LOTTO', country: 'NL', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Team-LottoNL-Jumbo-2015.jpg'
Team.create code: 'SKY', short_name: 'SKY', country: 'GB', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Team-Sky-2015.jpg'
Team.create code: 'TCS', short_name: 'TINKOFF', country: 'RU', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Tinkoff-Saxo-2015.jpg'
Team.create code: 'TFR', short_name: 'TREK', country: 'US', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Trek-Factory-Racing-2015.jpg'
puts 'Teams created'