class SayingsController < ApplicationController
  # GET /sayings
  # GET /sayings.xml
  def index
    @sayings = Saying.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sayings }
    end
  end

  # GET /sayings/1
  # GET /sayings/1.xml
  def show
    @saying = Saying.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @saying }
    end
  end

  # GET /sayings/new
  # GET /sayings/new.xml
  def new
    @saying = Saying.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @saying }
    end
  end

  # GET /sayings/1/edit
  def edit
    @saying = Saying.find(params[:id])
  end

  # POST /sayings
  # POST /sayings.xml
  def create
    @saying = Saying.new(params[:saying])

    respond_to do |format|
      if @saying.save
        format.html { redirect_to(@saying, :notice => 'Saying was successfully created.') }
        format.xml  { render :xml => @saying, :status => :created, :location => @saying }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @saying.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sayings/1
  # PUT /sayings/1.xml
  def update
    @saying = Saying.find(params[:id])

    respond_to do |format|
      if @saying.update_attributes(params[:saying])
        format.html { redirect_to(@saying, :notice => 'Saying was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @saying.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sayings/1
  # DELETE /sayings/1.xml
  def destroy
    @saying = Saying.find(params[:id])
    @saying.destroy

    respond_to do |format|
      format.html { redirect_to(sayings_url) }
      format.xml  { head :ok }
    end
  end
end
