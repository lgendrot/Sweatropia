class AddLastSeenAtToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :last_seen_at, :datetime
  end
end
