# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Doctor.destroy_all
Patient.destroy_all
Specialty.destroy_all
Appointment.destroy_all
City.destroy_all

100.times do 
    array_specialty = ["Dermatologe", "Psychiatre", "Gynécologue", "Urologue","Dentiste", "Orthodontiste", "Chirurgie", "Ophtamologue","Généraliste","Pédiatre"].sample
    #.sample = choisir un élément aléatoirement dans 1 array
    city = City.create(name: Faker::Address.city)
    doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: city)
    patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city)
    specialty = Specialty.create(name: array_specialty)
    appointment = Appointment.create(date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30, format: :long), doctor: doctor, patient: patient, city: city)
    #.between = aléatoirement entre maintenant et dans 30jours
    lien = Link.create(specialty: specialty, doctor: doctor)
end


#on utilise la méthode Faker pour générer des faux noms, des fausses villes.