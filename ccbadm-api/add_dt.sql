INSERT INTO documents(
	document_type_id,
	documentable_id,
	documentable_type,
	is_possible,
	status_id
)
select 24, p.id, 'Property', TRUE, 'DOC_NONE' from properties
