class LoginSteps
  include Capybara::DSL

  def initialize
    @login_page = LoginPage.new
    @expense_page = ExpensePage.new
  end

  def login_with_valid_credentials
    @login_page.visit_page
    @login_page.fill_in_form_login('testuser', 'testpassword')
  end

  def transactions_count
    @expense_page.transactions_count
  end

  def balance
    @expense_page.balance
  end

  def credit_available
    @expense_page.credit_available
  end

  def transaction_values
    @expense_page.transaction_values
  end
end
