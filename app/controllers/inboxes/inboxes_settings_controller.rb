class Inboxes::InboxesSettingsController < Inboxes::BaseController
  def update
    @settings = InboxesSetting.find_or_create_by_user_id(current_user)
    @settings.update_attributes(:send_email_notification => params[:inboxes_setting][:send_email_notification])
    
    redirect_to '/discussions/settings'
  end
end
