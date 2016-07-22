class FakeDataJob < ApplicationJob
  require 'csv'
  queue_as :default

  def perform
    path = File.join Rails.root, "fake_data.csv"
    CSV.open(path, "w") do |csv|
      csv << ["Name", "Location", "Level"]
      50000.times do |n|
        csv << [
          Faker::Pokemon.name,
          Faker::Pokemon.location,
          Faker::Number.between(1, 99)
        ]
      end
    end
  end
end
