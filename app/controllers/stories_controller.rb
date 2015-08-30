class StoriesController < ApplicationController
  before_action :find_story, only: [:update, :edit, :show, :destroy]
  
  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to "/"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @story.update(story_params)
      render 'show'
      flash[:notice] = "Story has been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    if @story.destroy
      redirect_to '/'
      flash[:notice] = "Story has been deleted!"
    end
  end

  private

  def story_params
    params.require(:story).permit(:body, :category_id)
  end

  def find_story
    @story = Story.find(params[:id])
  end

end
