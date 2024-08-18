class Student < ApplicationRecord
  validates :name, uniqueness: { scope: :subject, message: "should be unique per subject" }

end