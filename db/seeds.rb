20.times do
    Patient.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email,
      next_appointment: [nil, Faker::Time.forward(days: 7)].sample
    )
  end
  