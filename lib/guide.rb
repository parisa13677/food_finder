require "restaurant"

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
			puts "Listing..."
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

	def introduction
		puts "\n\n<<< welcome to the Food Finder >>>\n\n"
		puts " this is an interactive guide to help you find the food you crave.\n\n"

		
	end

	def conclusion
		puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
		
	end

end	