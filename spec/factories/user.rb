FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    profile               {"よろしく"}
    gender                {0}
    age                   {0}
    prefecture_id         {5}
    user_image            {"picture/user-2517433_640.png"} 
  end

end
