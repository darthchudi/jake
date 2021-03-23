class AddIsSubscribedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_subscribed, :boolean, default: false
  end
end
