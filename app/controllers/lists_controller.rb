class ListsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]

  def show
    @list = List.find(params[:id])
    @tasks = Task.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def create
    params[:list][:user_id] = current_user.id
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  protected

  def list_params
    params.require(:list).permit(:user_id, :title)
  end

end
