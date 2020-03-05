class LinkMapsController < ApplicationController
  before_action :set_link_map, only: [:show, :edit, :update, :destroy]

  # GET /link_maps
  # GET /link_maps.json
  def index
    @link_maps = LinkMap.all
  end

  # GET /link_maps/1
  # GET /link_maps/1.json
  def show
  end

  def redirect
    @link_map = LinkMap.find_by_short_data(params[:short_data])
    render 'errors/404', status: 404 if @link_map.nil?

    @link_map.update_attribute(:clicks, @link_map.clicks + 1)
    redirect_to @link_map.original_url
  end

  # GET /link_maps/new
  def new
    @link_map = LinkMap.new
  end

  # GET /link_maps/1/edit
  def edit
  end

  # POST /link_maps
  # POST /link_maps.json
  def create
    @link_map = LinkMap.new(link_map_params)

    respond_to do |format|
      if @link_map.save_record!
        format.html { redirect_to @link_map, notice: 'Link map was successfully created.' }
        format.json { render :show, status: :created, location: @link_map }
      else
        format.html { render :new }
        format.json { render json: @link_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /link_maps/1
  # PATCH/PUT /link_maps/1.json
  def update
    respond_to do |format|
      if @link_map.update(link_map_params)
        format.html { redirect_to @link_map, notice: 'Link map was successfully updated.' }
        format.json { render :show, status: :ok, location: @link_map }
      else
        format.html { render :edit }
        format.json { render json: @link_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_maps/1
  # DELETE /link_maps/1.json
  def destroy
    @link_map.destroy
    respond_to do |format|
      format.html { redirect_to link_maps_url, notice: 'Link map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_map
      @link_map = LinkMap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def link_map_params
      params.require(:link_map).permit(:original_url, :short_data, :clicks)
    end
end
