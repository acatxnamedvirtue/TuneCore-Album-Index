# Music Search

This app allows you to search for music by any combination of Artist Name, Album Title, or Song Title

There is semi-realistic seed data of 500 songs, 100 albums, and 10 artists using the Faker gem library

To load the seed data, please run `rake db:seed`

There is only one viewable page, the search view. Controllers and views have been implemented for all 3 models,
but these are hidden from the user because the app specifications do not require it. As such, they have not been styled.

## From a fresh download

Run these commands:

```
bundle install

rake db:create
rake db:migrate
rake db:seed

rails s

```

And navigate to localhost:3000

## Tests

Make sure the test database is migrated with `rake db:migrate Rails_env=test`

Then run `rspec` from the root directory