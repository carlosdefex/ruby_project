class LoginPage
  include Capybara::DSL

  def visit_page
    visit 'https://demo.applitools.com/hackathonV2.html'
  end

  def fill_in_form_login(username, password)
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'log-in'
  end
end