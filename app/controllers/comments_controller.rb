class CommentsController < AccessManagementController
  def index
    render json: CommentSerializer.new(Comment.with_event_id(params[:event_id]))
  end

  def create
    current_user = User.find(params[:current_user_id])
    event = Event.find(params[:event_id])

    comment = Comment.create(text: params[:text], event: event, user: current_user)

    unless comment.valid?
      head :unprocessable_entity
    end

    head :created
  end
end