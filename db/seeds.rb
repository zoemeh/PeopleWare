# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

["Español", "Ingles", "Aleman", "Frances"].each do |x|
  Language.create(name: x, status: true)
end

["Manejor de Recursos Humanos", "Uso de Herramientas Ofimaticas", 
  "Gestion de Presupusto", "Hablar en publico"].each do |x|
  Skill.create(description: x, status: true)
end
jobs = []
jobs.push Job.create(name: "Programador", department: "Tech", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
jobs.push Job.create(name: "Contador", department: "Tech", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
jobs.push Job.create(name: "Diseñador gráfico", department: "Tech", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
jobs.push Job.create(name: "Arquitecto", department: "Tech", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")

candidates = (1..20).map do 
  c = Candidate.create(name: FFaker::Name.unique.name, cedula: "0013454123", job_id: jobs.sample.id, desired_wage: 15.0)
  c.language_ids = [1,2]
  c
end
Training.create(description: "Certificado CCNA", level: "technical", from_at: Date.today, to_at: Date.today, institution: "ITLA", candidate: candidates.sample);
u = User.create(email: "admin@admin.com", password: "123")