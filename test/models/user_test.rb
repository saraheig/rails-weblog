require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#display_name when admin' do
    # user = User.new(admin: true, name: 'bob')
    user = users(:bob)
    assert_equal user.name + ' (admin)', user.display_name
  end
  
  test '#display_name when not admin' do
    # user = User.new(admin: false, name: 'jane')
    user = users(:jane)
    assert_equal user.name, user.display_name
  end
end
