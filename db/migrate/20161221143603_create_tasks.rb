class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :list_id
      t.string :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
