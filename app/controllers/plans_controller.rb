class PlansController < ApplicationController

  def new
    @planner = Person.new
    @plan = @planner.plans.build
  end
end
