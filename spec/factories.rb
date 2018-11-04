FactoryBot.define do

  factory :user do
    email { 'joe@gmail.com' }
    password { 'secure_Pa$$word_1!' }
    user_name {'joey'}
     id { 1 }
  end

  factory :user_2, class: User do
    email { 'fred@gmail.com' }
    password { 'secure_Pa$$word_1!' }
    user_name {"freddy"}
    id { 2 }
  end

end
