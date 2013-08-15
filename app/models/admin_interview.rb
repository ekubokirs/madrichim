class AdminInterview
  include MongoMapper::Document

  belongs_to :admin

  belongs_to :teen

  key :self, String
  key :children, String
  key :strength, String
  key :weak, String
  key :challenges, String
  key :groups, String
  key :talent, String
  key :question, String
  key :crying, String
  key :tefillah, String
  key :madrich, String
  key :other, String

  timestamps!

end
