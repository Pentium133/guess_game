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
#  slug       :string(255)
#  race_type  :integer          default(0)
#  is_ready   :boolean          default(FALSE)
#

class Race < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name_and_season, use: :slugged

  belongs_to :season
  has_many :stages
  has_many :race_results

  enum race_type: { grand_tour: 0, word_tour: 1, classics_tour: 2 }

  def race_type_enum
    Race.race_types
  end

  def name_and_season
    "#{name} #{season.name}"
  end

  def get_overall_result(result_type)
    race_results.joins(:user).where('result_type = ?', result_type).order(:place)
  end

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
    return nil unless grand_tour?
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
    return nil unless grand_tour?
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

  def get_win_count
    sql = "SELECT users.id, users.username, sum(pr.place) cpl
            FROM predict_results pr
            JOIN users on user_id = users.id
            JOIN stages on stage_id = stages.id
            WHERE stages.race_id = #{self.id}
                  AND place = 1
                  AND score > 0
            GROUP by user_id
            ORDER By cpl desc"
    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2]]
    end
    return result
  end

  def get_accurate_prediction
    sql = "SELECT stages.id, users.username, sum(guessed) cpl, sum(pr.place) as summplace
            FROM stage_predicts pr
            JOIN users on user_id = users.id
            JOIN stages on stage_id = stages.id
            WHERE stages.race_id = 1
                  AND guessed = 1
                  AND score > 0
            GROUP by user_id
            ORDER By cpl desc, summplace asc"
    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2]]
    end
    return result
  end

  def get_max_score
    sql = "SELECT user_id, u.username, max(score) maxs FROM predict_results
            JOIN users u on user_id = u.id
            JOIN stages s on stage_id = s.id and s.stage_type < 10
            GROUP BY user_id
            ORDER BY maxs desc"
    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2]]
    end
    return result
  end
end
