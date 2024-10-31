class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
