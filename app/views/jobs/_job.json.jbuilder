json.extract! job, :id, :name, :risk_level, :wage_min, :wage_max, :status, :created_at, :updated_at
json.url job_url(job, format: :json)
