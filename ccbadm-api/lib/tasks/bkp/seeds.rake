# require 'colorize'

# desc "Status seeder"
# task :seed_status => :environment do
#     Status.delete_all()
#     Status.create statusable_type: "Document", uid: "DOC_NONE",        order: 1, color: "#ecf0f1", is_active: false, meta: {},          title: "Não informado"
#     Status.create statusable_type: "Document", uid: "DOC_MISSING",     order: 2, color: "#c0392b", is_active: false, meta: {},          title: "Ausente (primordial)"
#     Status.create statusable_type: "Document", uid: "DOC_EXPIRED",     order: 3, color: "#e67e22", is_active: true,  meta: {auto:true}, title: "Vencido"
#     Status.create statusable_type: "Document", uid: "DOC_AVAILABLE",   order: 5, color: "#f1c40f", is_active: false, meta: {},          title: "Presente"
#     Status.create statusable_type: "Document", uid: "DOC_UPLOADED",    order: 6, color: "#27ae60", is_active: false, meta: {auto:true}, title: "Presente e digitalizado"
#     Status.create statusable_type: "Document", uid: "DOC_UNNECESSARY", order: 7, color: "#34495e", is_active: false, meta: {},          title: "Não é necessário"

#     docs = Document.all
#     size = docs.size
#     done = 0
#     docs.all.each do |doc|
#       if doc.is_active
#         if doc.is_possible
#           if doc.attachments_count > 0
#             doc.status_id = 'DOC_UPLOADED'
#           else
#             doc.status_id = 'DOC_AVAILABLE'
#           end
#         else
#           doc.status_id = 'DOC_UNNECESSARY'
#         end
#       else
#         doc.status_id = 'DOC_NONE'
#       end
#       done = done + 1
#       print "Updating #{(done * 100 / size)}% \r"
#       $stdout.flush
#       doc.save(validate: false)
#     end
#     print "Well Done! \r".green

# end
