class Api::V1::QuestionsController < ApplicationController

     # POST /create
    def create
        @question = Question.new(user: @user, title: params['title'])
        if @question.save
            response = { message: 'Question submitted successfully'}
            render json: response, status: :created 
        else
            render json: @question.errors, status: :bad
        end 
    end

end
