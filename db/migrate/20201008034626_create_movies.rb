class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :src
      t.date   :video_created_at

      t.timestamps
    end
  end
end
