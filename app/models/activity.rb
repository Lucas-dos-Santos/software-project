class Activity < ApplicationRecord
  belongs_to :project
  validates :project_id, :name_activity, :start_date, :end_date, presence: true
  validates :end_date,
            date: { after: :start_date }

  def self.activities_finished
    total = Activity.all
    count = 0
    total.each do |activity|
      count += 1 if activity.finished
    end
    count
  end
end
