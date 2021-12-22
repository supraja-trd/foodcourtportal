class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(users_params)
        if @user.save
            flash[:success] = "Account registered!"
            user_param_fields = users_params
            user_param_fields['id'] = @user.id
            WelcomeemailWorker.perform_async(user_param_fields)
            redirect_to root_path
        else
            render :new
        end
    end

    def index
        redirect_to new_user_path
    end
    
    private

    def users_params
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end