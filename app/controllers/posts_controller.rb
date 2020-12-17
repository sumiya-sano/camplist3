class PostsController < ApplicationController

   
   before_action :authenticate_user!
    

    def index
        posts = Post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
        if params[:search] == nil
            @posts= Kaminari.paginate_array(posts).page(params[:page]).per(12)
          elsif params[:search] == ''
            @posts= Kaminari.paginate_array(posts).page(params[:page]).per(12)
          else
            @posted = Post.tagged_with(params[:search], :wild => true, :any => true).includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
            @posts= Kaminari.paginate_array(@posted).page(params[:page]).per(12)
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
        @tags = Post.tag_counts_on(:tags) 
    end

    def edit
        @post =  Post.find(params[:id])
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            redirect_to :action => "index", :id => post.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        post = Post.find(params[:id])

        if post.user_id == current_user.id
            post.destroy
            redirect_to action: :index
        end
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)

        post.user_id = current_user.id

        if post.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    

    private
    def post_params
        params.require(:post).permit(:tent, :sleep, :lantan, :cook, :other, :title, :advice, :number, :price, :about, :image, :tag_list)
    end
end
