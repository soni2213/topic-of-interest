defmodule ProjectOne.Repo.Migrations.CreateTopicOfInterest do
  use Ecto.Migration

  def change do
    create table(:topics_of_interests) do
      add :name, :string
      add :short_desc, :text

      timestamps()
    end
  end
end
