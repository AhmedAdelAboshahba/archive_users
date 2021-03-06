class UsersController < ApplicationController

  before_action :set_target_user, only: %i[archive unarchive]

  def index
    render jsonapi: User.kept
  end

  def archive
    if @target_user.discard
      @target_user.update(discarded_by: @user.id)
      render jsonapi: @target_user
    else
      render json: { error: 'User not found or already archived' }, status: :unprocessable_entity
    end
  end

  def unarchive
    if @target_user.undiscard
      @target_user.update(discarded_by: nil)
      render jsonapi: @target_user
    else
      render json: { error: 'User not found or already un archived' }, status: :unprocessable_entity
    end
  end

  private

  def set_target_user
    @target_user = User.find_by_id(params[:id])
  end
end
