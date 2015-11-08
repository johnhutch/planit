class ParticularsController < ApplicationController
  before_action :set_particular, only: [:show, :edit, :update, :destroy]

  def create
    @particular = Particular.new(particular_params)

    respond_to do |format|
      if @particular.save
        case @particular.type
          when "Pwhich"
            format.js { render :action => "show_pwhich", status: :created }
          when "Pwhen"
            format.js { render :action => "show_pwhen", status: :created }
          when "Pwhere"
            format.js { render :action => "show_pwhere", status: :created }
          else 
            raise StandardError.new "unknown Particular type: #{@particular.type}"
          end
      else
        format.js { render :action => "bad_save", status: :unprocessable_entity }
      end
    end
  end

  private
    def set_particular
      @particular = particular.find(params[:id])
    end

    def particular_params
      params.require(:particular).permit(:question, :type, :plan_id, :_destroy)
    end
end
