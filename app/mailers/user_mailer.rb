class UserMailer < ApplicationMailer
    default from: 'supraja.dinakaran@freshworks.com'

    def welcome_email(user)
      @user = user
      @url  = 'http://localhost:3000/sign_in'
      mail(to: @user['email'], subject: 'Welcome to Office Food Court portal')
    end
end