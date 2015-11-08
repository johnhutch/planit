class PwhichesController < ApplicationController
  before_action :set_pwhich, only: [:show, :edit, :update, :destroy]

  def new
    respond_to do |format|
      format.js
    end 
  end

  def attach_new
    @plan = Plan.find(params[:id])
    @pwhich = @plan.pwhiches.build
    @pwhich.choices.build

    respond_to do |format|
      format.js
    end 
  end

  def save_attach
    plan = Plan.find(params[:id])
    @pwhich = plan.pwhiches.build(particular_params)
    byebug

    respond_to do |format|
      if @pwhich.save
        format.js 
      else
        format.js { render :action => "bad_save", status: :unprocessable_entity }
      end
    end
  end

  def edit
    format.js
  end

  def show
  end

  def create
    @pwhich = Pwhich.new(pwhich_params)

    respond_to do |format|
      if @pwhich.save
        @plan = @pwhich.made_plans.last
        format.html { redirect_to edit_plan_path(@plan), notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @pwhich }
      else
        format.html { redirect_to root_path, notice: "You fucked up. Try again." }
        format.json { render json: @pwhich.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pwhiches/1
  # PATCH/PUT /pwhiches/1.json
  def update
    respond_to do |format|
      if @pwhich.update(pwhich_params)
        format.html { redirect_to @pwhich, notice: 'pwhich was successfully updated.' }
        format.json { render :show, status: :ok, location: @pwhich }
      else
        format.html { render :edit }
        format.json { render json: @pwhich.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pwhiches/1
  # DELETE /pwhiches/1.json
  def destroy
    @id = @pwhich.id
    @pwhich.destroy
    respond_to do |format|
      format.js { render :action => "remove_pwhich" }
    end
  end

  private
    def set_pwhich
      @pwhich = Pwhich.find(params[:id])
    end

    def particular_params
      params.require(:particular).permit(:question, choices_attributes: [ :answer, :_destroy])
    end

    def pwhich_params
      params.require(:pwhich).permit(:question, choices_attributes: [ :answer, :_destroy ])
    end
end
