class WelcomeemailWorker
  include Sidekiq::Worker

  def perform(users_params)
    @user = User.new(users_params)
    UserMailer.welcome_email(@user).deliver_later
  end
end
