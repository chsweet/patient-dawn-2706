class RegistrationsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
    @registration = Team.new
  end

  def create
    competition = Competition.find(params[:competition_id])
    team = Team.create(nickname: params[:nickname], hometown: params[:hometown])

    Registration.create(team: team, competition: competition)

    redirect_to competition_path(competition)
  end
end
