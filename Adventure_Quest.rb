#These are my global program variables that are used
#within and without of defined functions

@health = 100
@inventory = {:Sword => 5,:Helm => 3}
@attack_v = @inventory[:Sword] + @inventory[:Helm]
@coin = 2500
@user_name
@a = 0
@b = 0
@c = 0
@d = 0
@e = 0
#This is an introduction function for new players
def intro
	puts "Hello Quester, what is your name?"
	@user_name = gets.chomp
	puts "Welcome " + @user_name.to_s 
	puts "You have " + @coin.to_s + " coins."
end

intro()

#class definitions
#a class makes it so several attributes can be 
#associated with the same 'class'
#in this case if I made a new Customer_Items class
#@Herb = Customer_Items.new("Herb", 50)
#this would make an item call @Herb, as the name
#and the amount of Herbs there are available
#the name can be called with @Herb.customer_item
#and the amount can be called with @Herb.customer_amount

class Customer_Items
	attr_accessor :customer_item, :customer_amount
	def initialize(customer_item, customer_amount)
		@customer_item = customer_item
		@customer_amount = customer_amount
	end
end

#class definitions
class Store
 attr_accessor :item, :store_amount, :price
 def initialize(item, store_amount, price)
   @item = item
   @store_amount = store_amount
   @price = price
 end
end

#These are actual definitions that use the class to 
#define items that are in the Store's inventory

#_s is for the store!!
@health_pack_store = Store.new("Health Pack", 500, 75)
@sword_store = Store.new("Sword + 5", 35, 500)

#This uses the item name in the Store inventory
# e.g. @health_pack_store.item as the 
#customer's item and the customer's amount 
#of that item
#initially is 0, the amount can be changed 
#when an item is bought or sold
#
#technically there should never be more than 
#the original amount of items in the store
#_c is for customer!!!
@health_pack_customer = Customer_Items.new(@health_pack_store.item, 0)
@sword_customer = Customer_Items.new(@sword_store.item, 0)

def store_inventory
	puts "---------------------------"
	puts "Our store inventory:"
	puts "Number of " + @health_pack_store.item + "(s)" 
	puts @health_pack_store.store_amount
	puts "Price : $" + @health_pack_store.price.to_s
	puts "Number of " + @sword_store.item + "(s)" 
	puts @sword_store.store_amount
	puts "Price : $" + @sword_store.price.to_s
	menu
end

def buy_an_item
	puts "Choose the number of the item you would like to buy.?"
	puts "Coins: " + @coin.to_s	
	puts "---------------------------"
	puts "Our store inventory:"
	puts "1 -- Number of " + @health_pack_store.item + "(s)" 
	puts @health_pack_store.store_amount
	puts "Price : $" + @health_pack_store.price.to_s
	puts "2 -- Number of " + @sword_store.item + "(s)" 
	puts @sword_store.store_amount
	puts "Price : $" + @sword_store.price.to_s
	choice = gets.to_i
  case choice
  when 1
  @a = 1
  puts "How many Health Pack would you like to buy at $" + @health_pack_store.price.to_s + "?"
#p_1 is a local variable just for this function
#It is used to grab an amount from the user
    p_1 = gets.to_i
#This checks to see if the amount requested to buy
#is more than the available amount    
    if p_1 > @health_pack_store.store_amount
    	puts	"Our appologies, we don't have that many Health Pack, please choose a different amount."
    	puts "---------------------------"
    	buy_an_item
#This checks to see if the amount times the price
#is more than the amount of money the user has    	
    elsif (p_1*@health_pack_store.price) > @coin
    	puts "Im sorry, you don't have enough money for "+ p_1.to_s + " Health Pack."
    	puts "The total cost is $" + (p_1*@health_pack_store.price).to_s
    	menu
    elsif
#If there are enough items available and
#the user has enough money this script is run
#1)It reduces the number of items from the "Store"
#which is actually just the class created with the 
#appropriate attributes
#2)It add the packs to the user
#3)  It creates a class for the item and the item 
#amount for the user, not the store
    @health_pack_store.store_amount = @health_pack_store.store_amount - p_1
		@health_pack_customer.customer_amount = @health_pack_customer.customer_amount + p_1
    @coin = @coin - (p_1*@health_pack_store.price)
    puts "You bought " + p_1.to_s + " pen(s)"
	  puts "Your remaining balance: " + @coin.to_s
  	menu
  	end
  when 2
  	@b = 1
    puts "How many Sword + 5 would you like to buy at $" + @sword_store.price.to_s + "?"
    p_2 = gets.to_i

    if p_2 > @sword_store.store_amount
	    puts	"Our appologies, we don't have that many Sword + 5, please choose a different amount."
	    puts "---------------------------"
	    buy_an_item
	  elsif (p_2*@sword_store.price) > @coin
    	puts "Im sorry, you don't have enough money for " + p_2.to_s + " Sword + 5."
    	puts "The total cost is $" + (p_2*@sword_store.price).to_s
    	menu 
    elsif
	    @sword_store.store_amount = @sword_store.store_amount - p_2
	    @coin = @coin - (p_2*@sword_store.price)

	    puts "You bought " + p_2.to_s + " Sword + 5"
	    puts "Your remaining balance: " + @coin.to_s
  		menu
  	end
  else
    puts "Invalid Choice Try again"
    buy_an_item
  end
