class PostsController < ApplicationController
  def index
    run Post::Operation::Index
    render cell(Post::Cell::Index, result["model"])
  end

  def show
    run Post::Operation::Show
    render cell(Post::Cell::Show, result["model"])
  end

  def new
    run Post::Operation::Create::Present
    render cell(Post::Cell::New, @form)
  end

  def create
    run Post::Operation::Create do |result|
      return redirect_to posts_path
    end

    render cell(Post::Cell::New, @form)
  end

  def edit
    run Post::Operation::Update::Present
    render cell(Post::Cell::Edit, @form)
  end

  def update
    run Post::Operation::Update do |result|
      flash[:notice] = "#{result["model"].title} has been saved"
      return redirect_to post_path(result["model"].id)
    end

    render cell(Post::Cell::Edit, @form)
  end

  def destroy
    run Post::Operation::Delete

    flash[:alert] = "Post deleted"
    redirect_to posts_path
  end
end
