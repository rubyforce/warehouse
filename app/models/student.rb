class Student < ActiveRecord::Base
  belongs_to :admission
  belongs_to :religion
  belongs_to :caste
  belongs_to :standard
  belongs_to :division
  belongs_to :transport
  belongs_to :finance_mode
  belongs_to :place_of_birth
  belongs_to :academic_year

  has_many :students_fees_heads, :dependent => :destroy
  has_many :fees_heads, through: :students_fees_heads

  has_many :receipts, :dependent => :destroy

  accepts_nested_attributes_for :students_fees_heads, :allow_destroy => true

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
