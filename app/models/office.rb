class Office < ActiveRecord::Base

  has_many :visits
  validates :name, presence: true
  
  before_destroy :can_be_destroy?
  
  def can_be_destroy?
    if visits.any?
      errors[:base] << "nie mozna usunac"
      return false
    end
  end
end
