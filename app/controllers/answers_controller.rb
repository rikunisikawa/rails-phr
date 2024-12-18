class AnswersController < ApplicationController

  def index
    # @answers = Answer.all
  end

  def show
    # @answer = Answer.find(params[:id])
  end

  def new
    # @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def edit
    # @answer = Answer.find(params[:id])
  end

  def update
    # @answer = Answer.find(params[:id])
    # if @answer.update(answer_params)
    #   redirect_to @answer
    # else
    #   render :edit
    # end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to @question, status: :see_other
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :content)
  end
end
