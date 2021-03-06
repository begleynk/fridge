class ScenariosController < ApplicationController
  before_action :set_scenario, only: [:show, :edit, :update, :destroy]

  # GET /scenarios/1
  # GET /scenarios/1.json
  def show
    @feature = @scenario.feature
    @project = @feature.project
  end

  # GET /scenarios/new
  def new
    @scenario = Scenario.new
    @feature = Feature.find(params[:feature_id])
    @project = Project.find(params[:project_id])
  end

  # GET /scenarios/1/edit
  def edit
  end

  # POST /scenarios
  # POST /scenarios.json
  def create
    @feature = Feature.find(params[:feature_id]) 
    @scenario = @feature.scenarios.create(scenario_params)
    @project = @feature.project

    respond_to do |format|
      if @scenario.save
        format.html { redirect_to project_feature_path(@project, @feature), notice: 'Scenario was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scenario }
      else
        format.html { render action: 'new' }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenarios/1
  # PATCH/PUT /scenarios/1.json
  def update
    respond_to do |format|
      if @scenario.update(scenario_params)
        format.html { redirect_to @scenario, notice: 'Scenario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenarios/1
  # DELETE /scenarios/1.json
  def destroy
    @scenario.destroy
    respond_to do |format|
      format.html { redirect_to scenarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario = Scenario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scenario_params
      params.require(:scenario).permit(:description, :background, :feature_id)
    end
end
