class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :destroy, :edit_availability, :update_availability]

  def index
    # If a location is provided in the search, find workspaces near the location within a 10 km radius
    if params[:location].present?
      @workspaces = Workspace.near(params[:location], 10) # 10 km radius
    else
      # If no location is provided, display all workspaces
      @workspaces = Workspace.all
    end
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      redirect_to @workspace, notice: 'Workspace was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @workspace.update(workspace_params)
      redirect_to @workspace, notice: 'Workspace was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @workspace.destroy
    redirect_to workspaces_path, notice: 'Workspace was successfully deleted.'
  end

  def edit_availability
  end

  def update_availability
    if @workspace.update(availability_params)
      redirect_to @workspace, notice: 'Availability was successfully updated.'
    else
      render :edit_availability
    end
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:name, :description, :price, :location, :amenities, :available_from, :available_to, :host, photos: [])
  end
end
