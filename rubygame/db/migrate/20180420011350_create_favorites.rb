class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :user
      t.string :summoner

      t.timestamps null: false
    end
  end
end
