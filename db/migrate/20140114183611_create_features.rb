class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.text :descripion
      t.references :project, index: true

      t.timestamps
    end
  end
end
