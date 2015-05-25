namespace :import do

  desc "Import team"
  task :team => :environment do
    doc = Nokogiri::HTML(open('http://www.procyclingstats.com/team/Ag2r_La_Mondiale_2015'))
    doc.css('div.wrapper div.content div div a').each do |item|
      puts item.text
    end
  end

  desc "Slugable stage and races"
  task :slug => :environment do
    Stage.includes(:race).all.each do |stage|
      stage.touch
      stage.save
      print '.'
    end

    Race.includes(:season).all.each do |race|
      race.touch
      race.save
      print '.'
    end
  end


end
