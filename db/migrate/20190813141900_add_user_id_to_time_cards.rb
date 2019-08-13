class AddUserIdToTimeCards < ActiveRecord::Migration[5.0]
  def change
    add_reference :time_cards, :user, foreign_key: true
  end
end
