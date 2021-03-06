class AddArchiveFieldsToUsers < ActiveRecord::Migration[6.1]
    def up
      add_column :users, :discarded_at, :datetime
      add_column :users, :discarded_by, :integer
      add_index :users, :discarded_at
    end
  
    def down
      remove_index :users, :discarded_at
      remove_column :users, :discarded_by
      remove_column :users, :discarded_at
    end
  end
  