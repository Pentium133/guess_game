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

s2015 = Season.create name: '2015'
puts 'Season created: 2015'

tm = Team.create code: 'ALM', short_name: 'AG2R', country: 'FR'
TeamSeason.create season: s2015, team: tm, name: 'AG2R LA MONDIALE', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/AG2R-La-Mondiale-2015.jpg'

tm = Team.create code: 'AST', short_name: 'ASTANA', country: 'KZ'
TeamSeason.create season: s2015, team: tm, name: 'ASTANA PRO TEAM', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-03/thumb/Astana_Pro_Team-2015.jpg'

tm = Team.create code: 'BMC', short_name: 'BMC', country: 'US'
TeamSeason.create season: s2015, team: tm, name: 'BMC RACING TEAM', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/BMC-Racing-Team-2015.jpg'

tm = Team.create code: 'EQS', short_name: 'QUICK STEP', country: 'BE'
TeamSeason.create season: s2015, team: tm, name: 'ETIXX - QUICK STEP', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Etixx-Quick-Step-2015.jpg'

tm = Team.create code: 'FDJ', short_name: 'FDJ', country: 'FR'
TeamSeason.create season: s2015, team: tm, name: 'FDJ', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/FDJ-2015.jpg'

tm = Team.create code: 'IAM', short_name: 'CYCLING', country: 'CH'
TeamSeason.create season: s2015, team: tm, name: 'IAM CYCLING', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/IAM-Cycling-2015.jpg'

tm = Team.create code: 'LAM', short_name: 'LAMPRE', country: 'IT'
TeamSeason.create season: s2015, team: tm, name: 'LAMPRE - MERIDA', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-03/thumb/Lampre_Merida-2015.jpg'

tm = Team.create code: 'LTS', short_name: 'LOTTO', country: 'BE'
TeamSeason.create season: s2015, team: tm, name: 'LOTTO SOUDAL', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Lotto-Soudal-2015.jpg'

tm = Team.create code: 'MOV', short_name: 'MOVISTAR', country: 'ES'
TeamSeason.create season: s2015, team: tm, name: 'MOVISTAR TEAM', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Movistar-Team-2015.jpg'

tm = Team.create code: 'OGE', short_name: 'ORICA', country: 'AU'
TeamSeason.create season: s2015, team: tm, name: 'ORICA GREENEDGE', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Orica-GreenEDGE-2015.jpg'

tm = Team.create code: 'TCG', short_name: 'CANNONDALE', country: 'US'
TeamSeason.create season: s2015, team: tm, name: 'TEAM CANNONDALE - GARMIN', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-03/thumb/Team_Cannondale_garmin-2015.jpg'

tm = Team.create code: 'TGA', short_name: 'GIANT', country: 'DE'
TeamSeason.create season: s2015, team: tm, name: 'TEAM GIANT - ALPECIN', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Team-Giant-Alpecin-2015.jpg'

tm = Team.create code: 'KAT', short_name: 'KATUSHA', country: 'RU'
TeamSeason.create season: s2015, team: tm, name: 'TEAM KATUSHA', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Team-Katusha-2015.jpg'

tm = Team.create code: 'TLJ', short_name: 'LOTTO', country: 'NL'
TeamSeason.create season: s2015, team: tm, name: 'TEAM LOTTO NL-JUMBO', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Team-LottoNL-Jumbo-2015.jpg'

tm = Team.create code: 'SKY', short_name: 'SKY', country: 'GB'
TeamSeason.create season: s2015, team: tm, name: 'TEAM SKY', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Team-Sky-2015.jpg'

tm = Team.create code: 'TCS', short_name: 'TINKOFF', country: 'RU'
TeamSeason.create season: s2015, team: tm, name: 'TINKOFF - SAXO', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Tinkoff-Saxo-2015.jpg'

tm = Team.create code: 'TFR', short_name: 'TREK', country: 'US'
TeamSeason.create season: s2015, team: tm, name: 'TREK FACTORY RACING', remote_logo_url: 'http://www.procyclingstats.com/shirts/2015-01/thumb/Trek-Factory-Racing-2015.jpg'

puts 'Teams created'