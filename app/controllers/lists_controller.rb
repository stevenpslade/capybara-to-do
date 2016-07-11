class ListsController < ApplicationController

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  protected

  def list_params
    params.require(:list).permit(:title)
  end

end
