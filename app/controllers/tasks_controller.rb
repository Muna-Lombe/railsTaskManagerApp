class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path(@task)
  
  end
  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])

    # Link to edit page
    # <p><%= link_to  "Edit", edit_path(@task.id) %></p>
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
