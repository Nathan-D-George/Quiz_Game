class Quiz < ApplicationRecord

  has_many :scores
  
  enum difficulty: %i[easy medium hard]

end
