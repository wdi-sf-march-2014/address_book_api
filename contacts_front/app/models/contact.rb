class Contact < ActiveRecord::Base
  belongs_to :user
  attr_accessor :subject
  attr_accessor :body

end
