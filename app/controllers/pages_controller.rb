class PagesController < ApplicationController
  def projects
    @projects = Project.all
  end

  def dashboard
    @total_projects = Project.all.count
    @delayed_projects = Project.total_late
    @in_day = @total_projects - @delayed_projects

    @total_activities = Activity.all.count
    @total_finished = Activity.activities_finished
    @total_open = @total_activities - @total_finished
  end
end
