###
# Fork this gist.  Copy the code into a new file named `shoes.rb` in your
# `projects` directory.
#
# From the virtual machine, you can run it by typing
#     ruby shoes.rb
 
 
 
### This just makes the tests run.  Nothing for you to do here.
require 'minitest'
require 'minitest/reporters'
MiniTest.autorun
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
 
 
 
 
###
# Here is the test suite.  It shows you what result we expect from each method
# call.
#
# Each test is being skipped right now. Comment out or delete the skip when you
# are ready to work on a test.  Get as many tests to pass as possible.
#
# Read through each test to figure out what it is looking for.
class TwitterTest < MiniTest::Test
 
  def test_shop_should_have_an_array_of_shoes
    #skip
    shop = Shop.new
    assert shop.shoes.is_a?(Array)
  end
 
  def test_a_shoe_must_have_an_product_code_to_be_valid
    #skip
    shoe = Shoe.new
 
    shoe.product_code = nil
    assert_equal false, shoe.valid?, 'nil is not a valid product code'
 
    #shoe.product_code = false
    shoe.product_code = false
    assert_equal false, shoe.valid?, 'false is not a valid product code'
 
    shoe.product_code = 1111
    assert_equal true, shoe.valid?, '1111 is a valid product code'
  end
 
  def test_setting_the_product_code_in_the_initializer
    #skip
    shoe = Shoe.new(1111)
    assert_equal 1111, shoe.product_code
    assert_equal true, shoe.valid?, '1111 is a valid product code'
  end
 
  def test_adding_a_valid_shoe_returns_true
    #skip
    shop = Shop.new
    shoe = Shoe.new
    shoe.product_code = 1111
    result = shop.add_shoe(shoe)
    assert_equal true, result
  end
 
  def test_adding_an_invalid_shoe_returns_false
    #skip
    shop = Shop.new
    shoe = Shoe.new
    shoe.product_code = nil
    result = shop.add_shoe(shoe)
    assert_equal false, result
  end
 
  def test_shoes_get_added_to_the_shop_array
    #skip
    shop = Shop.new
    shoe_one = Shoe.new
    shoe_one.product_code = 1111
    shoe_two = Shoe.new
    shoe_two.product_code = 2222
 
    shop.add_shoe(shoe_one)
    shop.add_shoe(shoe_two)
    assert_equal 2, shop.shoes.count
  end
end
 
###
# Here is a starting structure for your code.
#
# All the methods you should need are here.  Fill in the blanks!

#module Shoe
  class Shoe
    attr_accessor :product_code

    def initialize(code = nil)
        @product_code = code
    end
   
    def valid?
      product_code !=  nil
    end
  end
 
  class Shop
    attr_accessor :shoes

    def shoes
      @shoes = []
    end

    def initialize()
      shoes = Array.new
    end

    def add_shoe(shoe)
      if shoe.valid?
        # then we'll add it
        @shoes.push(shoe)
        true
      else
        # we won't add it
        false
      end
    end
  end
#end