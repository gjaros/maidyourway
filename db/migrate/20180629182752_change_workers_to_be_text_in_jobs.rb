class ChangeWorkersToBeTextInJobs < ActiveRecord::Migration[5.1]
  def change
    change_column :jobs, :workers, :text
  end
end
