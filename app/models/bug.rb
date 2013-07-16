class Bug < ActiveRecord::Base
  # choose one ;)
  
  # no fix yet, rename table ;)
#  self.table_name = "bugs" 

  # fix by using attr_accessible or strong_parameters
#  attr_protected :name

  # fix by using lambda syntax
#  scope :buggy, where(name: "bug")
end
