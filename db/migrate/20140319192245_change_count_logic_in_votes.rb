class ChangeCountLogicInVotes < ActiveRecord::Migration
  def change
  	rename_column :votes, :count, :vote_type
  	change_column :votes, :vote_type, :string, limit: 4
  end
end
