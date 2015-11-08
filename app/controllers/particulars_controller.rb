class ParticularsController < ApplicationController
  before_action :set_particular, only: [:show, :edit, :update, :destroy]

  def destroy
    @pwhich.destroy
    respond_to do |format|
      format.html { redirect_to pwhiches_url, notice: 'particular was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_particular
      @particular = Particular.find(params[:id])
    end

    def particular_params
      params.require(:particular).permit(:question, :type, :plan_id, :_destroy)
    end
end
