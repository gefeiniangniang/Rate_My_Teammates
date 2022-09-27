class SessionsController < ApplicationController
  def new
    redirect_to root_url if !current_user.nil?
    #render default tmeplate
  end

  def verify
#     if !current_user.nil?
#         redirect_to root_url
    if params[:uni] == ""
        redirect_to login_path, notice: "Please enter your UNI."
    else
        send_login_link(params[:uni])
        redirect_to root_url, notice: "Verification sent to #{params[:uni]}@columbia.edu. Please login via the sent link."
    end
  end


  def auth
    login_token = params[:token].to_s
    @token = Token.find_by(login_token: login_token)
    if @token.nil? or @token.login_token_expired?
      redirect_to root_path, notice: 'Your login link has been expired. Try requesting for a new login link.'
    else
      @user = User.find_by(uni: @token.uni)

      if @user.nil?
        @user = User.create!(:uni => @token.uni)
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: 'We have just created your data! Please fill in your name to start.'

      else
        session[:user_id] = @user.id
        redirect_to root_url, notice:'Successfully signed in!'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end


  private
    def send_login_link(uni)
      @token = Token.find_by(uni: uni)
      if !@token.nil?
          #update
          @token.update_attribute(:login_token, SecureRandom.hex(10))
      else
          @token = Token.create!(:login_token=>SecureRandom.hex(10),
                                 :uni => uni)
      end
      @token.save!

      UserMailer.welcome_email(uni, @token, request.base_url).deliver_now
    end


end
