Factory.define :user do |user|
  user.username "Example User"
  user.email "user@example.com"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.define :tournament do |tournament|
  tournament.name "Mar. (2011)"
  tournament.league "GSL"
end