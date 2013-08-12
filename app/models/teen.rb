class Teen < User
  include MongoMapper::Document

	key :born_on,			Date
	key :zipcode,			Integer
	key :home_phone,	String
	key :cell_phone,	String
	key :size,				String
end