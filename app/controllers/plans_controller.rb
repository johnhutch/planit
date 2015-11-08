class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def new
    @planner = Person.new
    @plan = @planner.made_plans.build
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
    @invitee = Person.new(invitee_params)

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
