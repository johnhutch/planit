require 'rails_helper'

RSpec.feature "Plans", type: :feature do
  pending "adds questions to the first particular  #{__FILE__}"

  it "loads the welcome page nicely" do
    visit root_path
    expect(page).to have_content("plan")
  end
end
