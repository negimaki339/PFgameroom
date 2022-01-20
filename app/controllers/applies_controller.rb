class AppliesController < ApplicationController
  def create
    current_user.applies.create(team_id: apply_params[:team_id])
    redirect_to team_url(apply_params[:team_id]), notice: "加入申請しました"
  end

  private

    def apply_params
      params.permit(:team_id)
    end

end
