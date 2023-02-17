defmodule Ptracker.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ptracker.Store` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        expiry_date: ~D[2023-02-16],
        image: "some image",
        manufacture_date: ~D[2023-02-16],
        name: "some name"
      })
      |> Ptracker.Store.create_product()

    product
  end
end
