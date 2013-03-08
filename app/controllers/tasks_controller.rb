class TasksController < ApplicationController
 
    
  before_filter :authenticate_user!
  
  def index
  end

  def new
    @tasks = Task.new(params[:id])
  end

  def show
    @tasks = Task.find_all_by_user_id(current_user.id) 
  end

  def create
    @tasks = current_user.tasks.build(params[:tasks])
    
    respond_to do |wants|
      if @tasks.save
        flash[:notice] = 'Task was successfully added.'
        redirect :to  => root_path
      else
        flash[:notice] = 'Failed, Task was not created.'
redirect :to => tasks_new_path
      end
    end
  end
   
  def edit
  end

 

  def update
  end

  def destroy
  end
end
