require "resturant"

class Guide


	def initialize(path=nil)

		# locate the resturant text file at path
		Resturant.filepath = path
		# exit if creat fails
		# or creat a new file
		if Resturant.file_exists?
			puts "Found resturant file."
		elsif Resturant.create_file
			puts " Ctreated resturant file"
		else
			puts "Existing...\n\n"
			exit!
		end 	

		
	end

	def launch!
		 introduction
		# action loop
		# what do you want to do ? (list, find, add, quit)
		# do that action
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