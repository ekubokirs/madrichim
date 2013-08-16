class Teen < User

  many	:teen_mid_year
  many 	:teen_end_year

  many 	:admin_interviews

  many	:teacher_mid_year
  many	:teacher_end_year

  one		:teen_new
  one		:teen_term

	key :born_on,			Date
	key :zipcode,			Integer
	key :home_phone,	String
	key :cell_phone,	String
	key :size,				String
end