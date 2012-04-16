class AddReqToMessages < ActiveRecord::Migration
  def up
    add_column :messages, :request_id, :integer
  end

  def down
    remove_column :messages, :request_id, :integer
  end
end
