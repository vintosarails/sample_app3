class FavoritePinsController < ApplicationController
before_action :set_pin
  
  def create
    if Favorite.create(favorited: @pin, user: current_user)
      redirect_to @pin, success: "#{@pin.title} успешно добавлено в избранное"

    else
      redirect_to @pin, danger: 'Ошибка*грустная панда*'
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @pin.id, user_id: current_user.id).first.destroy
    redirect_to @pin, danger: "#{@pin.title} успешно убрано из избранного"
  end
  
  private
  
  def set_pin
    @pin = Pin.find(params[:pin_id] || params[:id])
  end
end
