class UserHasManyRequests < ActiveRecord::Migration
  def up
  	add_column :requests, :user_id, :integer
  end

  def down
  	remove_column :requests, :user_id
  end
end
