

class DadosController < ApplicationController
    require 'csv'
  
    def index
      @dados = Dado.all
    end
  
    def limpar_tela
        Dado.destroy_all
        redirect_to root_path, notice: "Tela limpa com sucesso!"
      end


    def importar
      file = params[:file]
  
      if file.present?
        CSV.foreach(file.path, headers: true) do |row|
          Dado.create(row.to_h)
        end
        redirect_to root_path, notice: "Dados importados com sucesso."
      else
        redirect_to root_path, alert: "Por favor, selecione um arquivo CSV."
      end
    end
  end
  