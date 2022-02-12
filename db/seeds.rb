# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

langs = ["Español", "Ingles", "Aleman", "Frances"].map do |x|
  Language.create(name: x, status: true).id
end

skills = ["Manejor de Recursos Humanos", "Uso de Herramientas Ofimaticas", 
  "Gestion de Presupusto", "Hablar en publico"].map do |x|
  Skill.create(description: x, status: true).id
end
departments = []
departments.push Department.create(name: "Tecnologia")
departments.push Department.create(name: "Legal")
jobs = []
jobs.push Job.create(name: "Desarrollador Web", department_id: departments[0].id, risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
jobs.push Job.create(name: "Analista de Sistemas", department_id:  departments[0].id, risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
jobs.push Job.create(name: "Diseñador gráfico", department_id:  departments[0].id, risk_level: "low", wage_min: 1, wage_max: 10, status: "active")
jobs.push Job.create(name: "Product Manager", department_id:  departments[0].id, risk_level: "low", wage_min: 1, wage_max: 10, status: "active")

wages = (1..10).map do |x| x*5000.0 end
i = 0
candidates = (1..10).map do 
  i+=1
  c = Candidate.create(name: FFaker::Name.unique.name, cedula: "40222590#{i.to_s.rjust(3,"0")}", job_id: jobs.sample.id, desired_wage: wages.sample)
  c.language_ids = langs.sample(2)
  c.skill_ids = skills.sample(2)
  Training.create(description: "Certificado CCNA", level: "technical", from_at: Date.today - 30, to_at: Date.today , institution: "ITLA", candidate: c);
  c.experience = [Hash.new, Hash.new, Hash.new]
  c.experience[0]["company"] = "Acme Corp"
  c.experience[0]["job"] = "Analista de Sistemas"
  c.experience[0]["wage"] = 65000
  c.experience[0]["from"] = Date.today - 500
  c.experience[0]["to"] = Date.today - 50
  c.save
  c
end
candidates = (11..20).map do 
  i+=1
  c = Candidate.create(name: FFaker::Name.unique.name, cedula: "40222590#{i.to_s.rjust(3,"0")}", job_id: jobs.sample.id, desired_wage: wages.sample)
  c.language_ids = langs.sample(2)
  c.skill_ids = skills.sample(2)
  Training.create(description: "Ing Software", level: "grade", from_at: Date.today - 30, to_at: Date.today , institution: "UNAPEC", candidate: c);
  c.experience = [Hash.new, Hash.new, Hash.new]
  c.experience[0]["company"] = "Acme Corp"
  c.experience[0]["job"] = "Analista de Sistemas"
  c.experience[0]["wage"] = 65000
  c.experience[0]["from"] = Date.today - 500
  c.experience[0]["to"] = Date.today - 50
  c.save
  c
end
u = User.create(email: "admin@admin.com", password: "123", group: "admins")