FactoryGirl.define do
  factory :album do
    title 'My album title'
    artist_id {FactoryGirl.create(:artist).id}
    genre 'My album genre'
    year 'My album year'
  end
end