# == Schema Information
#
# Table name: rounds
#
#  id            :integer          not null, primary key
#  tournament_id :integer
#  name          :string(255)
#  slug          :string(255)
#  start_at      :date
#  multiplier    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Round < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :tournament
  has_many :matches

  def get_overall
    sql = "SELECT users.id, users.username,
        sum(mp.score) as summscore,
        users.slug
      FROM match_predicts mp
      JOIN users on user_id = users.id
      JOIN matches on match_id = matches.id
      JOIN rounds on rounds.id = matches.round_id
      WHERE rounds.id = #{id}
      AND mp.score1 is not NULL
      AND mp.score2 is not NULL
      GROUP by mp.user_id
      ORDER by summscore desc"

    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2], row[4]]
    end
    return result
  end
end
