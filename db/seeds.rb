# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach(Rails.root.join("db/UF2019.csv"), headers: true, col_sep: ';') do |row|
   
    valores = row.to_h #variable para pasar los datos del archivo a hash
    dia = row.to_h.values[0]#tuve que crearlo porque no toma "Dia" del archivo
    next if dia.nil?
    #byebug
    valor_ene = row.to_h.values[1]#esta variable para pasar los datos a has y que tome el valor indice 1
    valor_feb = row.to_h.values[2]
   
    fecha_ene = "2019-01-#{dia}".to_date#variable para mostrar la fecha con formato fecha
    params_ene = {date: fecha_ene, value: valor_ene}
    Value.create!(params_ene) if valor_ene.present?#guarda mi clase del modelo User y lo guarde en la base si es que existe
  
    if valor_feb.present? #todo este código es para continuar si no aparecen los dias 29 y 30
      fecha_feb = "2019-02-#{dia}".to_date
      params_feb = {date: fecha_feb, value: valor_feb}
      Value.create!(params_feb) 
    end
end

User.create(name: 'juan')#para crear y guardar el nombre juan
