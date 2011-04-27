Factory.define :user do |user|
  user.username "Example User"
  user.email "user@example.com"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.define :tournament do |tournament|
  tournament.name "Mar. (2011)"
  tournament.league "GSL"
  tournament.start_dt "2011-02-21"
  tournament.end_dt "2011-03-19"
end

Factory.define :group do |group|
  group.name "TSH"
  group.description "Teaml SO-HI"
  group.private "1"
  group.association :tournament
end

Factory.define :team do |team|
  team.name "RageQuit!"
  team.association :group
  team.association :user
end