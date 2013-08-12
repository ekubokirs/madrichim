class Teacher
  include MongoMapper::Document

  key :first_name, String
  key :last_name, String
  key :email, String

end
