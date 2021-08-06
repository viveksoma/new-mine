class ListsController < ApplicationController
  # Allow only if there is a current user
  before_action :set_project, only: [:index, :show, :create, :destroy]
  before_action :get_list, only: [:show, :destroy]

  def index
    @lists = @project.lists
    @list = @project.lists.build
  end

  def show
    # Scope list
    
    redirect_to project_list_items_path(@project, @list)
  end

  def create
    @list = @project.lists.build(list_params)
    if @list.save
      flash[:success] = "List created!"
      redirect_to project_list_url(@project, @list)
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@project), notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    # pp params[:list][:project_id]
    @project = current_user.projects.get_project(params[:project_id]).first
    if @project.nil?
      redirect_to root_path
    end
  end
    # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:name)
  end

  def get_list
    @list = @project.lists.get_list(params[:id]).first
    if @list.nil?
      redirect_to project_lists_path(@project)
    end
  end
end
  
