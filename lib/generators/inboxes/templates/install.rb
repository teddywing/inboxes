class InstallInboxes < ActiveRecord::Migration
  def self.up
    create_table :discussions do |t|
      t.integer :messages_count, :default => 0 # counter cache
      t.references :discussable, :polymorphic => true
      t.timestamps
    end

    create_table :messages do |t|
      t.references :user
      t.references :discussion
      t.text :body

      t.timestamps
    end

    create_table :speakers do |t|
      t.references :user
      t.references :discussion

      t.timestamps
    end
    
    create_table :inboxes_settings do |t|
      t.references :user
      t.boolean :send_email_notification, :default => 1
      
      t.timestamps
    end
  end

  def self.down
    drop_table :speakers
    drop_table :discussions
    drop_table :messages
    drop_table :inboxes_settings
  end
end
