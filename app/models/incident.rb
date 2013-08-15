class Incident
  include MongoMapper::Document

  key :participant,	Array
  key	:report,			String

  timestamps!
end