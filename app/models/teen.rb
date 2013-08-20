class Teen < User

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
end