class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  	before_action :signed_in_user, only: [:edit, :update]
	
	def search
		if params[:search].present?
			@pins = Pin.search(params[:search])
		else
			@pins = Pin.all	
		end
	end	

	def index
		@pins = Pin.all.order("created_at DESC")
		#@user = User.find params[:user_id]

	end

	def show
		#@user = User.find_by_username(params[:id])
		#@pin = Pin.find(params[:id])
		#@pins_user = @pins.user
	end

	def new
		@pin = current_user.pins.build
	end

	def create
		@pin = current_user.pins.build(pin_params)

		if @pin.save
			redirect_to @pin, success: "Идея была успешна создана!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, success: "Идея была успешно обновлена!"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
		
	end
	def upvote
		#@pin = Pin.find(params[:id])
		@pin.upvote_by current_user
		redirect_to :back
	end
	def downvote
		#@pin = Pin.find(params[:id])
		@pin.downvote_by current_user
		redirect_to :back
	end

	def favorites
    	@pins = current_user.favorite_pins
  	end

	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image)
	end

    def signed_in_user
      redirect_to signin_url, notice: "Пожалуйста, выполните вход." unless signed_in?
    end

	def find_pin
		@pin = Pin.find(params[:id])
	end


end
