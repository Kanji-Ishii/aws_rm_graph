class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = current_user.exercises.build
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      flash[:success] = "保存しました"
      redirect_to controller: :records, action: :new
    else
      render 'new'
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      flash[:success] = "種目名を更新しました"
      redirect_to controller: :exercises, action: :index
    else
      render 'edit'
    end
  end

  def destroy
    Exercise.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to controller: :exercises, action: :index
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end

end
