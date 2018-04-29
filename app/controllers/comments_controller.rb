class CommentsController < ApplicationController
    def index
        
    end
    def new
        
    end
    def show
        
    end
    def create
        @message = Message.find(params[:message_id])
        @comment = @message.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to message_path(@message)
        else
            render 'new'
        end
    end
    
    def edit
        @message = Message.find(params[:message_id])
        @comment = @message.comments.find(params[:id])
    end
    def update
        if @comment.update(comment_params)
            redirect_to message_path(message)
        else
            render 'edit'
        end
        
    end
    def destroy
       
    end
    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
