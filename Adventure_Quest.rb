#These are my global program variables that are used
#within and without of defined functions
@health = 100
@Max_Health = 100
@inventory = {:Sword => 5,:Helm => 3,:Breast_Plate => 0}
@attack_v = @inventory[:Sword] + @inventory[:Helm] + @inventory[:Breast_Plate]
@coin = 2500
@user_name


#These are associated with empty store variables.  If all of them 
#are equal to zero no items are in the players bag.
#I need to associate these variables with specific 
#store and customer values.  
@a = 0
@b = 0
@c = 0
@d = 0
@e = 0



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
 attr_accessor :store_item, :store_amount, :store_price
 def initialize(store_item, store_amount, store_price)
   @store_item = store_item
   @store_amount = store_amount
   @store_price = store_price
 end
end

#These are actual definitions that use the class to 
#define items that are in the Store's inventory

#store_item store_amount store_price
@herb_store = Store.new("Herb", 500, 75)
@floret_store = Store.new("Floret", 35, 500)

#this item is instantly used so it is never in the 
#bag of the player.  No customer item or customer amount
@item_upgrade_store = Store.new("Upgrade Random Item", 100, 150)

def store_inventory_values
@herb_store.store_amount
@floret_store.store_amount
@item_upgrade_store.store_amount
end
#This uses the item name in the Store inventory
# e.g. @herb_store.item as the customer's item and the customer's 
#amount of that item initially is 0, the amount can be changed 
#when an item is bought or sold


#customer_item #customer.amount
@herb_customer = Customer_Items.new(@herb_store.store_item, 0)
@floret_customer = Customer_Items.new(@floret_store.store_item, 0)

def customer_inventory_values
@herb_customer.customer_amount
@floret_customer.customer_amount
end



def attack_value_refresh
@attack_v = @inventory[:Sword] + @inventory[:Helm] + @inventory[:Breast_Plate]
end




#This is an introduction function for new players
def intro
	puts "1--Load File"
	puts "2--New Game"
	choice = gets.chomp.to_i
	case choice 
	when 1
		load()
	when 2
	puts "Hello Quester, what is your name?"
	@user_name = gets.chomp
	puts "Welcome " + @user_name.to_s 
	puts "You have " + @coin.to_s + " coins."
	end
end

def buy_an_item
	puts "Choose the number of the item you would like to buy.?"
	puts "Coins: " + @coin.to_s	
	puts "---------------------------"
	puts "Our store inventory:"
	puts "1 -- Number for " + @herb_store.store_item + "(s)" 
	puts "Amount :" + @herb_store.store_amount.to_s
	puts "Price : $" + @herb_store.store_price.to_s
	puts "2 -- Number for " + @floret_store.store_item + "(s)" 
	puts "Amount :" + @floret_store.store_amount.to_s
	puts "Price : $" + @floret_store.store_price.to_s
  puts "3 -- Number for " + @item_upgrade_store.store_item
	puts "Amount :" + @item_upgrade_store.store_amount.to_s
	puts "Price : $" + @item_upgrade_store.store_price.to_s

	choice = gets.to_i
  case choice
  when 1
  @a = 1
  puts "How many Herb would you like to buy at $" + @herb_store.store_price.to_s + "?"
#p_1 is a local variable just for this function
#It is used to grab an amount from the user
    p_1 = gets.to_i
#This checks to see if the amount requested to buy
#is more than the available amount    
    if p_1 > @herb_store.store_amount
    	puts	"Our appologies, we don't have that many Herb, please choose a different amount."
    	puts "---------------------------"
    	buy_an_item
#This checks to see if the amount times the price
#is more than the amount of money the user has    	
    elsif (p_1*@herb_store.store_price) > @coin
    	puts "Im sorry, you don't have enough money for "+ p_1.to_s + " Herb."
    	puts "The total cost is $" + (p_1*@herb_store.store_price).to_s
    	store_menu
    elsif
