json.extract! candidate, :id, :cedula, :name, :job_id, :desired_wage, :recommended_by, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
