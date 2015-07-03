require 'test_helper'
class RecipeTest< ActiveSupport::TestCase
  
  def setup
    @chef= Chef.create(name: "bob", email: "bob@example.com")
    @recipe=@chef.recipes.build(name: "Fried Egg",summary: "Fast and delicious Fried Egg" ,
    description: "one egg, some oil, some chicken powder")
  end
  
  test "recipe should be valid " do
    assert @recipe.valid?
  end
  
  test "id should be present" do
    @recipe.chef_id=nil
    assert_not @recipe.valid?
  end
  test "name should be valid" do
    @recipe.name=""
    assert_not @recipe.valid?
  end

  test "name length should not be too long" do
    @recipe.name="a"*101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name="aaa"
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary=""
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
     @recipe.summary="a"*151
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
     @recipe.summary="aaa"
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
      @recipe.description=""
    assert_not @recipe.valid?
  end
  
  test "description length should not be too long" do
     @recipe.description="a"*400
    assert_not @recipe.valid?
  end
  
  test "description length should not be too short" do
     @recipe.description="aaa"
    assert_not @recipe.valid?
  end
  



end