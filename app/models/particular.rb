class Particular < ActiveRecord::Base
  belongs_to :plan
  has_many :choices, :dependent => :destroy

  accepts_nested_attributes_for :choices, :allow_destroy => true

  self.inheritance_column = :type

  scope :pwhiches, -> { where(type: 'Pwhich') }
  scope :pwhens , -> { where(type: 'Pwhen') }
  scope :pwheres , -> { where(type: 'Pwhere') }

  def self.types
    %w(Pwhen Pwhere Pwhich)
  end

end
