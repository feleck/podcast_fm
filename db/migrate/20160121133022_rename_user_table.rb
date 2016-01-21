class RenameUserTable < ActiveRecord::Migration
  def change
    rename_table :users, :podcasts
  end 
end
