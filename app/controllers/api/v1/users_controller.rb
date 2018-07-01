class Api::V1::UsersController < Api::BaseController
  before_action :find_or_create_users, only: [:friend, :unfriend, :mutual_friends, :subscribe_to_updates, :block_updates]

  #Method: Post
  #url: /users/friend
  def friend
    @user.friendships.build(friend_id: @friend.id)
    if @user.save
      render json: { success: true }
    else
      render json: {message: @user.errors&.messages || 'Unable add as friend, please try again'}, status:  202
    end
  end

  #Method: Put
  #url: /users/unfriend
  def unfriend
    if relation = @user.friendships.find_by(friend_id: @friend.id)
      relation.destroy
      render json: { success: true }
    else
      render json: {message: relation.errors&.full_messages&.first}, status:  202
    end
  end

  #Method: get
  #url: /users/friends_list
  def friends_list
    @user = User.find_by(email: params[:email])
    if @user.present?
      @friends = @user.friends.page(params[:page]).per(params[:per_page]).distinct
      render json: @friends, each_serializer: Api::V1::UsersSerializer, meta: pagination_dict(@friends)
    else
      render json: {message: 'User Not Found'}, status: 404
    end
  end

  #Method: Get
  #url: /users/mutual_friends
  def mutual_friends
    if @user and @friend
      @mutual_friends = User.mutual_friends_list(@user, @friend).page(params[:page]).per(params[:per_page]).distinct
      render json: @mutual_friends, each_serializer: Api::V1::UsersSerializer, meta: pagination_dict(@mutual_friends)
    else
      render json: {message: 'No Common Friends Exists'}, status:  404
    end
  end

  #Method: Post
  #url: /user/subscribe_to_updates
  def subscribe_to_updates
    if @subscription = @requestor.find_or_create_subscriptions(@target.id)
      @subscription.update_attributes(blocked: false) if @subscription.blocked?
      render json: { success: true }
    else
      render json: {message: @subscription.errors&.full_messages || 'Unable to subscriber updates, please try again'}, status:  202
    end
  end

  #Method: Put
  #url: /user/block_updates
  def block_updates
    @subscription = @requestor.find_or_create_subscriptions(@target.id)
    if @subscription.update_attributes(blocked: true)
      render json: { success: true }
    else
      render json: {message: @subscription.errors&.full_messages || 'Unable to block subscriptions, please try again'}, status:  202
    end
  end

  #Method: Get
  #url: /user/can_receive_updates
  def can_receive_updates
    @user = User.where(email: params[:email])
    params[:message]
    if @user.present?
      render json: @user.unblocked_subscribers.page(params[:page]).per(params[:per_page]).distinct
    else
      render json: {message: 'User Not Found'}, status: 404
    end
  end

  private
  def find_or_create_users
    if params[:user_email] and params[:friend_email]
      @user = User.find_or_create_by(email: params[:user_email])
      @friend = User.find_or_create_by(email: params[:friend_email])
    elsif params[:requestor] and params[:target]
      @requestor = User.find_or_create_by(email: params[:requestor])
      @target = User.find_or_create_by(email: params[:target])
    end
  end

end
