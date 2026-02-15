class CreateHealthChecks < ActiveRecord::Migration[8.1]
  def change
    create_table :health_checks do |t|
      t.string :status

      t.timestamps
    end
  end
end
