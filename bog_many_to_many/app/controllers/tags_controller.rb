class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find params[:id]
  end

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.create(tag_params)


    redirect_to tags_path
  end

  def update
    t = Tag.find params[:id]
    t.update tag_params


    redirect_to tags_path
  end

  def edit
    @tag = Tag.find params[:id]
    @tags = Tag.all
  end

  def destroy
        #render json: params

        tag = Tag.find(params[:id])

        if tag.creatures.empty?
            tag.delete
        end

        redirect_to tags_path
    end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
