class AddSkills < ActiveRecord::Migration
  def change

	Skill.find_or_create_by!(name: "show", model: "User", name_pt_br: "Ler", model_pt_br: "Usuários")
	Skill.find_or_create_by!(name: "show", model: "Attachment", name_pt_br: "Ler", model_pt_br: "Anexos")

	Skill.find_or_create_by!(name: "manage", model: "Profile", name_pt_br: "Gerenciar", model_pt_br: "Perfis")
	Skill.find_or_create_by!(name: "show", model: "Profile", name_pt_br: "Ler", model_pt_br: "Perfis")

	Skill.find_or_create_by!(name: "manage", model: "Request", name_pt_br: "Gerenciar", model_pt_br: "Solicitações")
	Skill.find_or_create_by!(name: "show", model: "Request", name_pt_br: "Ler", model_pt_br: "Solicitações")

  end
end
