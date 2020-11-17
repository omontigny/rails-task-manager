class TasksController < ApplicationController
  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save

     # no need for app/views/restaurants/create.html.erb
      redirect_to tasks_path(@task)
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @task.completed ? comp_message = "completed" : comp_message = "not completed yet"

    @message = "this task is #{comp_message}"
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
