require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid)
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

  test '#posts' do
    assert_equal 2, @user.posts.size
  end

  test 'recent' do
    assert_includes User.recent, users(:valid)
    refute_includes User.recent, users(:old)
  end

  test '#profile_photo_url' do
    assert_equal(
      'https://s.gravatar.com/avatar/20f252fd9ec85cb45aef055477a3ee0e',
      @user.profile_photo_url
    )
  end
end
