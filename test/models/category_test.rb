require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = nil
    assert_not @category.valid?
  end

  test "name should be unique" do 
    @category.save
    @c2 = Category.new(name: @category.name)
    assert_not @c2.valid?
  end

  test "name shouldnt be too long" do 
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name shouldnt be too short" do 
    @category.name = "a" * 2
    assert_not @category.valid?
  end

end