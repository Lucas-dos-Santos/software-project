class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.belongs_to :project
      t.string :name_activity
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
