class MessagesController < ApplicationController
  layout 'profile'

  def index
  end

  def new
    # from = current_user
    # @message = from.sent_messages.build
    # @message.build_conversation
  end

  def create
    from = current_user
    @message = from.messages.build
    @message.build_conversation
    @message.save
  end

  def edit
  end

  def update
  end

  private

  def message_attributes
    params.require(:message).permit(:to, :subject, :body,
                                    :conversation_attributes)
  end
end
