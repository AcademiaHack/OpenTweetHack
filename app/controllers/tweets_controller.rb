class TweetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :r_not_found

  def index
    twits = Tweet.all
    render json: twits.as_json(include: {twit_details: {include: :product}})  
  end

  def show
    twit = Tweet.find(params[:id])
    render json: twit
  end

  def create
    t = Tweet.new(permit_params)
    if t.save
      render json: {message: "Created"}
    else
      render json: {message: "Not Created", errors: t.errors.full_messages}
    end
  end

  def update
       t = Tweet.find(params[:id])
    if t.update(permit_params)
      render json: {message: "Updated"}
    else
      render json: {message: "Not Updated"}
    end     
  end

  def destroy
    if Tweet.ids.include? params[:id].to_i
      t = Tweet.find(params[:id])
      t.destroy
      render json: {message: "Deleted"}
    else
      render json: {message: "Does not exist"}
    end
  end

  private
  def permit_params_tweets
    params.require(:tweet).permit
  end

  def r_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end