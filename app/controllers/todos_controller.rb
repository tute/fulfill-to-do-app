class TodosController < ApplicationController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  def index
    @todos = current_user.todos
  end

  def new
    @todo = current_user.todos.new
  end

  def create
    @todo = current_user.todos.new todo_params
    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'To-do successfully created.' }
        format.json { render action: 'show', status: :created, location: @todo }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end

  private

  def find_entry
    @todo = current_user.todos.find params[:id]
  end

  def todo_params
    params[:todo] ||= {}
    params[:todo][:user_id] = current_user.id
    params.require(:todo).permit(:title, :completed_at, :priority, :due_date, :order)
  end
end