#If there are enough items available and
#the user has enough money this script is run
#1)It reduces the number of items from the "Store"
#which is actually just the class created with the 
#appropriate attributes
#2)It add the packs to the user
#3)  It creates a class for the item and the item 
#amount for the user, not the store
    @herb_store.store_amount = @herb_store.store_amount - p_1
		@herb_customer.customer_amount = @herb_customer.customer_amount + p_1
    @coin = @coin - (p_1*@herb_store.store_price)
    puts "You bought " + p_1.to_s + " pen(s)"
	  puts "Your remaining balance: " + @coin.to_s
  	store_menu
  	end
  when 2
  	@b = 1
    puts "How many florets would you like to buy at $" + @floret_store.store_price.to_s + "?"
    p_2 = gets.to_i
    if p_2 > @floret_store.store_amount
	    puts	"Our appologies, we don't have that many florets, please choose a different amount."
	    puts "---------------------------"
	    buy_an_item
	  elsif (p_2*@floret_store.store_price) > @coin
    	puts "Im sorry, you don't have enough money for " + p_2.to_s + " florets"
    	puts "The total cost is $" + (p_2*@floret_store.store_price).to_s
    	store_menu 
    elsif
	    @floret_store.store_amount = @floret_store.store_amount - p_2
	    @floret_customer.customer_amount = @floret_customer.customer_amount + p_2
	    @coin = @coin - (p_2*@floret_store.store_price)
	    puts "You bought " + p_2.to_s + " florets"
	    puts "Your remaining balance: " + @coin.to_s
  		store_menu
  	end
  when 3
  	@c = 1
    p_3 = 1
    if p_3 > @item_upgrade_store.store_amount
	    puts	"Our appologies, we don't have that many item upgrades, please choose a different amount."
	    puts "---------------------------"
	    buy_an_item
	  elsif (p_3*@item_upgrade_store.store_price) > @coin
    	puts "Im sorry, you don't have enough money for an item upgrade."
    	puts "The total cost is $" + (p_3*@item_upgrade_store.store_price).to_s
    	store_menu 
    elsif
	    @item_upgrade_store.store_amount = @item_upgrade_store.store_amount - p_3
			option = rand(3)

			case option 
			when 0
			@inventory[:Sword] = @inventory[:Sword] +1
			puts "Sword + 1"
			when 1
			@inventory[:Helm] = @inventory[:Helm] + 1
			puts "Helm + 1"
			when 2
			@inventory[:Breast_Plate] = @inventory[:Breast_Plate] + 1
			puts "Breast Plate + 1"
			end

	    @coin = @coin - (p_3*@item_upgrade_store.store_price)
	    puts "You bought an item upgrade."
	    puts "Your remaining balance: " + @coin.to_s
  		store_menu
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
		puts "The amount of " + @herb_customer.customer_item + "(s)"
		puts @herb_customer.customer_amount 
		else
		end
		if @b > 0
		puts "The amount of " + @floret_customer.customer_item + "(s)"
		puts @floret_customer.customer_amount 
		else
		end
		#these are actually dependent on the store values which 
		#fluctuate normally.  They need to be dependent on 
		#customer values...
		#The more I think about it I can just make them the actual 
		#variables.  No need to have an extra variable in between...
		if @a == 0 && @b == 0
			puts "---------------------------"
			puts "Your Pack is empty." 
			puts "---------------------------"
		else
		end
		store_menu
end

def sell_your_items
	if @a > 0
		puts "---------------------------"
		puts "The number of Herb you have : " + @herb_customer.customer_amount.to_s
		puts "How many Herb would you like to sell for half of inital cost?"
		sell_health_packs = gets.to_i
		@herb_customer.customer_amount = (@herb_customer.customer_amount.to_i - sell_health_packs.to_i)
		puts "You now have " + @herb_customer.customer_amount.to_s + " Herb."
		money_made = (@herb_store.store_price.to_f * 0.5 *sell_health_packs.to_f)
		puts "You made $" + money_made.to_s + ".  This will be added to your wallet."   
		@coin = @coin + money_made
		puts "---------------------------"
	end

	if @b > 0
		puts "---------------------------"
		puts "The number of ________ + 5 you have : " + @floret_customer.customer_amount.to_s
		puts "How many ________ would you like to sell for half of inital cost?"
		sell_sword_5 = gets.to_i
		@floret_customer.customer_amount = (@floret_customer.customer_amount.to_i - sell_sword_5.to_i)
		puts "You now have " + @floret_customer.customer_amount.to_s + " Sword + 5."
		money_made = (@floret_store.store_price.to_f * 0.5 *sell_sword_5.to_f)
		puts "You made $" + money_made.to_s + ".  This will be added to your wallet."   
		@coin = @coin + money_made
		puts "---------------------------"
	end

	if @a == 0 && @b == 0
		puts "You have no items to sell."
		store_menu
	end
	store_menu
end

def user_selection
  choice = gets.to_i
  case choice
  when 1
    buy_an_item
  when 2
    view_your_items
  when 3
    sell_your_items
  when 4
  	puts "Goodbye"
  	path()
  else
    puts "Invalid Choice Try again"
    store_menu
  end
end

def store_menu
	if @e == 0
		#first time at the store here
	end
	puts "---------------------------"
	puts "What would you like to do?"
	puts "1 -- Buy an item."	
	puts "2 -- View your items."
	puts "3 -- Sell an item."
	puts "4 -- Exit"
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
	attack_value_refresh()
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
	attack_value_refresh()
end

def Breast_Plate_Upgrade
	puts "Breast Plate Upgrade + 2!!\n"
 	@inventory[:Breast_Plate] = @inventory[:Breast_Plate] + 2
	attack_value_refresh()
end

def Coin_Upgrade
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
	Coin_Upgrade()
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
	Coin_Upgrade()
	else choice == 2
	Sword_Upgrade()
	Coin_Upgrade()
	end
end

def treasure_3
	Sword_Upgrade()
	Helm_Upgrade()
	Coin_Upgrade()
end

def treasure_4
	Sword_Upgrade()
	Helm_Upgrade()
	Breast_Plate_Upgrade()
	Coin_Upgrade()
