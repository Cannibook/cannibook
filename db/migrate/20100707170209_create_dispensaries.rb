class CreateDispensaries < ActiveRecord::Migration
  def self.up
    create_table :dispensaries do |t|
      t.column :name, :string
      t.column :street, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :string
      t.column :lng, :float
      t.column :lat, :float

      t.timestamps
    end
  end

  def self.down
    drop_table :dispensaries
  end
end
