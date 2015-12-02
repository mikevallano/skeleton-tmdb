class AddListIdToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :list_id, :integer
  end
end
