class PostsController < ApplicationController

  def index
    @posts = Post.all
  end 

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post.uploaded_image.attach(params["post"]["uploaded_image"])
    @post["user_id"] = @current_user["id"]
    @post["place_id"] = params["post"]["place_id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end

end
