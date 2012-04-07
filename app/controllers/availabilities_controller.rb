class AvailabilitiesController < ApplicationController
  
  before_filter :authenticate, :only => [ :index, :new, :create, :show, :edit, :update, :destroy ]
  
  # GET /availabilities
  # GET /availabilities.json
  def index
    @title = "availabilities"
    @availabilities = Availability.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @availabilities }
    end
  end

  # GET /availabilities/1
  # GET /availabilities/1.json
  def show
    @title = "availability"
    @availability = Availability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @availability }
    end
  end

  # GET /availabilities/new
  # GET /availabilities/new.json
  def new
    @title = "availability/new"
    @availability = Availability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @availability }
    end
  end

  # GET /availabilities/1/edit
  def edit
    @title = "availability/edit"
    @availability = Availability.find(params[:id])
    return redirect_to :action => :index unless (admin? || @availability.user == current_user)
  end

  # POST /availabilities
  # POST /availabilities.json
  def create
    @availability = Availability.new(params[:availability])
    @availability.user = current_user
    
    respond_to do |format|
      if @availability.save
        format.html { redirect_to :action => :index, notice: 'Availability was successfully created.' }
        format.json { render json: @availability, status: :created, location: @availability }
      else
        format.html { render action: "new" }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /availabilities/1
  # PUT /availabilities/1.json
  def update
    @availability = Availability.find(params[:id])
    return redirect_to :action => :index unless (admin? || @availability.user == current_user)
    
    respond_to do |format|
      if @availability.update_attributes(params[:availability])
        format.html { redirect_to :action => :index, notice: 'Availability was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availabilities/1
  # DELETE /availabilities/1.json
  def destroy
    @availability = Availability.find(params[:id])
    return redirect_to :action => :index unless (admin? || @availability.user == current_user)
    @availability.destroy

    respond_to do |format|
      format.html { redirect_to availabilities_url }
      format.json { head :ok }
    end
  end
end
