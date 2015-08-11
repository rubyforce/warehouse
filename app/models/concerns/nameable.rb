module Nameable
  extend ActiveSupport::Concern

  included do
    def name
      [title.to_s, first_name.to_s, last_name.to_s, middle_name.to_s].map(&:strip).reject(&:blank?).join(' ')
    end

    def name=(full_name)
      names = full_name.to_s.split(/ /)
      self.first_name  = names[0]
      self.last_name   = names[1]
      self.middle_name = names[2]
    end
  end

end

