class TeamsController < ApplicationController
    include UsersHelper
    require_relative "../models/pokemon.rb"


    def index
        redirect_if_not_logged_in
        @team = User.find_by_id(params[:user_id]).teams
        render :index
    end

    def show
        redirect_if_not_logged_in
        @team = Team.find(params[:id])
        
    end

    def new
        redirect_if_not_logged_in
        @team = Team.new
        6.times do 
            @team.team_pokemons.build
        end
    end

    def create
        redirect_if_not_logged_in
        @team = Team.new(team_params)
        @team.user_id = current_user.id
        if @team.save
            flash[:message] = "Team Successfuly Created!"
            redirect_to user_teams_path(current_user)
        else
            flash[:message] = "Team failed to save!"
            render :new
        end
    end

    def destroy
        @team = Team.find(params[:id])
        if @team.user == current_user
            @team.destroy
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def team_params
        params.require(:team).permit(:team_name, :user_id, :id, team_pokemons_attributes: [:nickname, :pokemon_id])
    end
end
