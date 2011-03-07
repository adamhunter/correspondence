class User
  include Correspondence::With

  attr_accessor :id

  corresponds_with :person
end
