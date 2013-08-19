class TeenEndYear
	include MongoMapper::Document

	belongs_to :teen

	key	:placement,	String
	key :school,		String
	key :grade, 		String
	key	:size,			String
	key	:change,		String
	key	:same,			String
	key	:grow,			String
	key :days,			Array
	key :youth,			String
	key	:assign,		Array
	key	:request,		String
	key	:desc,			String

	timestamps!
end