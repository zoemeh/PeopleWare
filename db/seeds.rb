# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

["Español", "Ingles", "Aleman", "Frances"].each do |x|
  Language.create(name: x, status: "active")
end

["Manejor de Recursos Humanos", "Uso de Herramientas Ofimaticas", 
  "Gestion de Presupusto", "Hablar en publico"].each do |x|
  Skill.create(description: x, status: "active")
end

j = Job.create(name: "Programador", risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
Candidate.create(cedula: "001", name: "Fulano de tal", job_id: j.id, desired_wage: 10)
