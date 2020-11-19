require 'csv'

module Validate_Format
  class Validate

    def initialize(file_path)
      @file_path = file_path
    end

    def validate_csv
      reports = CSV.read(@file_path)

      header_expecteds = ['Campanha', 'Visualizações']

      header = reports.first

      valid = (header - header_expecteds).size < header.size

      if valid
        "CSV válido"
      else
        "CSV inválido"
      end

    end

  end
end
