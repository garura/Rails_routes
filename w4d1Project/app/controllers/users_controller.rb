class UsersController < ApplicationController
  def index
    all = User.all
    render json: all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(json: user.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def show
    if User.exists?(params[:id])
      render json: User.find(params[:id])
    else
      render(json: "test", status: :not_found)
    end
  end


  def update
    user = User.find(params[:id])    # if User.exists?(params[:id])
    if user.update(user_params)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find(params[:id])    # if User.exists?(params[:id])
    render json: user
    user.destroy
  end
  # def edit
  #   render text: "test edit"
  # end
  #
  #
  # def new
  #   render text: "I'm in the new action! #{params}"
  # end

private

def user_params
  params.permit(:name, :email)
end


end
