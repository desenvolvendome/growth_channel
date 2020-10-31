require 'csv'

module Validate_Format
  class Validate

    def initialize(file_path)
      @file_path = file_path
    end

    def validate_csv
      reports = CSV.read(@file_path)
      expected_header = ['Campanha', 'Visualizações']

      if reports[0].take(2) == expected_header
        reports[0].take(2)
      else
        "CSV invalido, esperado: Campanha, Visualizações"
      end

    end

  end
end