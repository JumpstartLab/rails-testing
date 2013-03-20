class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by_name(params[:id]) || Tag.find_by_id(params[:id])

    if @tag.nil?
      flash[:message] = "The tag could not be found"
      redirect_to tags_path
    end
  end
end
