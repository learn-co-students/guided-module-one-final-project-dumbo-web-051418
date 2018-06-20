class RemoveQuestionMarkFromHasToll < ActiveRecord::Migration[5.0]
  def change
    rename_column :crossings, :has_toll?, :has_toll
  end
end
