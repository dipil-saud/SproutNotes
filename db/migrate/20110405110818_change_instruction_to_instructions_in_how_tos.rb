class ChangeInstructionToInstructionsInHowTos < ActiveRecord::Migration
  def self.up
    rename_column :how_tos, :instruction, :instructions
  end

  def self.down
    rename_column :how_tos,  :instructions, :instruction
  end
end
