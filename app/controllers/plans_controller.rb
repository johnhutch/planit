class PlansController < ApplicationController

  def new
    @planner = Person.new
    plan = @planner.plans.build
    @question = plan.particulars.build
  end
end