end

def view_your_items
	puts "Your Basket"
	puts "---------------------------"
	if @a > 0
	puts "The amount of " + @health_pack_customer.customer_item + "(s)"
	puts @health_pack_customer.customer_amount 

	else
	end
	if @b > 0
	puts "The amount of " + @sword_customer.customer_item + "(s)"
	puts @sword_customer.customer_amount 

	else
	end
	if @c > 0
	puts "The amount of " + @notepad_item.customer_item + "(s)"
	puts @notepad_item.customer_amount 

	else
	end
	if @d > 0
	puts "The amount of " + @ledger_item.customer_item + "(s)"
	puts @ledger_item.customer_amount 

	else
	end
	if @a == 0 && @b == 0 && @c == 0 && @d == 0
		puts "---------------------------"
		puts "Your Pack is empty." 
		puts "---------------------------"
	else
	end
	menu
end

def sell_your_items
	if @a > 0
		puts "---------------------------"
		puts "The number of Health Pack you have : " + @health_pack_customer.customer_amount.to_s
		puts "How many Health Pack would you like to sell for half of inital cost?"
		sell_pens = gets.to_i
		@health_pack_customer.customer_amount = (@health_pack_customer.customer_amount.to_i - sell_pens.to_i)
		puts "You now have " + @health_pack_customer.customer_amount.to_s + " Health Pack."
		money_made = (@health_pack_store.price.to_f * 0.5 *sell_pens.to_f)
		puts "You made $" + money_made.to_s + ".  This will be added to your wallet."   
		@coin = @coin + money_made
		puts "---------------------------"
	end
	if @b > 0
		puts "---------------------------"
		puts "The number of Sword + 5 you have : " + @sword_customer.customer_amount.to_s
		puts "How many penils would you like to sell for half of inital cost?"
		sell_pencils = gets.to_i
		@sword_customer.customer_amount = (@sword_customer.customer_amount.to_i - sell_pencils.to_i)
		puts "You now have " + @sword_customer.customer_amount.to_s + " Sword + 5."
		money_made = (@sword_store.price.to_f * 0.5 *sell_pencils.to_f)
		puts "You made $" + money_made.to_s + ".  This will be added to your wallet."   
		@coin = @coin + money_made
		puts "---------------------------"
	end
	if @c > 0
		puts "---------------------------"
		puts "The number of notepads you have : " + @notepad_item.customer_amount.to_s
		puts "How many notepads would you like to sell for half of inital cost?"
		sell_notepads = gets.to_i
		@notepad_item.customer_amount = (@notepad_item.customer_amount.to_i - sell_notepads.to_i)
		puts "You now have " + @notepad_item.customer_amount.to_s + " notepads."
		money_made = (@notepaded.price.to_f * 0.5 *sell_notepads.to_f)
		puts "You made $" + money_made.to_s + ".  This will be added to your wallet."   
		@coin = @coin + money_made
		puts "---------------------------"
	end
	if @d > 0
		puts "---------------------------"
		puts "The number of ledgers you have : " + @ledger_item.customer_amount.to_s
		puts "How many ledgers would you like to sell for half of inital cost?"
		sell_ledgers = gets.to_i
		@ledger_item.customer_amount = (@ledger_item.customer_amount.to_i - sell_ledgers.to_i)
		puts "You now have " + @ledger_item.customer_amount.to_s + " ledgers."
		money_made = (@ledgered.price.to_f * 0.5 *sell_ledgers.to_f)
		puts "You made $" + money_made.to_s + ".  This will be added to your wallet."   
		@coin = @coin + money_made
		puts "---------------------------"
	end
	if @a == 0 && @b == 0 && @c == 0 && @d == 0 
		puts "You have no items to sell."
		menu
	end
	menu
end

def user_selection
  choice = gets.to_i
  case choice
  when 1
    store_inventory
  when 2
    buy_an_item
  when 3
    view_your_items
  when 4
    sell_your_items
  when 5
  	puts "Goodbye"
  	path()
  else
    puts "Invalid Choice Try again"
    menu
  end
end

def menu
	if @e == 0
		#first time at the store here
	end
	puts "---------------------------"
	puts "What would you like to do?"
	puts "1 -- See our Inventory."
	puts "2 -- Buy an item."	
	puts "3 -- View your items."
	puts "4 -- Sell an item."
	puts "5 -- Exit"
	puts "---------------------------"
	user_selection
end

