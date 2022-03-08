require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(name: 'Hermione', email: 'hm@hogwarts')
    assert user.valid?
  end

  test 'invalid without name' do
    user = User.new(email: 'someemail@someplace.com')
    refute user.valid?, 'user without a name should be invalid'
    assert_not_nil user.errors[:name], 'user without a name should trigger validation error'
  end

  test 'invalid without email' do
    user = User.new(name: 'Lucy')
    refute user.valid?, 'user without an email should be invalid'
    assert_not_nil user.errors[:email], 'user without an email should trigger validation error'
  end
end
