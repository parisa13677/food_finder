class Restaurant

	@@filepath = nil

	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
		
	end

	def self.file_exists?
		# class shoul know if the restaurant file exists
		
	end

	def self.create_file
		# create the restaurant file
		
	end

	def self.saved_restaurant
		# read the restaurant file
		# return instances of restaurant 
		
	end

end
