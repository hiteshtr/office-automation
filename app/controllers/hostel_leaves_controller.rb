class HostelLeavesController < ApplicationController
  # GET /hostel_leaves
  # GET /hostel_leaves.json
  def index
    @hostel_leaves = HostelLeave.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hostel_leaves }
    end
  end

  # GET /hostel_leaves/1
  # GET /hostel_leaves/1.json
  def show
    @hostel_leafe = HostelLeave.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hostel_leafe }
    end
  end

  # GET /hostel_leaves/new
  # GET /hostel_leaves/new.json
  def new
    @hostel_leafe = HostelLeave.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hostel_leafe }
    end
  end

  # GET /hostel_leaves/1/edit
  def edit
    @hostel_leafe = HostelLeave.find(params[:id])
  end

  # POST /hostel_leaves
  # POST /hostel_leaves.json
  def create
    @hostel_leafe = HostelLeave.new(params[:hostel_leafe])

    respond_to do |format|
      if @hostel_leafe.save
        format.html { redirect_to @hostel_leafe, notice: 'Hostel leave was successfully created.' }
        format.json { render json: @hostel_leafe, status: :created, location: @hostel_leafe }
      else
        format.html { render action: "new" }
        format.json { render json: @hostel_leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hostel_leaves/1
  # PUT /hostel_leaves/1.json
  def update
    @hostel_leafe = HostelLeave.find(params[:id])

    respond_to do |format|
      if @hostel_leafe.update_attributes(params[:hostel_leafe])
        format.html { redirect_to @hostel_leafe, notice: 'Hostel leave was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hostel_leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hostel_leaves/1
  # DELETE /hostel_leaves/1.json
  def destroy
    @hostel_leafe = HostelLeave.find(params[:id])
    @hostel_leafe.destroy

    respond_to do |format|
      format.html { redirect_to hostel_leaves_url }
      format.json { head :no_content }
    end
  end
end
