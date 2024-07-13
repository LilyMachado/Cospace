class AddHostToWorkspaces < ActiveRecord::Migration[7.1]
  def change
    add_column :workspaces, :host, :string
  end
end
