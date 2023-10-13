class QuizzesController < ApplicationController
  before_action :admin_only, except: [:create, :update]

  def new
    @quiz = Quiz.new
  end

  def create
    quiz = Quiz.new
    quiz.name       = params[:quiz][:name]
    quiz.difficulty = params[:quiz][:difficulty]
    if quiz.save
      flash[:notice] = 'Quiz successfully Initiated'
      redirect_to show_quiz_path(id: quiz.id)
    else
      flash[:alert]  = 'Something went wrong: Generating quiz'
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:id].to_i)
  end

  def update
    quiz = Quiz.find(params[:quiz][:id].to_i)
    quiz.name       = params[:quiz][:name]
    quiz.difficulty = params[:quiz][:difficulty]
    if quiz.save
      flash[:notice] = 'Quiz.successfulyl updated'
      redirect_to show_quiz_path(id: quiz.id)
    else
      flash[:alert]  = 'Something went wrong: updating quiz'
      render :edit
    end
  end
  
  def show
    @quiz = Quiz.find(params[:id].to_i)
  end

  def destroy
    @quiz = Quiz.find(params[:id].to_i)
    debugger
  end

  private
  
  def admin_only
    redirect_to root_path, alert:'Access denied, non-ADMIN!' if current_user.role != "ADMIN"
  end
end
