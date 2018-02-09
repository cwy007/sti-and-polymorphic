# RailsCasts Episode #394 STI and Polymorphic Associations pro

http://railscasts.com/episodes/394-sti-and-polymorphic-associations

model
```ruby
class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates_presence_of :username, :email, unless: :guest?
  validates_uniqueness_of :username, allow_blank: true
  validates_confirmation_of :password

  has_secure_password validations: false

  def self.new_guest
    new { |u| u.guest = true }
  end

  def name
    guest ? 'GUEST' : username
  end

  def move_to(user)
    tasks.update_all(user_id: user.id)
  end
end

```

controller
```ruby
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = params[:user] ? User.new(user_params) : User.new_guest   # NOTE: cann't be user, must use @user because of render 'new'
    if @user.save
      current_user.move_to(@user) if current_user && current_user.guest?
      session[:user_id] = @user.id
      flash[:notice] = 'signup successfully!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end

```

rake task
```ruby
#lib/tasks/guests.rake
namespace :guests do
  desc 'Remove guest account more than a week old.'
  task cleanup: :environment do
    User.where(guest: true).where('created_at > ?', 1.week.ago).destroy_all
  end
end
```

coffee
```coffee
# tasks.coffee
jQuery.fn.submitOnCheck = ->
  @find('input[type=checkbox]').click ->
    $.ajax
      url: $(this).parent('label').parent('form')[0].action
      headers:
        Accept: 'text/javascript; charset=utf-8'
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      type: 'PATCH'
      data:
        'task[complete]': $(this).is(':checked')
        'authenticity_token': $(this).siblings('#authenticity_token').val()
  return this

jQuery ->
  $('.edit_task').submitOnCheck()

```

view
```js
$('#no-tasks').addClass('d-none');

<% if @task.complete? %>
  $('#js-complete-tasks').append('<%= j render @task %>');
<% else %>
  $('#js-incomplete-tasks').append('<%= j render @task %>');
<% end %>

$('#edit_task_<%= @task.id %>').submitOnCheck();

$('#new_task #task_name').val('');

```
