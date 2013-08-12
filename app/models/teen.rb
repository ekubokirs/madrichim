class Teen < User
  include MongoMapper::Document

	key :first_name,	String
  key :last_name,		String
  key :email,				String
	key :born_on,			Date
	key :zipcode,			Integer
	key :home_phone,	String
	key :cell_phone,	String
	key :size,				String

end