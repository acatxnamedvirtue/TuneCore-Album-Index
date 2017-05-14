FactoryGirl.define do
  factory :artist do
    name 'My artist name'
  end

  factory :matching_artist, class: Artist do
    name 'this will match artists'
  end

  factory :not_matching_artist, class: Artist  do
    name 'this will not match artists'
  end
end