require 'application_system_test_case'

class AuthenticationTest < ApplicationSystemTestCase
    test 'user creation and login' do
        visit '/'
        # assert_current_path('/') # Check the current path
        
        # assert_selector 'a', 'Sign up' # Not necessary (because there will be a click on the button)
        click_link('Sign Up')
        # assert_current_path('/users/new')
        
        fill_in('user_name', with: 'Sarah')
        fill_in('user_email', with: 's.c@heig-vd.ch')
        fill_in('user_password', with: 'supersecret')
        
        click_button('Sign Up') # Button otherwise ambiguous match
        # assert_current_path('/')
        
        # assert_selector 'a', 'Log In'
        click_link('Log In')
        # assert_current_path('/session/new')
        
        fill_in('user_name', with: 'Sarah')
        fill_in('user_password', with: 'supersecret')
        
        # assert_selector 'a', 'Log In'
        click_button('Log In')
        # assert_current_path('/session')
        assert_selector "header", "Hello Sarah!"
        assert_selector 'a', 'Log Out'
  end
end
