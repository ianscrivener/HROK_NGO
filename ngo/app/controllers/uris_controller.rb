class UrisController < ApplicationController
  # GET /uris
  # GET /uris.json
  def index
    @uris = Uri.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uris }
    end
  end

  # GET /uris/1
  # GET /uris/1.json
  def show
    @uri = Uri.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @uri }
    end
  end

  # GET /uris/new
  # GET /uris/new.json
  def new
    @uri = Uri.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @uri }
    end
  end

  # GET /uris/1/edit
  def edit
    @uri = Uri.find(params[:id])
  end

  # POST /uris
  # POST /uris.json
  def create
    @uri = Uri.new(params[:uri])

    respond_to do |format|
      if @uri.save
        format.html { redirect_to @uri, notice: 'Uri was successfully created.' }
        format.json { render json: @uri, status: :created, location: @uri }
      else
        format.html { render action: "new" }
        format.json { render json: @uri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uris/1
  # PUT /uris/1.json
  def update
    @uri = Uri.find(params[:id])

    respond_to do |format|
      if @uri.update_attributes(params[:uri])
        format.html { redirect_to @uri, notice: 'Uri was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @uri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uris/1
  # DELETE /uris/1.json
  def destroy
    @uri = Uri.find(params[:id])
    @uri.destroy

    respond_to do |format|
      format.html { redirect_to uris_url }
      format.json { head :no_content }
    end
  end
end
