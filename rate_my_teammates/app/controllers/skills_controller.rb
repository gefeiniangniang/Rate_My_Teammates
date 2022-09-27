class SkillsController < ApplicationController
  def new
    @user = User.find_by(uni: params[:user_uni])
    @skill = @user.skills.build
  end

  def create
    user_uni = params[:skill][:user_uni]
    @user = User.find_by(uni: user_uni)

    # if User.find_by(uni: params[:review][:reviewer_uni]) == nil:
    #  flash[:notice] = "Commentor Uni empty or not exsist"

    if params[:skill][:name] == ""
      flash[:warning] = "Skill name cannot be empty"
      redirect_to new_user_skill_path(:user_uni => user_uni)
    else
      skill_params = params[:skill].except(:user_uni)
      @skill = @user.skills.create!(:name => params[:skill][:name])
      if @skill.save
        redirect_to user_path(@user)
      # else
      #   render "users/show"
      end
    end
  end
end
