defmodule Exmon.TrainerTest do
  use Exmon.DataCase, async: true

  alias Ecto.Changeset
  alias Exmon.Trainer

  describe "build/1" do
    test "when all params are correct, returns a trainer created" do
      params = %{name: "Thomas Ash", password: "123xpto"}

      assert {:ok, %Trainer{}} = Trainer.build(params)
    end

    test "when password is invalid, returns an error" do
      params = %{name: "Thomas Ash", password: "123xp"}

      assert {:error, %Changeset{}} = Trainer.build(params)
    end
  end
end
