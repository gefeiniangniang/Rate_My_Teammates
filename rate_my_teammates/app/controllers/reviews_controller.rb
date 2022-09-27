class ReviewsController < ApplicationController
  def new
    if current_user.nil? or current_user.uni == params[:user_uni]
        flash[:warning] = "You have no access to add reviews"
        redirect_to root_path
    end 
    @user = User.find_by(uni: params[:user_uni])
    @review = @user.reviews.build
  end

  def create
    user_uni = params[:review][:user_uni]
    @user = User.find_by(uni: user_uni)

    # if User.find_by(uni: params[:review][:reviewer_uni]) == nil:
    #  flash[:notice] = "Commentor Uni empty or not exsist"

    if params[:review][:content] == ""
      flash[:warning] = "Review has no content"
      redirect_to new_user_review_path(:user_uni =>user_uni)
    elsif params[:review][:time_management].nil?
      flash[:warning] = "Please review time management skill"
      redirect_to new_user_review_path(:user_uni =>user_uni)
    elsif params[:review][:critical_thinking].nil?
      flash[:warning] = "Please review critical thinking skill"
      redirect_to new_user_review_path(:user_uni =>user_uni)
    elsif params[:review][:collaboration].nil?
      flash[:warning] = "Please review collaboration skill"
      redirect_to new_user_review_path(:user_uni =>user_uni)
    elsif params[:review][:communication].nil?
      flash[:warning] = "Please review communication skill"
      redirect_to new_user_review_path(:user_uni =>user_uni)
    elsif params[:review][:reliability].nil?
      flash[:warning] = "Please review reliability"
      redirect_to new_user_review_path(:user_uni =>user_uni)
    elsif params[:review][:course_taken_together].nil? or params[:review][:course_taken_together]==""
      flash[:warning] = "Please enter the course you have taken together"
      redirect_to new_user_review_path(:user_uni =>user_uni)
    else
      review_params = params[:review].except(:user_uni)
      @review = @user.reviews.create!(:content => params[:review][:content], 
          :reviewer_uni => current_user.uni,
          :course_taken_together => params[:review][:course_taken_together],
          :time_management => params[:review][:time_management], 
          :critical_thinking => params[:review][:critical_thinking],
          :collaboration => params[:review][:collaboration],
          :communication => params[:review][:communication],
          :reliability => params[:review][:reliability])
      if @review.save
        redirect_to user_path(@user)
      # else
      #   render "users/show"
      end
    end
  end

  # def review_params
  #   params.require(:review).permit(:content, :reviewer_uni, :user_uni)
  # end
end
