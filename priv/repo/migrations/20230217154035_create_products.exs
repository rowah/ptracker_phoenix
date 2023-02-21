defmodule Ptracker.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :image, :binary
      add :description, :string
      add :manufacture_date, :date
      add :expiry_date, :date

      timestamps()
    end
  end
end
