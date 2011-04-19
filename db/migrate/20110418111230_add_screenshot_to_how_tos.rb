class AddScreenshotToHowTos < ActiveRecord::Migration
  def self.up
    add_column :how_tos, :screenshot, :string
  end

  def self.down
    remove_column :how_tos, :screenshot
  end
end
