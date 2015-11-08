class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def new
    @plan = Plan.new
    @planner = Person.new
  end

  def create
    @plan = Plan.new(plan_params)
    @planner = Person.find_or_create_by(email: params[:plan][:person][:email])
    @planner.name = params[:plan][:person][:name]

    planner_token = Token.new
    planner_token.become_planner_token(@plan, @planner)
    planner_token.save

    @plan.planner = @planner
    @plan.planner_token_id = planner_token.id
    @plan.people << @planner
    
    respond_to do |format|
      if @plan.save && @planner.save && planner_token.save

        regular_token = Token.new
        regular_token.become_regular_token(@plan, @planner)
        regular_token.save

        format.html { redirect_to edit_plan_path(@plan), notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { redirect_to root_path, notice: "You fucked up. Try again." }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_invitee
    @plan = Plan.find_by(:planner_token_id => params[:id])
    @invitee = @plan.people.build

    respond_to do |format|
      format.js
    end
  end

  def add_invitee
    @plan = Plan.find_by(:planner_token_id => params[:id])
    @invitee = Person.find_or_create_by(email: params[:invitee][:email])
    @invitee.name = params[:invitee][:name]

    respond_to do |format|
      if @invitee.save
        @plan.people << @invitee
        format.js
      else
        format.html { redirect_to edit_plan_path(@plan), notice: 'You fucked up the email somehow, dumdum.' }
      end
    end
  end

  def respond
    @token = Token.find(params[:id])
    @plan = @token.plan
    @person = @token.person
  end

  private
    def set_plan
      @plan = Plan.find_by(:planner_token_id => params[:id])
    end

    def plan_params
      params.require(:plan).permit(:title)
    end

    def invitee_params
      params.require(:invitee).permit(:email, :name)
    end
end
