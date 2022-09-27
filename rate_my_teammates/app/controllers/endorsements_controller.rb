class EndorsementsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if already_endorsed?
      flash[:warning] = "You can't endorse more than once for the same skill"
      redirect_to user_path(id: @user)
    else
      @skill = @user.skills.find(params[:skill_id])
      @skill.endorsements.create(user_id: params[:endorser_id])
      redirect_to user_path(id: @user)
    end
  end

  private
  def already_endorsed?
    Endorsement.where(user_id: params[:endorser_id], skill_id: params[:skill_id]).exists?
  end

end
