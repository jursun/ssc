require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_tournaments
    make_groups
    make_teams
  end
end

def make_users
  admin = User.create!(:username => "Admin",
                       :email => "admin@example.com",
                       :password => "adminadmin",
                       :password_confirmation => "adminadmin")
  admin.toggle!(:admin)
  25.times do |n|
    name = Faker::Name.name
    email = "user-#{n+1}@example.com"
    password = "password"
    User.create!(:username => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_tournaments
  Tournament.create!(:name => "Mar. (2011)",
                     :league => "GSL",
                     :start_dt => "2011-02-21",
                     :end_dt => "2011-03-19")
  Tournament.create!(:name => "May. (2011)",
                     :league => "GSL",
                     :start_dt => "2011-04-18",
                     :end_dt => "2011-05-14")
  Tournament.create!(:name => "Season 1",
                     :league => "NASL",
                     :start_dt => "2011-04-12",
                     :end_dt => "2011-06-11")
end

def make_groups
  Tournament.all.each do |tournament|
    5.times do |n|
      name = Faker::Company.name
      description = Faker::Company.catch_phrase
      tournament.groups.create!(:name => name,
                              :description => description,
                              :private => Random.new.rand(0..1)
      )

    end
  end
end

def make_teams

end