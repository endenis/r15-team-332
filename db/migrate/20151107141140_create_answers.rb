class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.string :title

      t.timestamps null: false
    end
  end
end
