class Particular < ActiveRecord::Base
  belongs_to :plan

  self.inheritance_column = :type

  scope :pwhiches, -> { where(type: 'Pwhich') }
  scope :pwhens , -> { where(type: 'Pwhens') }
  scope :pwheres , -> { where(type: 'Pwheres') }

  def self.types
    %w(Pwhen Pwhere Pwhich)
  end

end
