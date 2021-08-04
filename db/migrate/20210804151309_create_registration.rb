class CreateRegistration < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.references :team, foreign_key: true
      t.references :competition, foreign_key: true

      t.timestamps
    end
  end
end
