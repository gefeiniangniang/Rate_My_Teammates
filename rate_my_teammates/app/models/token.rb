class Token < ActiveRecord::Base

  def to_s
     self.login_token
   end

  def login_token_expired?
    Time.now.utc > (self.updated_at + token_validity)
  end

  # def expire_token!
  #   self.login_token = nil
  #   save!
  # end

  private

  def token_validity
    2.hours
  end

end
