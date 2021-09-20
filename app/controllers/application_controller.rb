class ApplicationController < ActionController::Base
  before_action :set_aside

  def set_aside
    @projects_all = Project.all
  end
end
