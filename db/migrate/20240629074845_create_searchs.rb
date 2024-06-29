class CreateSearchs < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :session_id
      t.string :ip
      t.string :query
    end
  end
end
