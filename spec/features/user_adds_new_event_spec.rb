require 'spec_helper'

feature "User adds a new event", %Q{
As a user 
I want to add a event
So that others can avoid it

} do 
let(:user) {FactoryGirl.create(:user)}
  
  scenario 'user adds a valid event' do
    sign_in_as(user)
    visit new_event_path
    fill_in 'Title', with: "Farmers Market" 
    fill_in 'Severity', with: 3
    fill_in 'Description', with: "The Kale isn't worth it!"
    click_on "Create Event"

    new_event = Event.last
    expect(page).to have_content("Farmers Market")
    expect(new_event.title).to include("Farmers Market")
    
  end

  scenario 'user adds a non-valid event' do 
    prev_count = Event.count
    sign_in_as(user)
    visit new_event_path
    click_on "Create Event"

    expect(Event.count).to eql(prev_count)
    expect(page).to have_content("can't be blank")
  end


  scenario 'user cannot add a event when signed out' do
      visit new_event_path
      expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
