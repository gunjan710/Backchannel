class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end
  
  def index
      @user = User.find(:all)
  end

  # GET /users/new
   def new
     @user = User.new

     respond_to do |format|
       format.html # new.html.erb
     end
   end


  def create
     @user = User.new(params[:user])
     @user.grade = 0
     if session[:admin] == true
        @user.admin = true
     else
        @user.admin = false
     end
     if @user.save
         if session[:admin] == true
           flash[:notice] = 'User was successfully created.Add Another User or Go back to Home page'
           redirect_to(new_user_url)
         else
           flash[:notice] = 'User was successfully created.'
           redirect_to :controller => :users, :action => :signin, :id => 1
         end
     else
         flash[:notice] = 'User could not be created. Try again'
         redirect_to(new_user_url)
     end
   end

    # GET /users/signin
  def signin
   session[:admin] = false
   if request.post? and params[:user]
    @user = User.new(params[:user])
    @dbuser = User.new
    @dbuser =  User.authenticate(@user.username, @user.password)
      if @dbuser        
        session[:username]=@dbuser.username
        session[:user_id]=@dbuser.id
        session[:admin]=@dbuser.admin

       redirect_to :controller => :posts, :action => :index
      else
        flash[:notice]  = 'Invalid User/Password'
        redirect_to :action => "signin", :id => 1
      end
   end
  end


   def search     
     puts params[:username]
     if params[:username] != nil and params[:username] != ''
      @user = User.find(:first, :conditions => ['username = ?', params[:username]])
      if @user == nil
         flash[:notice] = 'No Match'
      end
   end
  end

  def logout
    if session[:user_id]
      reset_session
      flash[:notice] = 'Enter Username and Password to Login'
      redirect_to :controller => :users, :action => :signin, :id => 1
    end
  end

  
  def destroy
    @userposts = Post.find(:all,:conditions => ["users_id = ?", params[:id]])
        for userpost in @userposts
            @allcomments = Comment.find(:all,:conditions => ["reply = ?", userpost.id])
            for comment in @allcomments
              comment.destroy
            end
            @allcomments = Comment.find(:all,:conditions => ["original_post = ?",userpost.id])
            for comment in @allcomments
              @post = Post.find(comment.reply)
              @cheers = Cheer.find(:all,:conditions => ["posts_id = ?", @post.id])
              for cheer in @cheers
                  cheer.destroy
              end
              @post.destroy
              comment.destroy
            end
            @cheers = Cheer.find(:all,:conditions => ["posts_id = ?", userpost.id])
            for cheer in @cheers
               cheer.destroy
            end
            @post = Post.find(userpost.id)
            if @post
                @post.destroy
            end
        end
        @cheers = Cheer.find(:all,:conditions => ["users_id = ?", params[:id]])
        for cheer in @cheers
             cheer.destroy
        end
        @user = User.find(params[:id])
        if @user
          @user.destroy
        end
        redirect_to :controller => :users, :action => :search, :id => session[:user_id]
      end
end
