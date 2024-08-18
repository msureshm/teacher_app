# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

students = ["Alex Johnson", "Jamie Lee", "Taylor Smith", "Jordan Brown", "Casey Davis"]
subjects = %w[
Mathematics
Biology
History
Computer Science
Literature
]
(1..15).each do |i|
  Student.create(name: students.sample, subject: subjects.sample, marks: rand(0..100))
end