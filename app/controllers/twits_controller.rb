class TwitsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :r_not_found

  def index
    twits = Twit.all
    render json: twits.as_json(include: {twit_details: {include: :product}})  
  end

  def show
    twit = Twit.find(params[:id])
    render json: twit
  end

  def create
    t = Twit.new(permit_params)
    if t.save
      render json: {message: "good"}
    else
      render json: {message: "no good", errors: t.errors.full_messages}
    end
  end

  def update
       t = Twit.find(params[:id])
    if t.update(permit_params)
      render json: {message: "Actualizado"}
    else
      render json: {message: "no actualizado"}
    end     
  end

  def destroy
    if Twit.ids.include? params[:id].to_i
      t = Twit.find(params[:id])
      t.destroy
      render json: {message: "borrado"}
    else
      render json: {message: "no existe"}
    end
  end

  private
  def permit_params_twits
    params.require(:twit).permit
  end

  def r_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end