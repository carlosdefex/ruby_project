# login_spec.rb
require 'capybara/rspec'
require 'selenium-webdriver'
require 'pages/login_page'
require 'pages/expense_page'
require 'steps/login_step'

Capybara.default_driver = :selenium_chrome

RSpec.describe 'Login en la página de Applitools', type: :feature do
  before do
    @login_steps = LoginSteps.new
    @login_steps.login_with_valid_credentials
  end

  it 'permite iniciar sesión con credenciales válidas' do
    expect(current_url).to eq('https://demo.applitools.com/hackathonAppV2.html')

    expect(@login_steps.transactions_count).to eq(6)
    expect(@login_steps.balance).to eq("350")
    expect(@login_steps.credit_available).to eq("17,800")

    @login_steps.transaction_values.each do |value|
      span = value.find(:xpath, './/span')
      number = value.text
      if number.start_with?('+')
        expect(span[:class]).to include('text-success')
      elsif number.start_with?('-')
        expect(span[:class]).to include('text-danger')
      end
    end
  end
end
