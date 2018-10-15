require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do 
    it "should have a matching password AND password_confirmation fields" do
      @user = User.create(first_name: "Anything",last_name: "Anything",email: "Anything",
       password: "test", password_confirmation: "test2" )
      expect(@user.password).to_not be_equal (@user.password_confirmation)
    end

    it "Should not be created without password AND password_confirmation fields" do
      @user = User.create(first_name: "Anything", last_name: "Anything", email: "Anything",
       password: nil, password_confirmation: nil)
       expect(@user).to_not be_valid
    end

    it "Should have an UNIQUE email address(NOT case sensitive)" do
      @user = User.create(first_name: "Anything",last_name: "Anything",email: "test@test.test",
      password: "test", password_confirmation: "test" )
      @user2 = User.create(first_name: "Anything",last_name: "Anything",email: "TEST@TEST.TEST",
      password: "test", password_confirmation: "test" )
      expect(@user2).to_not be_valid
    end

    it "Should have a First Name" do
      @user = User.create(first_name:nil,last_name: "Anything",email: "test@test.test",
      password: "test", password_confirmation: "test" )
      expect(@user).to_not be_valid
    end

    it "Should have a Last Name" do 
      @user = User.create(first_name:"Anything",last_name: nil, email: "test@test.test",
      password: "test", password_confirmation: "test" )
      expect(@user).to_not be_valid      
    end

    it "Should have an email" do 
      @user = User.create(first_name:"Anything",last_name: "Anything", email: nil,
      password: "test", password_confirmation: "test" )
      expect(@user).to_not be_valid      
    end

    it "Should have a password with MINIMUM LENGTH of 6" do
    @user = User.create(first_name:"Anything",last_name: "Anything", email: "Anything",
    password: "test", password_confirmation: "test" )
    expect(@user).to_not be_valid
    end
    
    it "" do
    end
  end
end