end
########################################
#MONSTER AREA
########################################
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

def monster_large
	puts "You encounter a large monster..."
	puts "******************************"
	puts "******************************"
  puts "  |     _____"
  puts "  |   -./ .-'"
  puts "     _  _("
  puts "   | .)(./"
  puts "   |    ("
  puts "   |     |   |"
  puts "   |   vvv   |"
  puts "   |  |__    |"
  puts "  /      `-. |"

	@monster_health = 100
	@monster_attack = 1
	puts "Your Health: " + @health.to_s
	puts "Monster Health: " + @monster_health.to_s
	puts "1 to Fight\n 2 to Run"
	choice = gets.chomp.to_i
	if choice == 1
		attack_process()
	else choice == 2
		path()
	end
end

########################################
#END OF MONSTER AREA
########################################

########################################
#ATTACK AREA
########################################
def attack_process
	while @health > 0
		if @monster_health <= 0
		treasure_4()
		path()
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
########################################
#END OF ATTACK AREA
########################################

def save
puts "Which file would you like to save to? save.txt?"
file_name = $stdin.gets.chomp
txt_save = open(file_name, 'w')

#Order of saved items
#@user_name
#@coin 
#@health 
#@Max_Health
#@inventory[:Sword]
#@inventory[:Helm]
#@inventory[:Breast_Plate]
#3-Store-items
#2-Customer-items

txt_save.write(@user_name)
txt_save.write("\n")
txt_save.write(@coin)
txt_save.write("\n")
txt_save.write(@health)
txt_save.write("\n")
txt_save.write(@Max_Health)
txt_save.write("\n")
txt_save.write(@inventory[:Sword])
txt_save.write("\n")
txt_save.write(@inventory[:Helm])
txt_save.write("\n")
txt_save.write(@inventory[:Breast_Plate])
txt_save.write("\n")
txt_save.write(@herb_store.store_amount)
txt_save.write("\n")
txt_save.write(@floret_store.store_amount)
txt_save.write("\n")
txt_save.write(@item_upgrade_store.store_amount)
txt_save.write("\n")
txt_save.write(@herb_customer.customer_amount)
txt_save.write("\n")
txt_save.write(@floret_customer.customer_amount)
txt_save.write("\n")
txt_save.write(@a)
txt_save.write("\n")
txt_save.write(@b)
txt_save.write("\n")
txt_save.write(@c)
txt_save.write("\n")
txt_save.write(@d)
txt_save.write("\n")
txt_save.write(@e)

#it is import to close files after they are opened
txt_save.close()
end

def load 

@user_name = IO.readlines("save.txt")[0].chomp.to_s
@coin  = IO.readlines("save.txt")[1].chomp.to_i
@health  = IO.readlines("save.txt")[2].chomp.to_i
@Max_Health = IO.readlines("save.txt")[3].chomp.to_i
@inventory[:Sword] = IO.readlines("save.txt")[4].chomp.to_i
@inventory[:Helm] = IO.readlines("save.txt")[5].chomp.to_i
@inventory[:Breast_Plate] = IO.readlines("save.txt")[6].chomp.to_i
@herb_store.store_amount = IO.readlines("save.txt")[7].chomp.to_i
@floret_store.store_amount = IO.readlines("save.txt")[8].chomp.to_i
@item_upgrade_store.store_amount = IO.readlines("save.txt")[9].chomp.to_i
@herb_customer.customer_amount = IO.readlines("save.txt")[10].chomp.to_i
@floret_customer.customer_amount = IO.readlines("save.txt")[11].chomp.to_i
@a = IO.readlines("save.txt")[12].chomp.to_i
@b = IO.readlines("save.txt")[13].chomp.to_i
@c = IO.readlines("save.txt")[14].chomp.to_i
@d = IO.readlines("save.txt")[15].chomp.to_i
@e = IO.readlines("save.txt")[16].chomp.to_i

attack_value_refresh()
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
	puts @inventory
	puts "Your Attack Value: "+ @attack_v.to_s
	puts "Which direction do you go " + @user_name.to_s 
	puts "1--left\n2--right\n3--straight\n4--Store\n5--Use Herb\n6--Save Game\n7--Exit Game"
	path_choice = gets.chomp.to_i

  case path_choice
  when 1
    puts "You went left."
		goblin_large()
  when 2
    puts "You went right"
		monster_large()
  when 3
    puts "You Went straight"
		path()
  when 4
  	store_menu()

  when 5

    if @herb_customer.customer_amount > 0
		@herb_customer.customer_amount = @herb_customer.customer_amount - 1
		@health = 100
		path()
		else
		puts "*******************************" 
		puts "You don't have any Herbs"
		puts "*******************************"
		path()
		end
  when 5
  	puts "Goodbye"
  	path()
  when 6
  	puts "Saving"
  	save()
  	path()
  when 7
  	exit
  	
  else
    puts "Invalid Choice Try again"
    path()
  end
end

intro()
path()