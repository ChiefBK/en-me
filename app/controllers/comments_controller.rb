class CommentsController < AccessManagementController
  def index
    render json: CommentSerializer.new(Comment.with_event_id(params[:event_id]))
  end

  def create
    current_user = User.find(params[:current_user_id])
    event = nil

    unless params[:event_id].nil?
      event = Event.find(params[:event_id])
    end

    comment = Comment.create(text: params[:text], event: event, user: current_user)

    unless comment.valid?
      head :unprocessable_entity
      return
    end

    head :created
  end
end