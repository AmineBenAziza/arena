class FightersController < ApplicationController
  before_action :set_fighter, only: %i[ show edit update destroy ]

  # GET /fighters
  def index
    if params[:id].present?
      fighters = Fighter.where.not(id: params[:id])
      render :json => fighters.pluck(:id, :name)
    else
      @fighters = Fighter.all
    end
  end

  # GET /fighters/1
  def show
  end

  # GET /fighters/new
  def new
    @fighter = Fighter.new
  end

  # GET /fighters/1/edit
  def edit
  end

  # POST /fighters
  def create
    @fighter = Fighter.new(fighter_params)

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to @fighter, notice: "fighter creé" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fighters/1
  def update
    respond_to do |format|
      if @fighter.update(fighter_params)
        format.html { redirect_to @fighter, notice: "fighter modifié" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fighters/1
  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: "fighter supprimé" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fighter
      @fighter = Fighter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fighter_params
      params.require(:fighter).permit(:name, :life_points, :attack_points, :experience_points, :avatar)
    end


end
