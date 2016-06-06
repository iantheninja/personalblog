class AddAdminToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :admin, index: true, foreign_key: true
  end
end
