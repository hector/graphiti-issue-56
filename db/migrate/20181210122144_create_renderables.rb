class CreateRenderables < ActiveRecord::Migration[5.2]
  def change
    create_table :renderables do |t|
      t.string :name
      t.string :type, null: false
      t.belongs_to :project

      t.timestamps
    end
  end
end
