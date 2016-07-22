class ImportDataDJob < ApplicationJob
  queue_as :default

  # 一次儲存所有資料（使用 activerecord-import）
  def perform
    Pokemon.delete_all

    data_array = CSV.foreach(csv_path, headers: true).map do |row|
      Pokemon.new(
        name: row["Name"],
        location: row["Location"],
        level: row["Level"].to_i
      )
    end

    columns = [:name, :location, :level]
    Pokemon.import columns, data_array, validate: true
  end
end
