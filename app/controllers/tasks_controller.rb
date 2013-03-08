class TasksController < ApplicationController
  def index
  end

  def new
    @tasks = Task.new(params[:id])
  end

  def show
    @tasks = Task.all
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
