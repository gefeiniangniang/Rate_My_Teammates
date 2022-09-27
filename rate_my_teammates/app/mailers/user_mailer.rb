class UserMailer < ApplicationMailer
    
  def welcome_email(uni, token, base_url)
    @url  = base_url +"/auth?token=" + token.to_s
    mail(to: uni + '@columbia.edu', subject: 'Login Email for Rate My Teammate')
  end
   
end
