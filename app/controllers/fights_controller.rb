class FightsController < ApplicationController
  before_action :set_fight, only: :show

  # GET /fights
  def index
    @fights = Fight.all.order(created_at: :desc)
  end

  # GET /fights/1
  def show
  end

  # GET /fights/new
  def new
    @fight = Fight.new
    2.times { @fight.fight_participations.build }
  end

  # POST /fights
  def create
    @fight = Fight.new(fight_params)
    respond_to do |format|
      if @fight.save && battle(@fight)
        format.html { redirect_to @fight }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def battle(fight)
    offset = rand(fight.fight_participations.count)
    hitter_participation_first = fight.fight_participations.offset(offset).first
    hitter_participation_second = fight.fight_participations.where.not(id: hitter_participation_first.id).first
    while hitter_participation_first.full_life_points > 0 && hitter_participation_second.full_life_points > 0
      hit = hitter_participation_first.hits.create()
      hitter_participation_second.full_life_points -= hit.damage
      if hitter_participation_second.full_life_points > 0
        hit = hitter_participation_second.hits.create()
        hitter_participation_first.full_life_points -= hit.damage
      end
    end
    if hitter_participation_first.full_life_points > 0
      fight.update(winner: hitter_participation_first.fighter)
      winner = hitter_participation_first.fighter
      loser = hitter_participation_second.fighter
    else
      fight.update(winner: hitter_participation_second.fighter)
      winner = hitter_participation_second.fighter
      loser = hitter_participation_first.fighter
    end
    winner.update(experience_points: winner.experience_points + 2)
    loser.update(experience_points: loser.experience_points + 1)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fight_params
      params.require(:fight).permit(
        fight_participations_attributes: [
          :fighter_id,
          fight_participation_weapons_attributes: [
            :equipment_id
          ],
          fight_participation_shields_attributes: [
            :equipment_id
          ]
        ]
      )
    end
end
