class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.text :description
      t.boolean :background
      t.references :feature, index: true

      t.timestamps
    end
  end
end
