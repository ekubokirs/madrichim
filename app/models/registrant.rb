class Registrant
  include MongoMapper::Document

  key :email,					String
  key :code, 					String
  key :expires_at,		Time

end
