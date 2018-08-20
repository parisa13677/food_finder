require "restaurant"
require "support/string_extend"

class Guide

	class Config
		@@actions = ['list', 'find', 'add', 'quit']
		def self.actions; @@actions; end
			
	end


	def initialize(path=nil)

		# locate the resturant text file at path
		Restaurant.filepath = path
		# exit if creat fails
		# or creat a new file
		if Restaurant.file_usable?
			puts "Found resturant file."
		elsif Restaurant.create_file
			puts " Ctreated resturant file"
		else
			puts "Existing...\n\n"
			exit!
		end 	

	end

	def launch!
		 introduction
		# action loop
		result = nil
		until result == :quit
		# what do you want to do ? (list, find, add, quit)
		action = get_action
		result = do_action(action)
		end
		# repeat until user quits
		 conclusion
		
	end

	def get_action
		action = nil
		# keep asking for user input until we get a valid action
		until Guide::Config.actions.include?(action)
			puts "Actions:" + Guide:: Config.actions.join(",") if action
		    print "> "
		    user_response = gets.chomp
		    action = user_response.downcase.strip
		end
		return action
	end

	def do_action(action)
		case action
		when 'list'
			list
		when 'find'
			puts "Finding..."
		when 'add'
			add
		when 'quit'
			return :quit
		else
		    puts "\n I don t understand that command.\n"			
			
		end
		
	end

	def list
		output_action_header("Listing Restaurant")
		restaurant = Restaurant.saved_restaurant
		output_restaurant_table(restaurant)
	end

	def add
		output_action_header("Add a Restaurant")
		
		restaurant = Restaurant.build_using_questions
		
		if restaurant.save
			puts "\nRestaurant Added\n\n"
		else
		    puts "\nSave Error: Restaurant not added\n\n"
		end    

		
	end

	def introduction
		puts "\n\n<<< welcome to the Food Finder >>>\n\n"
		puts " this is an interactive guide to help you find the food you crave.\n\n"

		
	end

	def conclusion
		puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
		
	end

	private

	def output_action_header(text)
		puts "\n#{text.upcase.center(60)}\n\n"
		
	end

	def output_restaurant_table(restaurants=[])
		print " " + "Name".ljust(30)
		print " " + "Cuisine".ljust(20)
		print " " + "Price".rjust(6) + "\n"
		puts  " " * 60
		restaurants.each do |rest|
			line = " " << rest.name.titleize.ljust(30)
			line << " " + rest.formated_price.rjust(6)
			puts line
		end
		puts "No listing found" if restaurants.empty?
		puts "-" * 60	
		
	end

end	