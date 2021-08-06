class MytaskController < ApplicationController
  before_action :get_projects, only: [:my_open_tasks, :my_completed_tasks]

  def all_project_ids
    self.projects.pluck(:id)
  end

  def my_open_tasks
    # Filter in db
    if logged_in?
      user = current_user
      @items = current_user.all_visible_items.mytask(user)
      users = User.where("id in (#{@items.select(:assignees).distinct.to_sql})")
      @users = Hash[users.collect { |user| [user.id, user] } ]
    else
      redirect_to login_path
    end
  end

  def my_completed_tasks
    if logged_in?
      user = current_user
      @completed_items = current_user.all_visible_items.completed_task(user)
      users = User.where("id in (#{@completed_items.select(:assignees).distinct.to_sql})")
      @users = Hash[users.collect { |user| [user.id, user] } ]
    else
      redirect_to login_path
    end
  end

  private
  def get_projects
    # pp params[:list][:project_id]
    @projects = current_user.projects
  end
end
