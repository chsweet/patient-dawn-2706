class RegistrationsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
    @registration = Registration.new
  end

  def create
    competition = Competition.find(params[:competition_id])
    team = Team.create(team_params)

    Registration.create(team: team, competition: competition)

    redirect_to competition_path(competition)
  end

private
  def team_params
    params.require(:registration).permit(:nickname, :hometown)
  end
end
