class Incident
  include MongoMapper::Document

  belongs_to :user

  key :participants,	Array
  key	:report,				String
  key	:otherp,				String

  timestamps!

  def part_names
  	User.find(participants).map(&:full_name).join(", ")
  end
end