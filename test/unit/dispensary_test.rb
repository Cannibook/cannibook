require 'test_helper'

class DispensaryTest < ActiveSupport::TestCase

  test "invalid dispensary" do
    dispensary = Dispensary.new
    assert !dispensary.valid?
    assert dispensary.errors.invalid?(:name)
    assert dispensary.errors.invalid?(:street)
    assert dispensary.errors.invalid?(:city)
    assert dispensary.errors.invalid?(:state)
    assert dispensary.errors.invalid?(:zip)
  end
  
  test "unique dispensary name" do
    dispensary = Dispensary.new(:name   => dispensaries(:valid_existing_club).name,
                                :street => '123 Main St.',
                                :city   => 'Hollywood',
                                :state  => 'CA',
                                :zip    => '12345')
    assert !dispensary.save
    assert_equal "has already been taken", dispensary.errors.on(:name)
  end
end
