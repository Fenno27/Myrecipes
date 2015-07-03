require "test_helper"
class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef= Chef.new(name: "john" , email: "john@example.org")
    
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef name should be present" do
    @chef.name=""
    assert_not @chef.valid?
  end
  
  test "chef name should not be short" do 
    @chef.name="a"
    assert_not @chef.valid?
  end
  
  test "chef name should not be too long" do 
    @chef.name="a"*41
    assert_not @chef.valid?
  end
  
  test "chef email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
    
  end
  test "chef email should not be too long" do
    @chef.email= "a"*101+"@example.com"
    assert_not @chef.valid?
  end
  
  test "chef email add must be unique" do
    dup_chef=@chef.dup 
   dup_chef.email=@chef.email.upcase
   @chef.save
   assert_not dup_chef.valid?
   
  end
  
  test "chef email validation should accept vaild email" do
    valid_email= %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+jaoe@momk.com] 
    valid_email.each do |var|
      @chef.email = var
      assert @chef.valid?, "#{var.inspect} should be valid"
    end
  end
  test "chef email validation should rejet non-valid email" do
    nonvalid_email= %w[user@eee,com ser_at_example.com first.last@eee. laura+jaoe.com] 
    nonvalid_email.each do |var|
      @chef.email=var
      assert_not @chef.valid?, "#{var.inspect} should be invalid"
    end
  end
end