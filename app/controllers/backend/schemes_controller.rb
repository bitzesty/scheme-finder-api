class Backend::SchemesController < ApplicationController
  before_action :set_backend_scheme, only: [:show, :edit, :update, :destroy]

  # GET /backend/schemes
  # GET /backend/schemes.json
  def index
    @backend_schemes = Backend::Scheme.all
  end

  # GET /backend/schemes/1
  # GET /backend/schemes/1.json
  def show
  end

  # GET /backend/schemes/new
  def new
    @backend_scheme = Backend::Scheme.new
  end

  # GET /backend/schemes/1/edit
  def edit
  end

  # POST /backend/schemes
  # POST /backend/schemes.json
  def create
    @backend_scheme = Backend::Scheme.new(backend_scheme_params)

    respond_to do |format|
      if @backend_scheme.save
        format.html { redirect_to @backend_scheme, notice: 'Scheme was successfully created.' }
        format.json { render action: 'show', status: :created, location: @backend_scheme }
      else
        format.html { render action: 'new' }
        format.json { render json: @backend_scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/schemes/1
  # PATCH/PUT /backend/schemes/1.json
  def update
    respond_to do |format|
      if @backend_scheme.update(backend_scheme_params)
        format.html { redirect_to @backend_scheme, notice: 'Scheme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backend_scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/schemes/1
  # DELETE /backend/schemes/1.json
  def destroy
    @backend_scheme.destroy
    respond_to do |format|
      format.html { redirect_to backend_schemes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_scheme
      @backend_scheme = Backend::Scheme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_scheme_params
      params.require(:backend_scheme).permit(:had_direct_interactions, :employees_number_range_id)
    end
end
