class AddRepostedToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :reposted, :boolean, default: false
  end
end
