defmodule Ptracker.StoreTest do
  use Ptracker.DataCase

  alias Ptracker.Store

  describe "products" do
    alias Ptracker.Store.Product

    import Ptracker.StoreFixtures

    @invalid_attrs %{description: nil, expiry_date: nil, image: nil, manufacture_date: nil, name: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Store.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Store.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{description: "some description", expiry_date: ~D[2023-02-16], image: "some image", manufacture_date: ~D[2023-02-16], name: "some name"}

      assert {:ok, %Product{} = product} = Store.create_product(valid_attrs)
      assert product.description == "some description"
      assert product.expiry_date == ~D[2023-02-16]
      assert product.image == "some image"
      assert product.manufacture_date == ~D[2023-02-16]
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{description: "some updated description", expiry_date: ~D[2023-02-17], image: "some updated image", manufacture_date: ~D[2023-02-17], name: "some updated name"}

      assert {:ok, %Product{} = product} = Store.update_product(product, update_attrs)
      assert product.description == "some updated description"
      assert product.expiry_date == ~D[2023-02-17]
      assert product.image == "some updated image"
      assert product.manufacture_date == ~D[2023-02-17]
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_product(product, @invalid_attrs)
      assert product == Store.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Store.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Store.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Store.change_product(product)
    end
  end
end
