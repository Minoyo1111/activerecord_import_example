class ImportDataAJob < ApplicationJob
  queue_as :default

  # 一次儲存一筆資料
  def perform
    Pokemon.delete_all

    CSV.foreach(csv_path, headers: true) do |row|
      Pokemon.create(
        name: row["Name"],
        location: row["Location"],
        level: row["Level"].to_i
      )
    end
  end
end
