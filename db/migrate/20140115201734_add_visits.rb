class AddVisits < ActiveRecord::Migration
  def up
    create_table :visits do |t|
      t.integer :user_id
      t.integer :shortened_url_id

      t.timestamps
    end
  end

  def down
    drop_table :visits
  end
end
