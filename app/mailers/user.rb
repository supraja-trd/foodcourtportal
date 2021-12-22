class User < ApplicationMailer
    default from: 'suprajatrd@gmail.com'

    def welcome_email
      @user = params[:user]
      @url  = 'http://localhost:3000/sign_in'
      mail(to: @user.email, subject: 'Welcome to Office Food Court portal')
    end
end
