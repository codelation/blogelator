require "spec_helper"

feature "User visits the blog" do
  
  scenario "They see the site name" do
    Blogelator::Config.site_name = "Brian's Blog"
    
    visit blogelator.root_path
    
    expect(page).to have_content "Brian's Blog"
  end
  
  scenario 'they see the foobar on the page' do
    visit new_foobar_path

    fill_in 'Name', with: 'My foobar'
    click_button 'Create Foobar'

    expect(page).to have_css '.foobar-name', 'My foobar'
  end
end