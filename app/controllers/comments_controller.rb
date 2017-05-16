class CommentsController < ApplicationController
  def create
    @content = Content.find(params[:content_id])
    @comment = @content.comments.new(comment_params)

    # @comment = Comment.new(comment_params)
    # @comment.content_id = params[:content_id]
    # @comment.save
    @comment.save   
    
    redirect_to content_path(@content)
    
    
  end

  def edit
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  
end
