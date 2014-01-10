class TodosController < ApplicationController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @todos = current_user.todos.all
    respond_with @todos
  end

  def new
    respond_with (@todo = current_user.todos.new)
  end

  def create
    @todo = current_user.todos.create todo_params
    respond_with @todo, location: todos_path
  end

  def update
    @todo.update_attributes todo_params
    respond_with @todo, location: todos_path
  end

  def destroy
    @todo.destroy
    respond_with @todo
  end

  private

  def find_entry
    @todo = current_user.todos.find params[:id]
  end

  def todo_params
    params[:todo] ||= {}
    params[:todo][:user_id] = current_user.id
    params.require(:todo).permit(:title, :completed_at, :priority, :due_date)
  end
end
