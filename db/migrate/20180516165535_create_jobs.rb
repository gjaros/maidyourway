class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.datetime :datetime
      t.integer :created_by
      t.integer :client_id
      t.text :notes
      t.string :workers

      t.timestamps
    end
  end
end
