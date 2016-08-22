class ListsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = Task.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
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

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, notice: 'List successfully deleted.'
  end

  protected

  def list_params
    params.require(:list).permit(:user_id, :title)
  end

end
