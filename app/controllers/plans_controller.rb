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

    @plan.planner_id = @planner.id
    @plan.people << @planner
    
    respond_to do |format|
      if @plan.save && @planner.save
        format.html { redirect_to edit_plan_path(@plan), notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { redirect_to root_path, notice: "You fucked up. Try again." }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_invitee
    @plan = Plan.find(params[:id])
    @invitee = @plan.people.build

    respond_to do |format|
      format.js
    end
  end

  def add_invitee
    @plan = Plan.find(params[:id])
    @invitee = Person.find_or_create_by(invitee_params)

    respond_to do |format|
      if @invitee.save
        @plan.people << @invitee
        format.js
      else
        format.html { redirect_to edit_plan_path(@plan), notice: 'You fucked up the email somehow, dumdum.' }
      end
    end
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:title)
    end

    def invitee_params
      params.require(:invitee).permit(:email)
    end
end
