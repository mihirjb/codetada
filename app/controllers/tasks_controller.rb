class TasksController < ApplicationController
 
    
  before_filter :authenticate_user!, :except => [:show]
  
  def index
  end

  def new
  @task = current_user.tasks.build
  end

  def show
    if user_signed_in?
    @task = Task.find_all_by_user_id(current_user.id) 
  else
    @task = Task.all
  end
  end

  def create
    @task = current_user.tasks.build(params[:task])
      if @task.save
       flash[:notice] = "Task created!"
       redirect_to root_path
      else
       render new_task_path
      end
  end
   
  def edit
    @task = Task.find(params[:id])
  end

 

  def update
   
    if Task.find(params[:id]).update_attributes(params[:task])
      flash[:notice] = "Task Updated!"
       redirect_to root_path
    else
      redirect_to root_path, :notice => "Update failed"
    end
  end

  def destroy
    if Task.find(params[:id]).delete
       redirect_to root_path, :notice => "Task deleted"
     end
  end
end
