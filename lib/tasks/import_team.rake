namespace :import do

  desc "Import team"
  task :team => :environment do
    doc = Nokogiri::HTML(open('http://www.procyclingstats.com/team/Ag2r_La_Mondiale_2015'))
    doc.css('div.wrapper div.content div div a').each do |item|
      puts item.text
    end
  end
end
