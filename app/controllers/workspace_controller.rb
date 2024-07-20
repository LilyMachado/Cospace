# app/controllers/workspace_controller.rb
class WorkspaceController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :destroy, :edit_availability, :update_availability]

  def index
    @workspaces = Workspace.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workspaces, methods: [:latitude, :longitude] }
    end
  end


  def show
    @workspace = Workspace.find(params[:id])  

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workspace }
    end
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user = current_user

    if @workspace.save
      redirect_to @workspace, notice: 'Workspace was successfully created.'
    else
      render :new
    end
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
    redirect_to workspaces_url, notice: 'Workspace was successfully destroyed.'
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
    params.require(:workspace).permit(:name, :description, :location, :price, :availability)
  end

  def availability_params
    params.require(:workspace).permit(:availability)
  end
end
