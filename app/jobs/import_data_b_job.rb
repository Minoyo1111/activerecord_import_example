class ImportDataBJob < ApplicationJob
  queue_as :default

  # 一次儲存一筆資料，用 transaction 包起來
  def perform
    Pokemon.delete_all

    ActiveRecord::Base.transaction do
      CSV.foreach(csv_path, headers: true) do |row|
        Pokemon.create(
          name: row["Name"],
          location: row["Location"],
          level: row["Level"].to_i
        )
      end
    end
  end
end
