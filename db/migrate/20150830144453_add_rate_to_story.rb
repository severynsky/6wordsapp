class AddRateToStory < ActiveRecord::Migration
  def change
    add_column :stories, :rate, :integer
  end
end
