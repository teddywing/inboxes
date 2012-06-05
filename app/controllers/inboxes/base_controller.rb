class Inboxes::BaseController < ApplicationController
  private

  def init_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end
  
  def deliver_email_notification(message)
    sender_index = message.discussion.speakers.index {|speaker| speaker.user_id == current_user.id }
    other_speakers = message.discussion.speakers.dup
    other_speakers.delete_at(sender_index)
    InboxesMailer.received_message_deliver(other_speakers, User.find(message.discussion.speakers.at(sender_index).user_id), message)
  end
end