# -*- encoding : utf-8 -*-
class CreateCorrections < ActiveRecord::Migration
  def change
    create_table :corrections do |t|
      t.string :att
      t.string :from
      t.string :to
      t.timestamps
    end
    # Correction.create att: "place_id", from: "SALAO DE ORAÇAO", to: "SALÃO DE CULTO"
    # Correction.create att: "material_id", from: "PLASTICO/METAL", to: "PLASTICO"
    # Correction.create att: "place_id", from: "ÁTRIO FRONTAL", to: "ÁTRIO"
    # Correction.create att: "place_id", from: "Banco para Músico", to: "Banco de músico"    		
  end
end
