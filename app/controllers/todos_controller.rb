class TodosController < ApplicationController

  def new
    @todo = Todo.new
    puts 'Todo.new: ', @todo
  end

  def create
    puts 'Todo.create 1: ', @todo
    @todo = Todo.create(todo_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully!"
      redirect_to todo_path(@todo)
    else
      puts 'Todo.create 2: ', @todo
      puts render_to_string :new
      render :new
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  private

    def todo_params
      params.require(:todo).permit(:name, :description)
    end

end