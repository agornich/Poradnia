class Patient < ActiveRecord::Base
  has_many :visits
  validates_numericality_of :pesel, :only_integer => true,
  :message => " - czy na pewno składa się z samych cyfr?"
  validates_length_of :pesel, :is=> 11,
  :message => " - sprawdź długość, powinien mieć 11 cyfr."
  validates_presence_of :name, :surname, :sex, :phone, :email,
  :message => " - nie może być puste"
  
  validate :birth_date_cannot_be_in_the_future

  def birth_date_cannot_be_in_the_future
    errors.add(:birthdate, ", data urodzenia nie może odnosić się do przyszłości") if
      !birthdate.blank? and birthdate > Date.today
  end

  
  def patient_phone_number
    "Numer telefonu: #{phone}"
  end
  
  def patient_email
    "E-mail: #{email}"
  end
  
  def patient_display
    "#{surname} #{name}, #{pesel}"
  end
  
   def patient_display2
    "#{surname} #{name}"
  end
	
#	def datatime_sort.sort(datetime)
#		datatime = p.start_at.strftime("Data: %d-%m-%Y, Godz. %H:%M ")
#		return datatime.sort
#
#	end
#  
end
