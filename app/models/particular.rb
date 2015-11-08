class Particular < ActiveRecord::Base
  belongs_to :plan

  self.inheritance_column = :type

  scope :pwhiches, -> { where(type: 'Pwhich') }
  scope :pwhens , -> { where(type: 'Pwhen') }
  scope :pwheres , -> { where(type: 'Pwhere') }

  def self.types
    %w(Pwhen Pwhere Pwhich)
  end

end
