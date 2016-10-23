class Workshop < ActiveRecord::Base
  
  has_many :visits
  validates :name, presence: true
  
  def name_with_price
    "#{name}, #{price} PLN"
  end
end
