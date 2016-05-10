class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :r_not_found

  def index
    users = User.all
    render json: users.as_json(include: {user_details: {include: :product}})  
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    u = User.new(permit_params)
    if u.save
      render json: {message: "good"}
    else
      render json: {message: "no good", errors: u.errors.full_messages}
    end
  end

  def update
       u = User.find(params[:id])
    if u.update(permit_params)
      render json: {message: "Actualizado"}
    else
      render json: {message: "no actualizado"}
    end     
  end

  def destroy
    if User.ids.include? params[:id].to_i
      u = User.find(params[:id])
      u.destroy
      render json: {message: "borrado"}
    else
      render json: {message: "no existe"}
    end
  end

  private
  def permit_params_users
    params.require(:user).permit
  end

  def r_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end