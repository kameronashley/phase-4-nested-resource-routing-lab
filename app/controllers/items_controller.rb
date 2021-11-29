class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else 
      items = Item.all 
    end
    render json: items, include: :user
  end

  def show
    item = Item.find_by(id: params[:id])
    render json: item, include: :user
  end

  def create
    # user = User.find(params[:user_id])
    new_user_item = Item.create(id: params[:id], user_id: params[:user_id], name: params[:name], description: params[:description], price: params[:price])
    render json: new_user_item, include: :user
  end
end
