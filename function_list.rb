intro -- called line 22
store_inventory-- called line 232
buy_an_item-- called line 234
view_your_items-- called line 236
sell_your_items-- called line 238
user_selection-- called line 228
store_menu -- called on several lines
Sword_Upgrade -- 
Helm_Upgrade
coin_Upgrade

I think for what this program is I have spent 
enough time on it.  Maybe I will make a better 
game in the future that will be click-able and 
playable on the web.  But I have learned a lot 
with the CLI.  

What I learned:

1) I have my definitely figured out a lot with 
definiting classes and organizing terms.

2) I have learnd how to easily make case statements

3) I have learned a lot about local and global 
variables 

4) Strings / basic math , updating and keeping track 
of variables stored

5) I am actually pretty impressed I figured out the 
save / load component.

6) The sequence of where to put scripts so things load 
properly

7) Functions to update values of variables when they 
change 

8) Geting input from the user, and using it.

9) Integrating other code, like the store program and 
refining it for the specific code needed.

10) Monsters and attack processs , (The attack process
can be thoroughly refined.  But where it is, is a start.)

11) Randomizing treasure /other values 

12) Changing values in a hash for the attack value.
Updating it and making it consistent.



Currently What To Program :


Currently --> I have a template for sell-able items and items 
that will be upgrade able. 
The Sword/Helm upgrades can be extrapolated for all other items
-->Can be bought at the store 
-->Can be aquired by monsters

The Health Packs can be extrapolated for all other health pack items 
-->Can be bought at the store 


1)
--Once you get up to a certain health pack level you probably do 
	not want to buy lower health packs 
2)
--Save/Load *EVERY* attribute of the game--Check!
-->Max Health / Upgrade-able Max Health 

3)
--ADD more monsters, make them random depending on which path
--Added another monster, made sure attributes were recognized...
--10 monsters should be more than enough, I have 2 now. 
4)
--ADD higher levels, harder monsters
5)
--ADD health upgrade to the store which increases Max Health 
6)
--Make the attack_process abstract so that monsters change
global variables for the same attack_process
7)
--Make every battle result in a PERCENT so the game can be 
"infinitely" scaleable
-------------------
	This involves uses hashes paired items for the characters inventory 
	And the character stats

	This involves using new classes for the breast plate and sword 
	
	This involve making the breast plate sell-able
	
	Make the helm buy-able and sell-able

	**Should I have items upgrade-able or just some buy and sell?**


	Also there is a problem with the attack process.  Technically
	There is a new attack process with every new kind of monster.
	I either need to make new attack processes for each new monster 
	Or I need to make global variables for the attack process which is 
	defined by the monster being fought.  I like the latter much better.



[Macro Goal]
*************
[First Macro Goal]
Reduce everything to percentages...  float with one decimal

The game can be written mathematically like the clicker games so that 
the more you play the "harder" the monsters are.


At the end of the day everything can be reduced to a percentage...
That is actually the main point of this.  The player sees large 
numbers getting bigger and bigger, but the computation for the 
computer more or less stays the same as the beginning of the game.

--------
[Second Macro Goal]
I like the idea of just having every item upgrade-able.  Other games 
have different items that you can buy and sell and whatever.  With 
this game, you can randomly upgrade any item.  
	(Which kind of make 
	any upgrade the same as any other.  But whatever you are always 
	advancing.  Nothing is based on a randomly generated item you need 
	to wait for. )

So if every item is upgrade-able, then the only item to buy and sell 
are the health packs.  Maybe there should be multiply health pack 
types.  Health can be upgraded and so can health packs.

--> Health Upgrades need to be the valuable part!!!
--> It needs to take a while to get a health upgrade...

At the very least this way I can make an open game that can grow 
easily mathematically.  More times you fight monsters, the more upgrades 
you get.  The more upgrades you get the harder the monsters can be.
The more health you can get.

There is no pleateau...

[Third Macro Goal]
Make comments about ever line of significant code.
Reduce all code into types of code 
(Which code was new, like the load/save, which was from the book?)
Make a program with just one of each type of code type.
*************

