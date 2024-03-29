class ContentsController < ApplicationController
  
  before_action :authorize, only: [:new, :edit, :update, :destory]
  load_and_authorize_resource
  
  def index
    # @contents = Content.all
    @contents = Content.search(params[:search])
  end

  def show
    @content = Content.find(params[:id])
    @comment = Comment.new(content: @content)
  end

  def new
    @content = Content.new
    @categories = Category.all
  end

  def create
    @content = Content.new(content_params)
    @content.save
    redirect_to @content

  end

  def edit
    @content = Content.find(params[:id])
    authorize! :update, @content
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    redirect_to @content
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    
    redirect_to contents_url
  end
  

  private
  
  def authorize
    redirect_to new_session_path if current_user.nil?
  end
  
  def content_params
    params.require(:content).permit(:title, :body, :user_id, :category_id)
  end
  
  
  
end
