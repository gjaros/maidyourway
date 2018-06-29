class CreateJobsUsers < ActiveRecord::Migration[5.1]
  def self.up
    create_table :jobs_users, id: false do |t|
      t.references :job, null: false
      t.references :user, null: false
    end

    # Add an unique index for better join speed!
    add_index(:jobs_users, [:job_id, :user_id], :unique => true)
  end

  def self.down
    drop_table :jobs_users
  end
end
