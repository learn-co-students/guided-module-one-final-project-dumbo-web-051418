class EZPass < ActiveRecord::Base
  has_many :transactions
  has_many :crossings, through: :transactions


  def debit(debit_amount)
    self.update(balance: (self.balance - debit_amount).round(2))
  end

  def credit(credit_amount)
    self.update(balance: (self.balance + credit_amount).round(2))
  end

  def attempt_debit(cost)
    self.balance >= cost
  end

  def get_structure_name
    self.transactions.map do |transaction|
      Crossing.find(transaction.crossing_id).structure.name
    end
  end

  def transaction_ledger
    ledger_hash = Hash.new
    self.transactions.each do |transaction|
      ledger_hash[transaction.id] = [transaction.crossing.structure.name, transaction.crossing.cost]
    end
    return ledger_hash
  end

end
