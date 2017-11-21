# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#    ProjectOne.Repo.insert!(%ProjectOne.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

Enum.each ["Photography", "Space", "Sports",
            "Cars", "Rock Music", "Dance",
            "Chess", "Jumba", "Singing",
            "Reading", "Ticket Collection", "TV Shows",
            "Painting", "Skating", "Acting",
            "Poetry", "Pottery", "Cooking",
            "Yoga", "Video Games"], fn name ->
  ProjectOne.Repo.insert!(%ProjectOne.TopicOfInterest{name: name, short_desc: ""})
end


# ProjectOne.Repo.insert!(%ProjectOne.TopicOfInterest{name: "", short_desc: ""})
