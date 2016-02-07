class Account
    attr_reader :name, :balance
    def initialize(name, balance=100)
        @name = name
        @balance = balance
    end
    
    private
    def pin
        @pin = 1234
    end
    
    def pin_error
        return "Access denied: incorrect PIN."
    end
    
    public
    def display_balance(pin_number)
        puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
    end
    
    def withdraw(pin_number, amount)
        if pin_number == pin
            if amount <= @balance
                @balance -= amount
                puts "Withdrew $#{amount}. New balance: $#{@balance}."
            else
                puts "Amount exceeds balance."
            end
        else
            puts pin_error
        end
    end
    
    def deposit(amount)
        @balance += amount
        puts "Deposited $#{amount}. New balance: $#{@balance}."
    end
end

checking_account = Account.new("Haribo", 1000)
checking_account.withdraw(1234, 1500)
