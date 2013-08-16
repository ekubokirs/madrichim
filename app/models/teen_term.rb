class TeenTerm
  include MongoMapper::Document

  belongs_to :teen

  key :leave,		String
  key :change,	String
  key :same,		String
  key :grow,		String
  key :learn,		String
  key :life,		String

end
