class FakeDataJob < ApplicationJob
  queue_as :default

  def perform
    CSV.open(csv_path, "w") do |csv|
      csv << ["Name", "Location", "Level"]
      5.times do |n|
        csv << [
          Faker::Pokemon.name,
          Faker::Pokemon.location,
          Faker::Number.between(1, 99)
        ]
      end
    end
  end
end
