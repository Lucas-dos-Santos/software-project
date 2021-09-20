class Project < ApplicationRecord
  has_many :activities, dependent: :destroy
  validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 5 }
  validates :name, :start_date, :end_date, presence: true
  validates :end_date,
            date: { after: :start_date }

  def porcentage
    num_finished = finished_count
    num_total = activities.count
    num_finished * 100 / num_total
  end

  def finished_count
    num_total = activities
    count = 0
    num_total.each do |activity|
      count += 1 if activity.finished
    end
    count
  end

  def late?
    activity = activities
    late = false
    activity.each do |act|
      late = Date.new(act.end_date.to_i).to_time.to_i > Date.new(end_date.to_i).to_time.to_i
    end
    late
  end

  def self.total_late
    count = 0
    Project.all.each do |project|
      count += 1 if project.late?
    end
    count
  end
end
