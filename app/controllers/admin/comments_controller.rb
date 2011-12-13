class Admin::CommentsController < Admin::BaseController
	main_nav_highlight :comments
	include_kindeditor

	before_filter :get_post
	def create
	    @comment = @post.comments.new(params[:comment])
	    if @comment.save
	      redirect_to admin_post_comments_path()
	    else
	      render :new
	    end
	end

	def edit
		@comment = @post.comments.find(params[:id])
	end

	def update
		@comment = @post.comments.find(params[:id])
		if @comment.update_attributes(params[:comment])
			redirect_to admin_post_comments_path()
		else
			render :edit
		end
	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to admin_post_comments_path()
	end

 	def get_post
    @post = Post.find(params[:post_id])
  	end

	protected
  
  def collection
  	@post = Post.find(params[:post_id])
  	@comments ||= @post.comments
  	@comments = @comments.page(params[:page])
  end
end
