defmodule Exmon.Trainer.CreateTest do
  use Exmon.DataCase, async: true
  alias Ecto.Changeset
  alias Exmon.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1" do
    test "When all params are correct, creates a Trainer" do
      params = %{name: "Thomas Ash", password: "123xpto"}
      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Thomas Ash"}} = response
      assert count_after > count_before
    end

    test "When there are invalid params, returns an error" do
      params = %{name: "Thomas Ash", password: "123xp"}

      assert {:error, changeset} = Create.call(params)
      assert errors_on(changeset) == %{password: ["should be at least 6 character(s)"]}
    end
  end
end
