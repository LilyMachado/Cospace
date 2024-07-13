class AddAvailabilityToWorkspaces < ActiveRecord::Migration[7.1]
  def change
    add_column :workspaces, :available_from, :datetime
    add_column :workspaces, :available_to, :datetime
  end
end
