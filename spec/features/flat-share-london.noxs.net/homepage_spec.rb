require 'spec_helper'

Capybara.feature 'homepage' do
  before(:all) do
    Capybara.current_driver = :webkit
  end

  scenario 'render homepage with 200' do
    visit 'http://flat-share-london.noxs.net/'

    expect(page.status_code).to eq(200)
  end

  scenario 'fill form and post' do
    visit 'http://flat-share-london.noxs.net/'

    # Firstnme
    find('#nf-field-11').set('Jean-Jacques')

    # Nationality
    find('#nf-field-24').set('French')

    # Email
    find('#nf-field-13').set('jjmoiroux@gmail.com')

    # Status
    find('#nf-field-25').set('worker')

    # Desired date move
    find('#nf-field-19').set('2118-01-31T00:00:00+00:00')

    # Message / Request
    find('#nf-field-21').set('test capybara webkit')

    # Button submit
    find('button[type="submit"]').click

    # END Result message
    expect(page).to has_content('Success!', wait: 5)
  end

  after(:all) do
    Capybara.use_default_driver
  end
end
