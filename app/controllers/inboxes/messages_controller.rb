class Inboxes::MessagesController < Inboxes::BaseController
  load_and_authorize_resource :discussion
  load_resource :message, :through => :discussion, :shallow => true

  def create
    @message.user = current_user
    @message.discussion = @discussion
    @message.save
    
    sender_index = @message.discussion.speakers.index {|speaker| speaker.user_id == current_user.id }
    other_speakers = @message.discussion.speakers.dup
    other_speakers.delete_at(sender_index)
    InboxesMailer.received_message_deliver(other_speakers, User.find(@message.discussion.speakers.at(sender_index).user_id), @message)

    respond_to do |format|
      format.html { redirect_to @message.discussion }
      format.js
    end
  end
end
