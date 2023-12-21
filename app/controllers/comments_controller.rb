class CommentsController < ApplicationController
    def create 
        @blog = Blog.find(params[:blog_id])
        @comment = @blog.comments.build(comment_params)

        
        if @comment.save
            redirect_to my_blogs_path(@blog), notice: 'Comment Added!'
        else
            render 'blogs/show'
        end 
    end

    private

    def comment_params 
        params.require(:comment).permit(:content)
    end 
end