class CheckinController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        redirect_to checkin_add_path
    end

    def add
        @office_email = current_user.email
        @result = ""
        if request.post?
            @old_preference = MealPreference.find_by(:meal_date => params[:meal_date],:office_email => @office_email)
            if @old_preference != nil
                @result = "WARNING"
                @error_message = "Food request for Email : '" + @office_email +"' for Date : '" + params[:meal_date] + "' already exists."
            else
                @meal_preference = MealPreference.new(input_params)
                @result = "FAILURE"
                begin
                    if @meal_preference.save
                        @result = "SUCCESS"
                    end
                rescue => exception
                    if exception != nil
                        @result = exception
                    end
                end
            end
        end
    end

    def view
        @search_key = params[:search_key]
        @search_value = params[:search_value]
        if !@search_key.blank? and !@search_value.blank?
            @meal_preferences = MealPreference.search( [@search_key] , @search_value )
        else
            @meal_preferences = MealPreference.where(:office_email => current_user.email)
        end
    end

    def show
        @meal_preference = MealPreference.find_by(:meal_date => params[:meal_date], :office_email => current_user.email)

        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "Meal Pass - #{@meal_preference.meal_date} - #{current_user.email}",
                wkhtmltopdf: '/Users/sdinakaran/.rvm/gems/ruby-2.4.7@itildesk/bin/wkhtmltopdf',
                template: "checkin/show.html.erb",
                layout: "pdf.html"
            end
        end
    end

    def search
        if !params[:key].blank? and !params[:value].blank?
            @results = MealPreference.search( [params[:key]] , params[:value] )
        else
            @results = MealPreference.search(['office_email','meal_date','breakfast','lunch','dinner'],'*')
        end
    end
    
    private

    def input_params
        params.require(:meal_date)
        params.require(:breakfast)
        params.require(:lunch)
        params.require(:dinner)
        {
            office_email: current_user.email,
            meal_date: params[:meal_date],
            breakfast: params[:breakfast],
            lunch: params[:lunch],
            dinner: params[:dinner]
        }
    end
end