class AddRewardToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :reward, :string
  end
end
