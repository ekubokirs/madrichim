class TeacherMidYear
	include MongoMapper::Document

	belongs_to :teacher

	key :placement,						String
	key :aid,									String
	key :initiative,					String
	key :behave,							String
	key :reliable, 						String
	key	:srelation,						String
	key	:overall_performance, String
	key :other_teens,					String

	timestamps!
	userstamps!
	
end