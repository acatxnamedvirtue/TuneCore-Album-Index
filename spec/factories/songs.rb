FactoryGirl.define do
  factory :song do
    title 'My song title'
    album_id {FactoryGirl.create(:album).id}
    track_number 1
    length 9000
  end

  factory :matching_song, class: Song do
    title 'this will match songs'
    album_id {FactoryGirl.create(:matching_album).id}
    track_number 2
    length 9500
  end

  factory :not_matching_song, class: Song do
    title 'this will not match songs'
    album_id {FactoryGirl.create(:not_matching_album).id}
    track_number 3
    length 10000
  end
end