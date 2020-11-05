class ResponsesController < ApplicationController
  def index
    responses = Response.all
    render json: ResponseSerializer.new(responses).serializable_hash, status: 200
  end

  def show
    response = Response.find(params[:id])

    render json: ResponseSerializer.new(response).serializable_hash, status: 200
  end

  def create
    response = Response.new(response_params)
    response.user_id = 1
    response.topic_id = 1

    if response.save
      render json: ResponseSerializer.new(response).serializable_hash, status: 201
    else
      render json: response.errors.details
    end
  end

  def update
    response = Response.find(params[:id])

    if response.update(response_params)
      render json: ResponseSerializer.new(response).serializable_hash, status: 200
    else
      render json: response.errors.details
    end
  end

  def destroy
    response = Response.find(params[:id])
    response.destroy

    head :no_content
  end

  private

  def response_params
    params.require(:data).require(:attributes).permit(
      :description,
      :price,
      :date
      # :user_id,
      # :topic_id
    )
  end
end
