class CommentsController < ApplicationController

  def create
    @comment = Comment.new(text: params[:comment][:text], user_id: current_user.id, thing_id: params[:thing_id])
    ActionCable.server.broadcast 'comment_channel', content: @comment, name: @comment.user.nickname if @comment.save
  end

end
