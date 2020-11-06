class TopicsController < ApplicationController
  def index
    topics = Topic.all
    render json: TopicSerializer.new(topics).serializable_hash, status: 200
  end

  def show
    topic = Topic.find(params[:id])

    render json: TopicSerializer.new(topic).serializable_hash, status: 200
  end

  def create
    topic = Topic.new(topic_params)
    topic.user_id = 1

    if topic.save
      render json: TopicSerializer.new(topic).serializable_hash, status: 201
    else
      render json: topic.errors.details
    end
  end

  def update
    topic = Topic.find(params[:id])

    if topic.update(topic_params)
      render json: TopicSerializer.new(topic).serializable_hash, status: 200
    else
      render json: topic.errors.details
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy

    head :no_content
  end

  private

  def topic_params
    params.require(:data).require(:attributes).permit(
      :title,
      :description,
      :questions
      # :user_id,
    )
  end
end
