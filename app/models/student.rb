class Student < ApplicationRecord
  #Using scope basically allows you to reuse SQL queries in multiple places. they act like methods which are called on the class
  #Example scope without arguments: 
  #   scope :with_long_title, -> { where("LENGTH(title) > 20") }
  #in the scope defined below, 'name' is the name you're giving the scope, like you give a name to a method
  #the ', ->' separates the name of the scope from the SQL query, which goes in {}
  #a parameter is optional, in this case we're using a parameter of 'name'.
  #this query uses the WHERE clause along with the LIKE operator. The LIKE operator is used within the WHERE clause to search for a specified pattern in a column. % represents multiple characters while _ represents a singular character. 
  #in this case, %name% means values that have the name in any position
  #the query is using bound parameters (?). the values are specified in order after the query string
  scope :by_name, ->(name) {where("first_name LIKE ? OR last_name LIKE ?", "%#{name}%", "%#{name}%")}

  def to_s
    "#{first_name} #{last_name}"
  end

end
