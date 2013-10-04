class Retreat
	include MongoMapper::Document

	belongs_to :teen

	key	:want,						String
	key	:bedtime,					String
	key	:early,						String
	key	:better,					String
	key	:homesickness,		String
	key	:afraid,					String
	key	:concern,					String

	timestamps!

end