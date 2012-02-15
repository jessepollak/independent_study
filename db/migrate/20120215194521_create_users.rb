class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :fb_id
      t.string :email
      t.string :number
      t.string :college

      t.timestamps
    end
  end
end
