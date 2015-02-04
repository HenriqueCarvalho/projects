# Student: Henrique Carvalho
# Week 3

module Place
	class Dog
		attr_accessor :name, :breed

		def initialize(name, breed)
			@name = name
			@breed = breed
			@run = false
		end

		def run
			@run = true
		end

		def is_running?
			@run
		end
	end

	class Child
		attr_accessor :name, :age

		def initialize(name, age)
			@name = name
			@age = age
			@run = false
		end

		def run
			@run = true
		end

		def is_running?
			@run
		end
	end

	class Park
		attr_accessor :children, :dogs

		def initialize()
			@children = Array.new
			@dogs = Array.new
	    end

	    def add_dog(dog)
	    	dogs.push(dog)
	    end

	    def add_child(child)
	    	children.push(child)
	    end

		def all_dog
			dogs.each do |dog|
				puts "#{dog.name} is a #{dog.breed}." =
			end
		end

		def all_children
			children.each do |child|
				puts "#{child.name} is #{child.age} years old."
			end
		end

		def who_is_running
			dogs.each do |dog|
				puts dog.name if dog.is_running?
			end

			children.each do |child|
				puts child.name if child.is_running?
			end
		end
	end
end

dog = Place::Dog.new('Bread', 'alien')
boy = Place::Child.new('Johny', 10)
girl = Place::Child.new('Mary', 8)

puts dog.inspect
puts boy.inspect
puts girl.inspect

boy.run

place = Place::Park.new
place.add_dog(dog)
place.add_child(boy)
place.add_child(girl)

puts "methods:"
puts "All dog"
place.all_dog
puts "All children:"
place.all_children
puts "Who is running ?"
place.who_is_running