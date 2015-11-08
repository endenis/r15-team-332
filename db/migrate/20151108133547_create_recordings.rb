class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|

      t.timestamps null: false
    end
  end
end
