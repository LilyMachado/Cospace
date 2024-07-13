# app/controllers/workspaces_controller.rb

class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :destroy, :edit_availability, :update_availability]

  def index
    @workspaces = Workspace.all
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

  def availability_params
    params.require(:workspace).permit(:available_from, :available_to)
  end
end
