class Teen < User

  many	:teen_mid_year
  many 	:teen_end_year
  one		:teen_new
  one		:teen_end

	key :born_on,			Date
	key :zipcode,			Integer
	key :home_phone,	String
	key :cell_phone,	String
	key :size,				String
end