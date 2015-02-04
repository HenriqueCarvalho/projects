###########################################################################
# Save this in the rails-dev-box/projects/ folder as
#   inches.rb
#
# Get to the right directory in the VM by typing:
#
#  cd /vagrant/projects/
#
# Run it from the VM using
#   ruby inches.rb
#
# 1 INCH IS 2.54 CM
#
###########################################################################
 
def inches_to_cm(inches)
  return inches * 2.54
end
 
def more_than_one_meter?(inches)
  if inches_to_cm(inches) > 100.0
    return true
  else
    return false
  end
end
 
###########################################################################
# these are the tests - don't change them, but definitely read them
###########################################################################
require 'minitest'
MiniTest.autorun
 
class Test < Minitest::Test
  def test_inches_to_cm
    # 1 inch
    assert_equal 2.54, inches_to_cm(1)
 
    # 5 inches
    assert_equal 12.7, inches_to_cm(5)
  end
 
  def test_is_more_than_one_meter
    # yep: it's 114.3
    assert_equal true, more_than_one_meter?(45)
 
    # nope: it's 88.9cm
    assert_equal false, more_than_one_meter?(35)
  end
end