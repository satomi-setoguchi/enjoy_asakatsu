class Record < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :date, presence: true
  validates :started_time, presence: true
  validates :finished_time, presence: true
  validates :content, length: { maximum: 255 }
  validates :memo, length: { maximum: 65_535 }

  def active_time
    if self.finished_time >= self.started_time
      active_time = self.finished_time - self.started_time
    else
      active_time = (self.finished_time - self.started_time) + (24 * 60 * 60)
    end
  end
end
