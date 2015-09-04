class StoriesController < ApplicationController
  # before_action :find_story, only: [:update, :edit, :show, :destroy]
  before_action :find_story, except: [:new, :create, :index]

  def index
    @stories = Story.all.order(rate: :desc)
  end

  def new
    @story = Story.new
    @categories = Category.all
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = "Congrats, Story has been created!"
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
      flash[:notice] = "Story has been updated!"
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    if @story.destroy
      redirect_to '/', notice: "Story has been deleted!"
    end
  end

  def increase_rate
    # binding.pry
    @story.rate += 1
    @story.save
    redirect_to '/'
  end

  def decrease_rate
    @story.rate -= 1
    @story.save
    redirect_to '/'
  end

  private

  def story_params
    params.require(:story).permit(:body, :category_id)
  end

  def find_story
    @story = Story.find(params[:id])
  end

end
