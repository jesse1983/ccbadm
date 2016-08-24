# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: imports
#
#  id                     :integer          not null, primary key
#  good_id                :integer
#  church_id              :integer
#  invoice_id             :integer
#  epc_rfid               :string(510)
#  codigo_interno         :string(510)
#  objeto                 :string(510)
#  quantidade             :string(510)
#  marca                  :string(510)
#  modelo                 :string(510)
#  num_serie              :string(510)
#  altura                 :string(510)
#  largura                :string(510)
#  comprimento            :string(510)
#  material               :string(510)
#  potencia               :string(510)
#  tensao                 :string(510)
#  localizacao            :string(510)
#  ano_contabil           :string(510)
#  conta_contabil         :string(510)
#  mes_arquivo            :string(510)
#  pacote_arquivo         :string(510)
#  num_nf                 :string(510)
#  data_nf                :string(510)
#  fornecedor             :string(510)
#  valor_bem              :string(510)
#  observacao             :string(510)
#  conta_contabil_correta :string(510)
#

class Import < ActiveRecord::Base
  	# has_paper_trail
	belongs_to :church
	belongs_to :good
	belongs_to :invoice

	has_many :import_errors

end
