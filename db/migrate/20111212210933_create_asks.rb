class CreateAsks < ActiveRecord::Migration
  def self.up
    create_table :asks do |t|
      t.string :email
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :asks
  end
end
