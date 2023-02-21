defmodule Ptracker.Store.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :expiry_date, :date
    field :image, :binary
    field :manufacture_date, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :image, :description, :manufacture_date, :expiry_date])
    |> validate_required([:name, :image, :description, :manufacture_date, :expiry_date])
  end
end
