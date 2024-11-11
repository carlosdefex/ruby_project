class ExpensePage
  include Capybara::DSL

  def transactions_count
    all(:xpath, '//table[@id="transactionsTable"]/tbody/tr').count
  end

  def balance
    find(:xpath, '//div[@id="totalBalance"]/div[@class="balance-value"]/span[contains(text(),"350")]').text.tr('$', '')
  end

  def credit_available
    find(:xpath, '//div[@id="creditAvailable"]/div[@class="balance-value"]').text.tr('$', '')
  end

  def transaction_values
    all(:xpath, '//td[@class="text-right bolder nowrap"]')
  end
end