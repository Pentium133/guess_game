# == Schema Information
#
# Table name: races
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  season_id  :integer
#  start_at   :date
#  end_at     :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Race < ActiveRecord::Base
  belongs_to :season
  has_many :stages

  def get_overall
    sql = "SELECT users.id, users.username,
                  sum(predict_results.score) as summscore,
                  sum(predict_results.place) as summplace
            FROM predict_results
            JOIN users on user_id = users.id
            JOIN stages on stage_id = stages.id
            WHERE stages.race_id = #{self.id}
            GROUP by user_id
            ORDER by summscore desc, summplace asc"
    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2]]
    end
    return result
  end

  def get_overall_sprinters
    sql = "SELECT users.id, users.username,
                  sum(predict_results.score) as summscore,
                  sum(predict_results.place) as summplace
            FROM predict_results
            JOIN users on user_id = users.id
            JOIN stages on stage_id = stages.id
            WHERE stages.race_id = #{self.id} and stages.stage_type = 3
            GROUP by user_id
            ORDER by summscore desc, summplace asc"
    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2]]
    end
    return result
  end

  def get_overall_mountains
    sql = "SELECT users.id, users.username,
                  sum(predict_results.score) as summscore,
                  sum(predict_results.place) as summplace
            FROM predict_results
            JOIN users on user_id = users.id
            JOIN stages on stage_id = stages.id
            WHERE stages.race_id = #{self.id} and stages.stage_type = 4
            GROUP by user_id
            ORDER by summscore desc, summplace asc"
    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2]]
    end
    return result
  end
end
