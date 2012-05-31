class AddInboxesSettingsInboxes < ActiveRecord::Migration
  def self.up
    create_table :inboxes_settings do |t|
      t.references :user
      t.boolean :send_email_notification
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :inboxes_settings
  end
end
