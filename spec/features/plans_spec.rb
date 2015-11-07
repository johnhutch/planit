require 'rails_helper'

RSpec.feature "Plans", type: :feature do
  pending "adds questions to the first particular  #{__FILE__}"

  it "loads the welcome page nicely and probably says something about a plan on there somewhere" do
    visit root_path
    expect(page).to have_content("plan")
  end


  it "gives the user a form to create their initial plan with an email and question" do 
    visit root_path
    fill_in "person_email", with: "Joe Blow"
    click_button "submit"
    expect(page.status_code).to be(200)
  end
end
