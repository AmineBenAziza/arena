class ChangeColumnsDefault < ActiveRecord::Migration[7.0]
  def change
    # set up defaults to fighters
    change_column_default :fighters, :life_points, from: nil, to: 100
    change_column_default :fighters, :attack_points, from: nil, to: 1
    change_column_default :fighters, :experience_points, from: nil, to: 0
    # set up defaults to equipment
    change_column_default :equipment, :attack_points, from: nil, to: 0
    change_column_default :equipment, :defense_points, from: nil, to: 0
  end
end
