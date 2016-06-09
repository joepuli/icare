class ConversationsController < ApplicationController
  before_action :find_conversations
  layout 'profile'

  def index
    @conversations = Kaminari.paginate_array(@conversations).page(params[:page])
                                                            .per(10)
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    @conversation = current_user.conversations.build
    @conversation.messages.build
  end

  def create
    @conversation = current_user.conversations.build(conversation_attributes)
    if @conversation.save
      redirect_to [:conversations]
    else
      render :new
    end
  end

  def edit
    @conversation = Conversation.find(params[:id])
    @to = @conversation.messages.last.to == current_user ? @conversation.messages.last.from : @conversation.messages.last.to
  end

  def update
    @conversation = Conversation.find(params[:id])
    if @conversation.update_attributes!(conversation_attributes)
      redirect_to [:conversations]
    else
      render :new
    end
  end

  def sent
    conversation_ids = current_user.sent_messages.pluck(:conversation_id)
    conversations = Conversation.order(updated_at: :desc).find(conversation_ids)
    @conversations = Kaminari.paginate_array(conversations).page(params[:page])
                                                            .per(10)
  end

  private

  def conversation_attributes
    params.require(:conversation).permit(:subject,
                                          messages_attributes: [:to_id, :from_id, :body] )
  end

  def find_conversations
    conversation_ids = current_user.received_messages.pluck(:conversation_id)
    @conversations = Conversation.order(updated_at: :desc).find(conversation_ids)
  end
end
