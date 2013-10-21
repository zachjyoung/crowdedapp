require 'spec_helper'

feature 'view events list', %q{
  As a event non-goer
  I want to view a list of events
  So that I can stay the hell away
} do

  scenario 'lists events on a page' do
    events = FactoryGirl.create_list(:event, 5)

    visit '/events'

    events.each do |event|
      expect(page).to have_content(event.title)
    end
  end
end
