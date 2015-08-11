class Standard < ActiveRecord::Base
  has_many :students, dependent: :destroy

  has_many :fees_heads_standards
  has_many :fees_heads, through: :fees_heads_standards

  accepts_nested_attributes_for :fees_heads_standards
end
