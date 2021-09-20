class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show; end

  # GET /activities/new
  def new
    @activity = Activity.new
    @projects = Project.all
  end

  # GET /activities/1/edit
  def edit; end

  # POST /activities or /activities.json
  def create
    @projects = Project.all
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    redirect_to root_path if @activity.update(finished: @activity.toggle(:finished))
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy
    flash[:notice] = 'Atividade apagada com sucesso!'
    redirect_to project_path(@activity.project_id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(:project_id, :name_activity, :start_date, :end_date, :finished)
  end
end
