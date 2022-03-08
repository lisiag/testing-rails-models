require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Hermione', email: 'hm@hogwarts')
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?, 'user without a name should be invalid'
    assert_not_nil @user.errors[:name], 'user without a name should trigger validation error'
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?, 'user without an email should be invalid'
    assert_not_nil @user.errors[:email], 'user without an email should trigger validation error'
  end
end
