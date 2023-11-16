class Paper < ApplicationRecord
  belongs_to :category, counter_cache: true
  has_many :comments
  has_many :genres_papers
  has_many :genres, through: :genres_papers
  has_one_attached :image
  has_many :ratings
  belongs_to :student
  has_and_belongs_to_many :paper_read_status,
                          join_table: 'paper_read_status',
                          class_name: 'Student',
                          inverse_of: :paper_read_status

  # Validations
  validates :name  ,length: { maximum: 30 }
  validates :name  ,length: { maximum: 30 }
  validates_presence_of :language
  validate :release_date_not_in_past

  #======================= Scopes ========================================
  scope :between_dates, ->(start_date, end_date) {
    where('release_date <= ? AND release_date >= ?', end_date, start_date)
  }

  #======================== Methods ==============================================================

  def release_date_not_in_past
    return if release_date > Date.today

    errors.add(:release_date, 'invalid release date')
  end
end
