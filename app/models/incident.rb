class Incident
  include MongoMapper::Document

  key :reporter,		String
  key :particpants,	String
  key	:report,			Text

  timestamps!
  userstamps!
end