class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.text :title
      t.text :slug, index: { unique: true }
      t.integer :user_id, index: { unique: true }, foreign_key: true, null: true
      t.timestamps
    end
  end
end
