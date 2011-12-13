class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name      
      t.string :pass
      t.boolean :admin, :default => 'false'

      t.timestamps
    end
    create_table :mails do |t|
      t.string :mail      
      t.string :pass
      t.references :user
      t.timestamps
    end
	
    u = User.new
    u.name='igel'
    u.pass='yfcntymrf'
    u.save
  end

  def self.down
    drop_table :mails
    drop_table :users
  end
end
