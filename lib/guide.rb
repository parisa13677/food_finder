require "restaurant"

class Guide


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
		print "> "
		user_response = gets.chomp
		# do that action
		result = do_action(user_response)

		end
		
		# repeat until user quits
		 conclusion
		
	end

	def introduction
		puts "\n\n<<< welcome to the Food Finder >>>\n\n"
		puts " this is an interactive guide to help you find the food you crave.\n\n"

		
	end

	def conclusion
		puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
		
	end

end	