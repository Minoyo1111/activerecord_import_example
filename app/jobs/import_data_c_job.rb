class ImportDataCJob < ApplicationJob
  queue_as :default

  # 一次儲存所有資料（使用 Rails 預設方式）
  # 把資料包成 hash 的鎮列再一次存進去
  def perform
    Pokemon.delete_all

    data_array = CSV.foreach(csv_path, headers: true).map do |row|
      {
        name: row["Name"],
        location: row["Location"],
        level: row["Level"].to_i
      }
    end

    Pokemon.create(data_array)
  end
end
