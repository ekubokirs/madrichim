class TeenEndYear
	include MongoMapper::Document

	belongs_to :teen

	key :school,	String
	key :grade, 	String
	key	:size,		String
	key	:change,	String
	key	:same,		String
	key	:grow,		String
	key :days,		String
	key :youth,		String
	key	:assign,	String

	userstamps!
	
end