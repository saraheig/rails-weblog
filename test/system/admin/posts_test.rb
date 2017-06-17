require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase

    test 'editing an existing post by an admin' do
    
    user = User.new
    user.email = 'bob@bob.com'
    user.password = 'secret'
    # Be careful to add this user in the database (run "rails db:seed")
    
    visit '/'

    click_link 'Log In'
    
    # Do not forget to add the references in app/views/sessions/new.html.erb
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    
    click_button 'Log In'

    # Visit the admin post index page
    visit '/admin/posts' # see rails routes
    
    # Click on the first post edit link
    click_link 'Edit', match: :first
    
    # Some new values
    post = Post.new
    post.title = "Let's test!"
    post.body = "This is just a little test."

    fill_in 'Title', with: post.title
    fill_in 'Body', with: post.body
    
    # It is necessary to change the redirection path in app/controllers/admin/posts_controller.rb
    click_button 'Update Post'
    
    # Check that the modifications are present in the post page
    assert_selector('td.title', text: post.title)
    assert_selector('td.body', text: post.body)
    
  end
end