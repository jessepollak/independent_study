class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
