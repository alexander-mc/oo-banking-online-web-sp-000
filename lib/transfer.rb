class Transfer
  
  attr_accessor :status, :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if self.valid?
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
  end
  
  def reverse_transfer
    
  end
  
end
