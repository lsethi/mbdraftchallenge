class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, only: [:edit, :update, :destroy, :index]

  def admin_only
    if current_user.email != 'admin@example.com'
      redirect_to :back, notice: "Sorry. You are not authorized to do that."
    end
  end


  def index
    @teams = Team.all.sort_by(&:city)
  end

  def show

  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(teams_params)

    if @team.save
      redirect_to "/teams/new", notice: "The team's been added! Add More?"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @team.update(teams_params)
      redirect_to :teams
    else
      render "Edit"
    end
  end

  def destroy
    @team.destroy
    redirect_to "/teams"
  end

  private

  def teams_params
    params.require(:team).permit( :name, :city, :notes, :helmet, :drafted, :draftee_id, :second_id, :order )
  end

  def find_team
    @team = Team.find(params[:id])
  end

end
