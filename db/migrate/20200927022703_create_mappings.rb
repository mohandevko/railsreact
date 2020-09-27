class CreateMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :mappings do |t|
      t.integer :pri
      t.text :question
      t.string :teaming_tages
      t.integer :appears
      t.integer :frequency
      t.string :type_of_data
      t.string :role
      t.string :required
      t.string :conditions
      t.string :mapping

      t.timestamps
    end
  end
end
