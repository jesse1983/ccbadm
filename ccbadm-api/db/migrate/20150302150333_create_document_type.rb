class CreateDocumentType < ActiveRecord::Migration
  def change
    create_table :document_types do |t|
      t.string :title
      t.integer :order, index: true
      t.boolean :is_mandatory, default: true
      t.boolean :is_active, default: true
      t.timestamps
    end


    docs = Array.new()
	docs.push "01 Contrato do imóvel"
	docs.push "02 Escritura de Compra"
	docs.push "03 Matrícula registral"
	docs.push "04 Projeto de anexação"
	docs.push "04.1 Certidão de anexação"
	docs.push "04.2 Averbação da anexação"
	docs.push "05 Projeto de prefeitura"
	docs.push "05.1 Alvará de execução da obra"
	docs.push "05.2 DIC Matrícula da obra PMC"
	docs.push "05.3 Averbação da construção"
	docs.push "06 CEI Receita Federal"
	docs.push "07 Projeto de bombeiros"
	docs.push "07.1 Vistoria de bombeiros"
	docs.push "08 CCO"
	docs.push "08.1 Alvará de uso"
	docs.push "09 CND Receita Federal"
	docs.push "10 Atualização IPTU"
    docs.each_with_index{|d,index| DocumentType.create title:d,order: index}
  end
end
