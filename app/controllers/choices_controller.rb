class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show, :edit, :update, :destroy]

  def attach
    @pwhich = Pwhich.find(params[:id])
    @choice = @pwhich.choices.build

    respond_to do |format|
      format.js
    end
  end

  def create
    @choice = Choice.new(choice_params)

    respond_to do |format|
      if @choice.save
        format.js
      else
        format.js { render :action => "bad_save", status: :unprocessable_entity }
      end
    end
  end

  private
    def set_choice
      @choice = Choice.find(params[:id])
    end

    def choice_params
      params.require(:choice).permit(:answer, :particular_id)
    end
end
