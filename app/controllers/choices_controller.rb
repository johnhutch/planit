class ChoicesController < ApplicationController
  def attach
    @pwhich = Pwhich.find(params[:id])
    @choice = @pwhich.choices.build

    respond_to do |format|
      format.js
    end
  end
end
