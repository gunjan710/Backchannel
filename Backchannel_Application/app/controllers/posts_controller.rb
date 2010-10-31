class PostsController < ApplicationController
  def index
    if params[:content] != nil and params[:content] != ''
      sql = "select * from posts
            where content like '%#{params[:content]}%' order by created_at DESC"
      @posts = Post.find_by_sql(sql)
      if @posts.count ==0
        flash[:notice] = 'No Match'
        redirect_to :controller => :posts, :action => :search, :id => 1
      end
   else
      @posts = Post.all(:order => "created_at DESC")
   end
  end

  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.users_id = session[:user_id]
    @post.save
    if session[:reply] == true
      puts "this is reply"
      @comment = Comment.new
      @comment.original_post =   session[:originalid]     
      @comment.reply = @post.id.to_s
      @comment.save
      session[:reply] = false
      session[:originalid] = nil
    else
      puts "not reply"
    end

    respond_to do |format|
        format.html { redirect_to(posts_url)  }
    end

  end  

   # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy        
    @allcomments = Comment.find(:all,:conditions => ["reply = ?", params[:id]])
    for comment in @allcomments
        comment.destroy
    end

    @allcomments = Comment.find(:all,:conditions => ["original_post = ?",params[:id]])
    for comment in @allcomments
         @post = Post.find(comment.reply)
         @cheers = Cheer.find(:all,:conditions => ["posts_id = ?", @post.id])
         for cheer in @cheers
              cheer.destroy
         end
         @post.destroy
         comment.destroy
    end
    @cheers = Cheer.find(:all,:conditions => ["posts_id = ?", params[:id]])
    for cheer in @cheers
         cheer.destroy
    end

    @post = Post.find(params[:id])
    if @post
      @post.destroy
    end
    respond_to do |format|
       format.html { redirect_to(posts_path) }
    end
  end

  def cheerup
    @post = Post.find(params[:id])
    @cheer = Cheer.new
    @cheer.users_id= session[:user_id]
    @cheer.posts_id= @post.id
    @cheer.save
    respond_to do |format|
        flash[:notice] = 'You cheered up the post.'
        format.html { redirect_to(posts_url) }
    end

  end

  def cheerdown

    @cheer = Cheer.find(:first,:conditions => ["users_id = ? and posts_id = ?",session[:user_id], params[:id]])

    @cheer.destroy
    respond_to do |format|
        flash[:notice] = 'You cheered down the post.'
        format.html { redirect_to(posts_url) }
    end

  end

  def reply
     session[:reply] = true
     session[:originalid] = params[:id]
     puts "in reply"
     respond_to do |format|
        flash[:notice] = 'Type your reply below.'
        format.html { redirect_to(posts_url) }
     end
  end

  def report
    @post = Post.new
    @user = User.new
    @numcheer = Cheer.new
  end

end
