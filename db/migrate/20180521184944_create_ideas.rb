class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :content
      t.string :title

      t.timestamps
    end
  end
end
