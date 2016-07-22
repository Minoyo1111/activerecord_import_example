class ApplicationJob < ActiveJob::Base
  def csv_path
    File.join Rails.root, "fake_data.csv"
  end
end
