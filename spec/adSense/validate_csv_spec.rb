require 'growth_channel/google_ads/validate_format_csv'

RSpec.describe 'Validate_Format::Validate' do

  context "Validação" do

    context 'csv válido' do

      it 'com cabecalho' do
        #DADO
        csv_valido = 'spec/suports/report_adsense.csv'

        #QUANDO
        validate = Validate_Format::Validate.new(csv_valido).validate_csv

        #ENTÃO
        result = "CSV válido"

        expect(validate).to eq(result)
      end

      it 'com cabecalho posicao diferente' do
        #DADO
        csv_valido = 'spec/suports/csv_validos/report_adsense_com_posicao_diferente.csv'

        #QUANDO
        validate = Validate_Format::Validate.new(csv_valido).validate_csv

        #ENTÃO
        result = "CSV válido"

        expect(validate).to eq(result)
      end

    end

    context "csv inválido" do

      it 'sem cabecalho' do
        #DADO
        csv_invalido = 'spec/suports/csv_invalidos/report_adsense_sem_cabecalho.csv'

        #QUANDO
        validate = Validate_Format::Validate.new(csv_invalido).validate_csv

        #ENTÃO
        result = "CSV inválido"
        expect(validate).to eq(result)
      end

    end

  end

end
