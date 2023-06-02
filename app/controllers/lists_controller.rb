class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to(List.last)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # identify the list
    @list = List.find(params[:id])
    # destroy the list
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
