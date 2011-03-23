require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
        :username => "Example User",
        :email => "user@example.com",
        :password => "foobar",
        :password_confirmation => "foobar"
    }
  end

  describe "name validation" do
    it "should require a name" do
      no_name_user = User.new(@attr.merge(:username => ""))
      no_name_user.should_not be_valid
    end

    it "should reject names that are too long" do
      long_name = "z" * 31
      long_name_user = User.new(@attr.merge(:username => long_name))
      long_name_user.should_not be_valid
    end
  end

  describe "email validation" do
    it "should require an email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end

    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first+last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end

    it "should reject email addresses identical up to case" do
      uppercase_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => uppercase_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
          should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "not_foobar")).
          should_not be_valid
    end

    it "should reject short passwords" do
      short_pwd = "z" * 5
      hash = @attr.merge(:password => short_pwd, :password_confirmation => short_pwd)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long_pwd = "z" * 21
      hash = @attr.merge(:password => long_pwd, :password_confirmation => long_pwd)
      User.new(hash).should_not be_valid
    end

    it "should accept valid passwords" do
      valid_passwords = %w[g00d_pa$$W0rD 1!2@3# chicken_soup_for_the]
      valid_passwords.each do |pwd|
        valid_user = User.new(@attr.merge(:password => pwd, :password_confirmation => pwd))
        valid_user.should be_valid
      end
    end
  end
end
