class CreateStrains < ActiveRecord::Migration
  def self.up
    create_table :strains do |t|
      t.string :name
      t.integer :density
      t.integer :trim
      t.string :genome
      t.references :dispensary

      t.timestamps
    end
  end

  def self.down
    drop_table :strains
  end
end
