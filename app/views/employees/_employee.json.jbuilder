json.extract! employee, :id, :cedula, :name, :hired_date, :job_id, :wage, :status, :created_at, :updated_at
json.url employee_url(employee, format: :json)
