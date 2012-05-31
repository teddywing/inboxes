class AddInboxesSettingsInboxes < ActiveRecord::Migration
  def self.change
    create_table :inboxes_settings do |t|
      t.references :user
      t.boolean :send_email_notification, :default => 1
      
      t.timestamps
    end
  end
end
