class Choice < ActiveRecord::Base
  belongs_to :particular
  has_many :answers
end
