#console
puts "hello"

#operations
car = 12
passengers = 10
all = car + passengers
puts all

#confition if and else
if all < 10 
	puts "a few people!"
elsif all < 15 
	puts "elseif test"
else 
	puts "there are a lot people!"
end

#type of variable
num = 10.0
puts num.class

#array
#myarray = [1,"hello",2,2,3]
myarray = "1 hello 2 2 3".split(" ")
puts myarray
puts myarray.class
puts "count = #{myarray.count}" 
puts "hello times = #{myarray.count("hello")}"
count = 0
myarray.each do |num|
	count = count + 1
	puts "#{count} num = #{num}"
end


