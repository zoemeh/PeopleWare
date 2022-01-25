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

j = Job.create(name: "Programador", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
j = Job.create(name: "Contador", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
j = Job.create(name: "Diseñador gráfico", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
j = Job.create(name: "Arquitecto", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")

c = Candidate.create(name: "Fulano de Tal", cedula: "0013454123", job_id: j.id, desired_wage: 15.0)
c.language_ids = [1,2]
Training.create(description: "Certificado CCNA", level: "technical", from_at: Date.today, to_at: Date.today, institution: "ITLA", candidate: c);

u = User.create(email: "admin@admin.com", password: "123")