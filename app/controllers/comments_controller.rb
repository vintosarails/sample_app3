class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


   def create
    @pin = Pin.find(params[:pin_id])
    flash[:info] = "Комментарий успешно добавлен"
    @comment = @pin.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @pin }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    flash[:info] = "Комментарий успешно удален" 
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:pin_id, :body, :user_id)
    end
end
