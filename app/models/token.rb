class Token < ActiveRecord::Base
  belongs_to :person
  belongs_to :plan
  self.primary_key = 'id'
end
