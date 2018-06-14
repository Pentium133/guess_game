class MatchesController < ApplicationController

  def predicts
    match_predict = MatchPredict.find_or_create_by(match_id: params[:id], user_id: current_user.id)

    if policy(match_predict.match).predict? && match_predict.update(match_predicts_params)
      redirect_to tournament_round_path(match_predict.match.round.tournament_id, match_predict.match.round_id), notice: t('.successful')
    end
  end

  private

  def match_predicts_params
    params.require(:match_predict).permit(:score1, :score2)
  end
end
