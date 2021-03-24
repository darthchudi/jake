class SetIsSubscribedNullToFalseInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :is_subscribed, :boolean, default: false, null: false 
  end
end
