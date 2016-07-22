class DataImportBenchmarkJob < ApplicationJob
  require 'benchmark'
  queue_as :default

  def perform
    ActiveRecord::Base.logger = nil
    FakeDataJob.new.perform(50000)
    results = Benchmark.bm do |x|
      x.report("A:")   { ImportDataAJob.new.perform }
      x.report("B:")   { ImportDataBJob.new.perform }
      x.report("C:")   { ImportDataCJob.new.perform }
      x.report("D:")   { ImportDataDJob.new.perform }
      x.report("E:")   { ImportDataEJob.new.perform }
      x.report("F:")   { ImportDataFJob.new.perform }
    end
  end
end
