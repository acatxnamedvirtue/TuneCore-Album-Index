FactoryGirl.define do
  factory :song do
    title 'My song title'
    album_id {FactoryGirl.create(:album).id}
    track_number 1
    length 9000
  end

  factory :not_matching_song, class: Song do
    title 'this song title is different'
    album_id {FactoryGirl.create(:album).id}
    track_number 2
    length 10000
  end
end