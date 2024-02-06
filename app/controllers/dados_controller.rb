

class DadosController < ApplicationController
  require 'csv'

  def index
    @dados = Dado.all
    @csv_headers = Dado.column_names
  end
  

  def limpar_tela
      Dado.destroy_all
      redirect_to root_path, notice: "Tela limpa com sucesso!"
    end

    def importar
      file = params[:file]
    
      if file.present?
        # Ler o cabeçalho do arquivo CSV
        csv_headers = CSV.open(file.path, 'r') { |csv| csv.first }
    
        # Iterar sobre as linhas do arquivo CSV
        CSV.foreach(file.path, headers: true) do |row|
          # Criar um hash vazio para armazenar os atributos do dado
          dado_attributes = {}
    
          # Iterar sobre cada cabeçalho e atribuir o valor correspondente ao atributo do dado
          csv_headers.each do |header|
            dado_attributes[header] = row[header]
          end
    
          # Criar o dado com os atributos obtidos
          Dado.create(dado_attributes)
        end
    
        redirect_to root_path, notice: "Dados importados com sucesso."
      else
        redirect_to root_path, alert: "Por favor, selecione um arquivo CSV."
      end
    end
  end    