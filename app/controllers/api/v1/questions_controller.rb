class Api::V1::QuestionsController < ApplicationController

     # POST /create
    def create_question
        @question = Question.new(user: @user, title: params['title'])
        if @question.save
            response = { message: 'Question submitted successfully'}
            render json: response, status: :created 
        else
            render json: @question.errors, status: :bad
        end 
    end

    # POST /create
    def create_answer
        @answer = Question.new(user: @user, description: params['description'], question_id: params['question_id'])
        if @answer.save
            response = { message: 'Answer submitted successfully'}
            render json: response, status: :created 
        else
            render json: @answer.errors, status: :bad
        end 
    end

end
