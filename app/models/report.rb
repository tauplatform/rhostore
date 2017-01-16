class Report < ActiveRecord::Base
  attr_accessible :upc, :productName, :damageReason, :employeeId, :picture0Uri, :picture1Uri, :signature0Uri
end
