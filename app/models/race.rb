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
    sql = "SELECT users.id, users.username, sum(predict_results.score) as summscore FROM predict_results
            JOIN users on user_id = users.id
            JOIN stages on stage_id = stages.id
            WHERE stages.race_id = #{self.id}
            GROUP by user_id
            ORDER by summscore desc"
    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2]]
    end
    return result
  end
end
