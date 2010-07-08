require 'test_helper'

class StrainTest < ActiveSupport::TestCase
  test "invalid dispensary" do
    strain = Strain.new
    assert !strain.valid?
    assert strain.errors.invalid?(:name)
  end
end
