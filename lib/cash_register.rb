
class CashRegister
  
  attr_accessor :total, :discount, :quantity, :last_transaction
  @@all = Array.new

  def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items = {}
    @quantity = 0
    @@all << self
  end
  
  def self.all
    @@all
  end

  def add_item(item,price,quantity=1)
    @items[item] = [price,quantity]
    @last_transaction = quantity * price
    @total += @last_transaction
    @quantity = quantity
  end
  
  def apply_discount
    if @discount == 0 
      return "There is no discount to apply." 
      else
        @total = (@total.to_f * (1 -(@discount.to_f/100)))
        return "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  
  def items
  @items.collect do |k,v|
  v[1].times do puts k
  end
  end
  end
  
  def void_last_transaction
    @total -= @last_transaction
    @quantity.times do 
      @items.pop
    end
  end

end