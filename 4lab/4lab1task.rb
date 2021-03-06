class CashMachine

  def initialize
    if File.exist?("balance.txt")
      f = File.open("balance.txt")
      @balance = f.read.to_f
      f.close
    elsif File.exist?("balance.txt") == false
      File.open("balance.txt", "w") { File.write(100.00) }
    end
  end

  def deposit(sum)
    if sum <= 0
      puts 'Amount must be greater than 0.'
    else
      @balance = @balance + sum
      balance
    end
  end

  def withdraw(sum)
    if sum <= 0
      puts 'Amount must be greater than 0.'
    elsif sum > @balance
      puts 'Not enough money.'
    else
      @balance = @balance - sum
      balance
    end
  end

  def balance
    puts "Your balance: #{@balance}"
  end

  def quit
    f = File.open('balance.txt', 'w')
    f.write(@balance)
    f.close
  end

  def self.init

    cash_machine = CashMachine.new

    loop do
      puts "Menu:
        B - Balance
        D - Deposit
        W - Output
        Q - Quit"

      choose = gets.chomp

      case choose.downcase
      when 'b'
        cash_machine.balance

      when 'd'
        puts 'Input amount of deposit:'
        cash_machine.deposit(gets.to_f)

      when 'w'
        puts 'Input amount of withdraw:'
        cash_machine.withdraw(gets.to_f)

      when 'q'
        cash_machine.quit
        break
      else
        puts 'Wrong menu item.'
      end
    end
  end

end