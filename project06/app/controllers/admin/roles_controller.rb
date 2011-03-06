class Admin::RolesController < Admin::AdminController
  layout "admin"
  filter_resource_access

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
      flash[:notice] = "Successfully created role."
      redirect_to @role
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @role.update_attributes(params[:role])
      flash[:notice] = "Successfully updated role."
      redirect_to @role
    else
      render :action => 'edit'
    end
  end

  def destroy
    @role.destroy
    flash[:notice] = "Successfully destroyed role."
    redirect_to roles_url
  end
end
