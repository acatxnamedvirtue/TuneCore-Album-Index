FactoryGirl.define do
  factory :album do
    title 'My title'
    artist_id {FactoryGirl.create(:artist).id}
    genre 'My genre'
    year 'My year'
  end
end