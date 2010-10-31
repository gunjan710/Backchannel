class CommentsController < ApplicationController
 def create
   @comment = Comment.new
    if @comment.save
      puts "Added comment."
    else
      puts "Error occurred when adding comment."
    end
  end

  def destroy
#    @comment = Comment.find(:all,:conditions => ["reply = ? or original_post = ?", params[:id], params[:id]])
#    for comment in @comment
#         comment.destroy
#    end
#    puts "Successfully removed related comments."
#    redirect_to(posts_path)
#
  end  
end
