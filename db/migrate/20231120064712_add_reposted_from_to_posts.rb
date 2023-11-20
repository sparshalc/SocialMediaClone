class AddRepostedFromToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :reposted_from, :integer, null: false
  end
end
