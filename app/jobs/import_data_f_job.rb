class ImportDataFJob < ApplicationJob
  queue_as :default

  # 一次儲存所有資料（使用 activerecord-import 直接讀 CSV）
  def perform
    Pokemon.delete_all

    data_array = CSV.read(csv_path)
    data_array.shift # 刪除 CSV 的 header

    columns = [:name, :location, :level]
    Pokemon.import columns, data_array, validate: false
  end
end
