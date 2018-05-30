class EZPass < ActiveRecord::Base
  has_many :transactions
  has_many :crossings, through: :transactions

  def debit(debit_amount)
    self.update(balance: (self.balance - debit_amount).round(2))
  end

  def credit(credit_amount)
    self.update(balance: (self.balance + credit_amount).round(2))
  end

end
