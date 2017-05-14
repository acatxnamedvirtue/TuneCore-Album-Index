FactoryGirl.define do
  factory :album do
    title 'My album title'
    artist_id {FactoryGirl.create(:artist).id}
    genre 'My album genre'
    year 'My album year'
  end

  factory :matching_album, class: Album do
    title 'this will match albums'
    artist_id {FactoryGirl.create(:matching_artist).id}
    genre 'My album genre'
    year 'My album year'
  end

  factory :not_matching_album, class: Album do
    title 'this will not match'
    artist_id {FactoryGirl.create(:not_matching_artist).id}
    genre 'My album genre'
    year 'My album year'
  end
end