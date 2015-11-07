class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def show
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { redirect_to root_path, notice: "You fucked up. Try again." }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Mails out a list of plans for the person.
  # This is called from the reminder email form on the front page.
  def reminder
    respond_to do |format|
      if params[:reminder][:email].blank?
        @notice = "You did not enter an email address."
        format.js
      else
        email = params[:reminder][:email]
        PlanMailer.all_plans(email).deliver_now # @TODO replace this with user model
        @notice = "Plans have been sent to #{email}"
        format.js
      end
    end
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:email)
    end
end
