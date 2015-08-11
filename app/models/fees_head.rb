class FeesHead < ActiveRecord::Base
  has_many :students_fees_heads
  has_many :students, through: :students_fees_heads
  accepts_nested_attributes_for :students

  has_many :fees_heads_standards
  has_many :standards, through: :fees_heads_standards

  accepts_nested_attributes_for :fees_heads_standards, allow_destroy: true

  belongs_to :fees_head_type
  belongs_to :fees_head_recurrence

  before_save :total

  private

  def total
    self.total_amount = amount
  end
end
