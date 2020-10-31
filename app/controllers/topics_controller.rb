class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    render json: @topics, status: 200
  end

  def show
    @topic = Topic.find(params[:id])
    render json: @topic, status: 201
  end

  private

  def topic_params
    params.require(:topic).permit(
      :user_id,
      :title,
      :description,
      :questions
    )
  end
end
