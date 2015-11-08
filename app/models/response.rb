class Response < ActiveRecord::Base
  belongs_to :person
  belongs_to :plan
  has_many :answers, :dependent => :destroy
end
