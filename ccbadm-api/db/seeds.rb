# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Groups
# ActiveRecord::Base.connection.execute("TRUNCATE groups")
# rmc = Group.where(name: "Região de Campinas").first_or_create
# cam = Group.where(name: "Campinas", group_id: rmc.id).first_or_create
# Group.rebuild!



# Profile
# ActiveRecord::Base.connection.execute("TRUNCATE profiles")
# sa = Profile.where(name: "Super Admin", level: 0, is_admin: true).first_or_create
# ad = Profile.where(name: "Administrador", level: 1).first_or_create
# co = Profile.where(name: "Coordenador", level: 2).first_or_create
# us = Profile.where(name: "Usuário", level: 3).first_or_create



# # Corrections
# Correction.where(att: "place_id", from: "SALAO DE ORAÇAO", to: "SALÃO DE CULTO").first_or_create
# Correction.where(att: "material_id", from: "PLASTICO/METAL", to: "PLASTICO").first_or_create
# Correction.where(att: "place_id", from: "ÁTRIO FRONTAL", to: "ÁTRIO").first_or_create
# Correction.where(att: "place_id", from: "Banco para Músico", to: "Banco de músico").first_or_create


# # Abilites
# ActiveRecord::Base.connection.execute("TRUNCATE skills")
# ActiveRecord::Base.connection.execute("TRUNCATE profiles_skills")
# actions = [:manage, :create, :update, :read, :destroy]
# actions_pt_br = ["Gerenciar", "Criar", "Editar", "Ler", "Apagar"]
# actions.each_with_index do |a,index|
# 	Skill.where(name: a, model: "Church", name_pt_br: actions_pt_br[index], model_pt_br: "Casas de Oração").first_or_create
# 	# Skill.where(name: a, model: "Correction", name_pt_br: actions_pt_br[index], model_pt_br: "Correções").first_or_create
# 	# Skill.where(name: a, model: "FilePackage", name_pt_br: actions_pt_br[index], model_pt_br: "Pacote de arquivos").first_or_create
# 	Skill.where(name: a, model: "Good", name_pt_br: actions_pt_br[index], model_pt_br: "Bens").first_or_create
# 	Skill.where(name: a, model: "GoodType", name_pt_br: actions_pt_br[index], model_pt_br: "Tipos de bem").first_or_create
# 	# Skill.where(name: a, model: "Group", name_pt_br: actions_pt_br[index], model_pt_br: "Grupos").first_or_create
# 	# Skill.where(name: a, model: "Import", name_pt_br: actions_pt_br[index], model_pt_br: "Importações").first_or_create
# 	# Skill.where(name: a, model: "ImportError", name_pt_br: actions_pt_br[index], model_pt_br: "Erros de importação").first_or_create
# 	Skill.where(name: a, model: "Invoice", name_pt_br: actions_pt_br[index], model_pt_br: "Notas fiscais").first_or_create
# 	# Skill.where(name: a, model: "Material", name_pt_br: actions_pt_br[index], model_pt_br: "Materiais").first_or_create
# 	# Skill.where(name: a, model: "Place", name_pt_br: actions_pt_br[index], model_pt_br: "Localizações").first_or_create
# 	# Skill.where(name: a, model: "Skill", name_pt_br: actions_pt_br[index], model_pt_br: "Habilidades").first_or_create
# 	Skill.where(name: a, model: "User", name_pt_br: actions_pt_br[index], model_pt_br: "Usuários").first_or_create
# end

# ad.skills = Skill.all

# # User
# # User.destroy_all
# sauser = User.where(first_name: "Jesse", last_name: "Pinheiro", email: "jessebpinheiro@hotmail.com", profile_id: sa.id).first_or_create
# sauser.update_attributes password: "jesse1983"

# aduser = User.where(first_name: "Davi", last_name: "Callegari", email: "callegaridavi@gmail.com", profile_id: ad.id).first_or_create
# aduser.update_attributes password: "davi1234"


# #Churches
# Church.all.each{ |c| c.update_attributes group_id: cam.id}

# GoodStatus
GoodStatus.create name: "Usável"
GoodStatus.create name: "Sem condições de uso"

