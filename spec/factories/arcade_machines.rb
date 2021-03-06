FactoryGirl.define do
  factory :arcade_machine do
    name     { Faker::Lorem.words(2).join(" ") }
    location { Faker::Address.city }

    after :create do |machine|
      ApiKey.create arcade_machine: machine
      MachineOwnership.create arcade_machine: machine, user: FactoryGirl.create(:user)
    end
  end
end