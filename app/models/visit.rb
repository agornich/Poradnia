class Visit < ActiveRecord::Base
  belongs_to :patient
  belongs_to :employee
  belongs_to :office
  belongs_to :workshop
  
  validates :start_at, presence: true
  validates_presence_of :patient_id
  
    validate :compare_date
    validate :compare_office
    validate :compare_patients
    validate :new_visit_date_cannot_be_in_the_past

  def new_visit_date_cannot_be_in_the_past
    if start_at.present? && start_at < Time.current
      errors.add(:start_at, " , Data nowej wizyty nie może mieć miejsca w przeszłości")
    end
  end


  def order_by_date
    @visit = Visits.sortby(:start_at)

  end
  
  def compare_date
    if employee && employee.visits.where(start_at: start_at).exists?
      errors.add(:start_at, ", ponieważ specjalista ma już wizytę w tym terminie.")
    end 
  end

def compare_office
  if office && office.visits.where(start_at: start_at).exists?
      errors.add(:start_at, ", ponieważ gabinet jest zajety w tym czasie")
    end 
  end

def compare_patients
  if patient && patient.visits.where(start_at: start_at).exists?
    errors.add(:start_at, ", ponieważ pacjent jest zajety w tym czasie")
    end 
  end

  end
