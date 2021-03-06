class Dragon

	def initialize
		system "clear"
		puts "---WELCOME TO THE DRAGON SIMULATOR---"
		puts
		puts "Firstly, what would you like to call your dragon?"
		@name = gets.chomp
		@asleep = false
		@stuff_in_belly 	= 10 	# he's full
		@stuff_in_intestine	= 0 	# he doesn't need to go
		puts
		puts "#{@name} is born..."
		puts
		# set up loop for game
		while @option != 'q'
			sleep 1
			puts "What would you like to do with #{@name}?"
			puts
			puts "OPTIONS: Feed #{@name} (enter 'F'); Walk('W')"
			puts "Put to bed('B'); Toss in the air('T')"
			puts "Rock to help sleep('R'); Quit program('Q')"
			puts
		
			@option = gets.chomp.downcase

			sleep 0.5
			
			case @option

			when 'f'
				feed
			
			when 'w'
				walk

			when 'b'
				put_to_bed
			
			when 't'
				toss

			when 'r'
				rock

			when 'q'
				puts "Thanks for playing. Goodbye!"
				exit
			end
			sleep 2
			puts "-----------------------------"
			puts
			puts
		end
	end

	def feed
		puts "You feed #{@name}..."
		@stuff_in_belly = 10
		passage_of_time
	end

	def walk
		puts "You walk #{@name}"
		@stuff_in_intestine = 0
		passage_of_time
	end

	def put_to_bed
		puts "You put #{@name} to bed..."
		@asleep = true
			
		3.times do
			if @asleep
				passage_of_time
			end
			if @asleep
				puts "#{@name} snores filling the room with smoke..."
			end
			if @asleep
				@asleep = false
				puts "#{@name} wakes up slowly..."
			end
		end
	end

	def toss
		puts "You toss #{@name} up into the air..."
		puts "He giggles, which singes your eyebrows..."
		passage_of_time
	end

	def rock
		puts "You rock #{@name} gently..."
		@asleep = true
		puts "He briefly dozes off..."
		passage_of_time
		if @asleep
			@asleep = false
			puts "...but wakes when you stop..."
		end
	end

	private
	# "private" means that the methods defined here are
	# method internal to the object. (You can feed your 
	# drgon, but you can't ask him whether he's hungry.)
	def hungry?
		# Method name can in with "?"
		# Usually, we do this only if the method
		# returns true or false, like this:
		@stuff_in_belly <= 2
	end 

	def poopy?
		@stuff_in_intestine >= 8
	end

	def passage_of_time
		if @stuff_in_belly > 0
			#move food from belly to intestine
			@stuff_in_belly		= @stuff_in_belly - 1
			@stuff_in_intestine = @stuff_in_intestine + 1
		else # out drgon is starving
			puts "#{@name} is starving! In desperation, he ate you!"
			sleep 1
			puts "GAME OVER!"
			exit # this quits the program
		end

		if @stuff_in_intestine >=10 
			@stuff_in_intestine = 0
			puts "Whoops! #{@name} had an accident..."
		end

		if hungry?
			if @asleep
				@asleep = false
				puts "He wakes up suddenly"
			end
			puts "#{@name}'s stomach grumbles..."
		end

		if poopy?
			if @asleep 
				@asleep = false
				puts "He wakes up suddenly!"
			end
			puts "#{@name} does the potty dance..."
		end
	end
end
Dragon.new
