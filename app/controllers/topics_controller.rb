class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    render json: TopicSerializer.new(@topics).serializable_hash, status: 200
  end

  def show
    @topic = Topic.find(params[:id])
    render json: TopicSerializer.new(@topic).serializable_hash, status: 200
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
