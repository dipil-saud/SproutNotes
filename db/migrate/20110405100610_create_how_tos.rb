class CreateHowTos < ActiveRecord::Migration
  def self.up
    create_table :how_tos do |t|
      t.string :title
      t.text :description
      t.string :difficulty
      t.text :instruction
      t.integer :likes
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :how_tos
  end
end
