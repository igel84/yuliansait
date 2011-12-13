class AddAdmin < ActiveRecord::Migration
  def self.up
  u = User.new
    u.name='igel'
    u.pass='yfcntymrf'
    u.save

  end

  def self.down
  end
end
