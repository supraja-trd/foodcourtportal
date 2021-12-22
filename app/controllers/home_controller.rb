require 'date'
require 'URI'

class HomeController < ApplicationController
    def index
    end

    def menu
        @meal_date = params[:meal_date]
        @meal_interval = params[:meal_interval]
        @meal = Meal.new
        @menu = Menu.new
        @meal_session = Meal.find_by(:meal_date => @meal_date,:meal_interval => @meal_interval)
        @food_items = []
        if @meal_session != nil
            @meal_id = @meal_session.meal_id
            @menu_session = Menu.where(:meal_id => @meal_id).order("created_at")
            @menu_session.each do |food|
                @food_items << food.meal_name
            end
        end
    end
end