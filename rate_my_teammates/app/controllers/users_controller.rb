class UsersController < ApplicationController

  def show
    # flash[:notice] = nil
    @user = User.find(params[:id]) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
    time_management_lst = []
    User.find(params[:id]).reviews.each do |review|
        time_management_lst << review.time_management
    end
    @time_management = time_management_lst.reduce(:+).to_f / time_management_lst.size
    communication_lst = []
    User.find(params[:id]).reviews.each do |review|
        communication_lst << review.communication
    end
    @communication = communication_lst.reduce(:+).to_f / communication_lst.size
    reliability_lst = []
    User.find(params[:id]).reviews.each do |review|
        reliability_lst << review.reliability
    end
    @reliability = reliability_lst.reduce(:+).to_f / reliability_lst.size
    critical_thinking_lst = []
    User.find(params[:id]).reviews.each do |review|
        critical_thinking_lst << review.critical_thinking
    end
    @critical_thinking = critical_thinking_lst.reduce(:+).to_f / critical_thinking_lst.size
    collaboration_lst = []
    User.find(params[:id]).reviews.each do |review|
        collaboration_lst << review.collaboration
    end
    @collaboration = collaboration_lst.reduce(:+).to_f / collaboration_lst.size

  end

  def index
    @users = User.all
  end

  def search
    @users = User.where(uni: params[:uni])

    if params[:uni].length == 0
        flash[:warning] = "No UNI entered."
        @users = User.all
    elsif params[:uni].length > 0 and @users.length == 0
        flash[:warning] = "UNI not in record."
    else
        flash[:notice] = "Found 1 result"
    end

    render :index

  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to(@user) }
        format.json { respond_with_bip(@user) }
      else
        # format.html { render :action => "edit" }
        # format.json { respond_with_bip(@user) }
      end
  end
end
  # def new
  #   default: render 'new' template
  # end

  # def create
  #   @user = User.create!(user_params)
  #   flash[:notice] = "#{@movie.title} was successfully created."
  #   redirect_to movies_path
  # end

  # def edit
  #   @user = User.find params[:id]
  # end

  # def update
  #   @movie = Movie.find params[:id]
  #   @movie.update_attributes!(movie_params)
  #   flash[:notice] = "#{@movie.title} was successfully updated."
  #   redirect_to movie_path(@movie)
  # end

  # def destroy
  #   @movie = Movie.find(params[:id])
  #   @movie.destroy
  #   flash[:notice] = "Movie '#{@movie.title}' deleted."
  #   redirect_to movies_path
  # end

#   private
#   # Making "internal" methods private is not required, but is a common practice.
#   # This helps make clear which methods respond to requests, and which ones do not.
   def user_params
     params.require(:user).permit(:uni, :name, :description, :summary, :search, :self_communication,:self_time_management, :self_reliability, :self_collaboration, :self_critical_thinking)
   end

end
