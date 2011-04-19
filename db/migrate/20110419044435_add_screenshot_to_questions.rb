class AddScreenshotToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :screenshot, :string
  end

  def self.down
    remove_column :questions, :screenshot
  end
end
