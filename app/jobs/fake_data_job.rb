class FakeDataJob < ApplicationJob
  queue_as :default

  def perform(num_of_data)
    CSV.open(csv_path, "w") do |csv|
      csv << ["Name", "Location", "Level"]
      num_of_data.times do |n|
        csv << [
          Faker::Pokemon.name,
          Faker::Pokemon.location,
          Faker::Number.between(1, 99)
        ]
      end
    end
  end
end
