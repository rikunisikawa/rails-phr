class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
    # p @questions
  end
  # 質問詳細ページ表示
  def show
    # p params[:id]
    @question = Question.find(params[:id])
    # p @question
  end

  # 質問の作成
  def new
    @question = Question.new
  end

  # 質問の登録
  def create
    # Questionモデルを初期化
    @question = Question.new(question_params)
    # QuestionモデルをDBへ保存
    if @question.save
      # 保存に成功した場合, showへリダイレクト
      redirect_to @question
    else
      # 保存に失敗した場合, newを再描画
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:id]) # params[:id] を使用してレコードを取得
    p @question
    if @question.destroy
      redirect_to questions_path, notice: 'Question was successfully deleted.'
    else
      redirect_to questions_path, alert: 'Failed to delete the question.'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
