class EquipmentController < ApplicationController
  before_action :set_equipment, only: %i[ show edit update destroy ]

  # GET /equipments
  def index
    if params[:type] == "Weapon"
      @equipment = Weapon.all
    elsif params[:type] == "Shield"
      @equipment = Shield.all
    else
      @equipment = Equipment.all
    end
  end

  # GET /equipments/1
  def show
  end

  # GET /equipments/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipments/1/edit
  def edit
  end

  # POST /equipments
  def create
    if params[:weapon].present?
      @equipment = Weapon.new(weapon_params)
    elsif params[:shield].present?
      @equipment = Shield.new(shield_params)
    else
      @equipment = Equipment.new(equipment_params)
    end

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: "equipment crée" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipments/1
  def update
    respond_to do |format|
      if @equipment.update(send("#{@equipment.class.name.downcase}_params"))
        format.html { redirect_to @equipment, notice: "equipement modifier" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipments/1
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_path(type: @equipment.class.name), notice: "equipement supprimer" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_params
      params.require(:equipment).permit(:name, :attack_points, :defense_points, :type)
    end

    # Only allow a list of trusted parameters through.
    def weapon_params
      params.require(:weapon).permit(:name, :attack_points, :defense_points)
    end

    # Only allow a list of trusted parameters through.
    def shield_params
      params.require(:shield).permit(:name, :defense_points)
    end
end
