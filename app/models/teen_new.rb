class TeenNew
	include MongoMapper::Document

	belongs_to :teen

	key :size,		String
	key :school,	String
	key	:grade,		String
	key	:join,		String
	key :goal,		String
	key :jact,		String
	key :act,			String
	key :days,		Array
	key :youth,		String
	key	:assign,	Array

	timestamps!
	userstamps!
end