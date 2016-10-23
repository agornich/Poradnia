class Employee < ActiveRecord::Base
  authenticates_with_sorcery!
	
  has_many :visits
  validates_presence_of :name, :surname, :specialization
	

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }
  validates :email, uniqueness: true

  def employee_display
    "#{surname} #{name}, #{specialization}"
  end
	
  def employee_display2
    "#{surname} #{name}"
  end
  
  def employee_specialization
    "#{specialization}"
  end
	
end
