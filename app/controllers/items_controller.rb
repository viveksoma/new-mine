class ItemsController < ApplicationController
  before_action :set_project, only: [:index, :create, :destroy, :update]
  before_action :set_list, only: [:index, :create, :destroy, :update]
  before_action :get_item, only: [:destroy, :update]

  def index
    @item = @list.items.build
    @user = @project.user
    @lists = @project.lists
  end

  def create
    # Validate type and parent_id
    if Item.is_deliverable_type?(item_params[:type])
      @item = @list.items.build(item_params)
      pp @item
      if @item.save
        flash[:success] = "Item created!"
        redirect_to project_list_url(@list.project_id, @list)
      end
    end
  end

  def update
    @item.assignees = params[:item][:assignees] == '1' ? current_user.id : "" if item_params.include?('assignees')
    @item.is_completed = params[:item][:is_completed] == '1' ? true : false if item_params.include?('is_completed')
    @item.estimate = params[:item][:estimate] if item_params.include?('estimate')
    respond_to do |format|
      if @item.save
        format.html { redirect_to project_list_url(@list.project_id, @list), notice: 'Assignee added successfully.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to project_list_url(@list.project_id, @list), notice: 'List was successfully destroyed.' }
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
  def set_list
    # project = current_user.projects.find_by(id: params[:project_id])
    @list = @project.lists.get_list(params[:list_id]).first
    if @list.nil?
      redirect_to project_lists_path(@project)
    end
  end

  def item_params
    params.require(:item).permit(:content, :project_id, :parent_id, :type, :assignees, :is_completed, :estimate)
  end

  def get_item
    @item = @list.items.get_item(params[:id]).first
    if @item.nil?
      redirect_to project_list_items_path(@project, @list)
    end
  end
end
