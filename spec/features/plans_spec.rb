require 'rails_helper'

RSpec.feature "Plans", type: :feature do
  pending "adds questions to the first particular  #{__FILE__}"

  it "loads the welcome page nicely and probably says something about a plan on there somewhere" do
    visit root_path
    expect(page).to have_content("plan")
  end


  it "gives the user a form to create their initial plan with an email and question" do 
    visit root_path
    fill_in "person_email", with: "joe@blow.com"
    fill_in "person_made_plans_attributes_0_title", with: "Let's get food!"
    click_button I18n.t('button.add_people')
    expect(page).to have_content("Planning Let's get food!")
  end

  it "gives you an error message when you enter an improper email address" do 
    visit root_path
    fill_in "person_email", with: "qwer09ajsdfalskf"
    click_button I18n.t('button.add_people')
    expect(page).to have_content("fucked up")
  end
end
