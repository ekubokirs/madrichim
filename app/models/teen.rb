class Teen < User

  before_validation :unformat_phone_numbers
  after_validation :format_phone_numbers

  many	:teen_mid_year
  many 	:teen_end_year

  many 	:admin_interviews

  many	:teacher_mid_year
  many	:teacher_end_year

  many  :incidents

  one		:teen_new
  one		:teen_term

	key :born_on,			Date
	key :home_phone,	String
	key :cell_phone,	String

  validates_length_of :home_phone, :cell_phone, is: 10

  def unformat_phone_numbers
    self.home_phone = home_phone.gsub(/\D/, '') if home_phone
    self.cell_phone = cell_phone.gsub(/\D/, '') if cell_phone
    if home_phone.length > 10
      self.home_phone = home_phone[-10..-1]
    end
    if cell_phone.length > 10
      self.cell_phone = cell_phone[-10..-1]
    end
  end

  def format_phone_numbers
    self.home_phone = home_phone.gsub(/([\d]{3})([\d]{3})([\d]{4})/, '(\1) \2-\3') if home_phone
    self.cell_phone = cell_phone.gsub(/([\d]{3})([\d]{3})([\d]{4})/, '(\1) \2-\3') if cell_phone
  end
end