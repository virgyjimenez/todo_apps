class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
  @todo = Todo.new(todo_params)

  respond_to do |format|
    if @todo.save
      flash[:success] = 'El deber fue agregado correctamente.'
      format.html { redirect_to @todo }
      format.json { render :show, status: :created, location: @todo }
    else
      flash[:danger] = 'Hubo un problema al agregar el deber.'
      format.html { render :new }
      format.json { render json: @todo.errors, status: :unprocessable_entity }
    end
  end
end


  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
  respond_to do |format|
    if @todo.update(todo_params)
      flash[:success] = 'El deber ha sido actualizado.'
      format.html { redirect_to @todo }
      format.json { render :show, status: :ok, location: @todo }
    else
      flash[:danger] = 'Hubo un problema al editar el deber.'
      format.html { render :edit }
      format.json { render json: @todo.errors, status: :unprocessable_entity }
    end
  end
end


  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      flash[:success] = 'El deber fue eliminado'
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :notes)
    end
end
