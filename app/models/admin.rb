class Admin < User
  include MongoMapper::Document

  many :admin_interviews
end