def Sword_Upgrade
	puts "Small Sword Upgrade -- press 1.\n"
	puts "Gamble on a double upgrade -- press 2.\n"
	puts "-----------"
 	choice = gets.chomp.to_i
 	if choice == 1
 	@inventory[:Sword] = @inventory[:Sword] + 1
 	puts "New Sword Level: "+ @inventory[:Sword].to_s
 	puts "-----------"
 	else choice == 2
 		gamble = rand(5)
 		gamble = gamble.to_i
 		if gamble > 3
			puts "-----------" 			
 			puts "Woot Double upgrade!"
			puts "-----------" 			
 	@inventory[:Sword] = @inventory[:Sword] + 2
 		else gamble <= 3
 			puts "-----------"
 			puts "No upgrade, not lucky..."
 			puts "-----------"
 		end
 	end
	@attack_v = @inventory[:Sword] + @inventory[:Helm]
end

def Helm_Upgrade
	puts "Small Helm Upgrade -- press 1.\n"
	puts "Gamble on a double upgrade -- press 2.\n"
	puts "-----------"
 	choice = gets.chomp.to_i
 	if choice == 1
 	@inventory[:Helm] = @inventory[:Helm] + 1
 	puts @inventory[:Helm]
 	puts "New Helm Level: "+ @inventory[:Helm].to_s
 	puts "-----------"

 	else choice == 2
 		gamble = rand(5)
 		gamble = gamble.to_i
 		if gamble > 3
			puts "-----------" 			
 			puts "Woot Double upgrade!"
 			puts "-----------"
 	@inventory[:Helm] = @inventory[:Helm] + 2
 		else gamble <= 3
 			puts "-----------"
 			puts "No upgrade, not lucky..."
 			puts "-----------"
 		end
 	end
	@attack_v = @inventory[:Sword] + @inventory[:Helm]
end

def coin_Upgrade
	choice = rand(100) + 1
	@coin = @coin + choice.to_i
	puts "Found #{choice} coins."
end

def treasure_1
	#rand goes from 0 to 2, three total options
	choice = rand(3)
	choice = choice.to_i
	if choice == 0
	Sword_Upgrade()
	elsif choice == 1
	Helm_Upgrade()
	else choice == 2
	coin_Upgrade()
	end
end

def treasure_2
	#rand goes from 0 to 2, three total options
	choice = rand(3)
	choice = choice.to_i
	if choice == 0
	Sword_Upgrade()
	Helm_Upgrade()
	elsif choice == 1
	Helm_Upgrade()
	coin_Upgrade()
	else choice == 2
	Sword_Upgrade()
	coin_Upgrade()
	end
end

def treasure_3
	Sword_Upgrade()
	Helm_Upgrade()
	coin_Upgrade()
end

def goblin_large
	puts "You encounter a large goblin..."
	puts "******************************"
	puts "******************************"
	puts "        _____"
	puts "    .-,;='';_),-."
	puts "       _(),()/_/"
	puts "       (,___,)"
	puts "      ,-/`~` )-,___"
	puts "     / /).:.('--._)"
	puts "    {_[ (_,_)"
	puts "        | Y |"
	puts "       /  |  |	"
	puts "       """ """"""

	@monster_health = 45
	@monster_attack = 7
	puts "Your Health: " + @health.to_s
	puts "Large Goblin Health: " + @monster_health.to_s
	puts "1 to Fight\n 2 to Run"
	choice = gets.chomp.to_i
	if choice == 1
		attack_process()
	else choice == 2
		path()
	end
end

def path
	puts "      *       *     *        *        *  "
	puts "* left *      *     *       *  right *   "
	puts " *      *     *     *      *        *    "
	puts "  *      *    *     *     *        *     "
	puts "   *      *   *     *    *        *      "
	puts "    *      *  *     *   *        *       "
	puts "     *      * *     *  *        *        "					
	puts "Your Health: " + @health.to_s
	puts "Coins: " + @coin.to_s
	puts "Which direction do you go?\n1--left\n2--right\n3--straight\n4--Use Health Pack"
	path = gets.chomp.to_i

  case path
  when 1
    puts "You went left."
		goblin_large()
  when 2
    puts "You went right"
		path()
  when 3
    puts "You Went straight"
		path()
  when 4

    if @health_pack_customer.customer_amount > 0
		@health_pack_customer.customer_amount = @health_pack_customer.customer_amount - 1
		@health = 100
		path()
		else
		puts "*******************************" 
		puts "You don't have any Health Packs"
		puts "*******************************"
		path()
		end
  when 5
  	puts "Goodbye"
  	path()
  	
  else
    puts "Invalid Choice Try again"
    path()
  end
end

def attack_process
	while @health > 0
		if @monster_health <= 0
		treasure_3()
		menu
		end
	puts "1) Attack\n2) Run\n"
	choice = gets.chomp.to_i
	if choice == 1
		puts "Attacking"
		@health = @health - @monster_attack
		@monster_health = @monster_health - @attack_v
		puts "Your Health: " + @health.to_s 
		puts "Enemy Health: " + @monster_health.to_s
	else choice == 2
		puts "Running back to path."
		path()
	end
	end
	puts "You have died!  Game Over!!"
	exit
end

puts "Your attack is: " + @attack_v.to_s
puts "Your total coins:" + @coin.to_s
path()