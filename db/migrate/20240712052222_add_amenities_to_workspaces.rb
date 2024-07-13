class AddAmenitiesToWorkspaces < ActiveRecord::Migration[7.1]
  def change
    add_column :workspaces, :amenities, :text
  end
end
