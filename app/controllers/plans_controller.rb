class PlansController < ApplicationController

  def new
    @planner = Person.new
    @plan = @planner.made_plans.build
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:title)
    end
end
