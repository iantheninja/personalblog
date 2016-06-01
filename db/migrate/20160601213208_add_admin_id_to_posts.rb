class AddAdminIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :admin_id, :integer
  end
end
