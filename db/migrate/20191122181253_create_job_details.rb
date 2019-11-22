class CreateJobDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :job_details do |t|
      t.integer :job_id
      t.text :detail
      t.string :stack, null: true
      t.string :cloned_site, null: true
      t.timestamps
    end
  end
end
