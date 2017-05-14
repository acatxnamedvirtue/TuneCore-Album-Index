FactoryGirl.define do
  factory :song do
    title 'My title'
    album_id {FactoryGirl.create(:album).id}
    track_number 1
    length 9000
  end

  factory :not_matching_song, class: Song do
    title 'this is different'
    album_id {FactoryGirl.create(:album).id}
    track_number 1
    length 9000
  end
end