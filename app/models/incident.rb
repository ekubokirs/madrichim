class Incident
  include MongoMapper::Document

  belongs_to :user

  key :participants,	Array
  key	:report,			String

  timestamps!
end