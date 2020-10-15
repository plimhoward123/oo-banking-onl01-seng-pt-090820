class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return (@sender.valid? && @receiver.valid?)
  end

  def execute_transaction
    if (self.valid? && @sender.balance > @amount)
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
   else
     @stats = "Transaction rejected. Please check your account balance."
   end
  end
end
