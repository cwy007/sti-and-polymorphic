class TasksController < ApplicationController
  def index
    if current_user
      @complete_tasks   = current_user.tasks.where(complete: true)
      @incomplete_tasks = current_user.tasks.where(complete: false)
    else
      @incomplete_tasks = []
      @complete_tasks   = []
    end
  end

  def create
    @task = current_user.tasks.create!(task_params)

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def update
  end

  def destroy
  end

  private

    def task_params
      params.require(:task).permit(:name, :complete)
    end
end
