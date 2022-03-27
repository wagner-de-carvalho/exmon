defmodule ExmonWeb.Controllers.TrainersController do
  use ExmonWeb.ConnCase, async: true
  alias Exmon.Trainer

  describe "show/2" do
    test "When there is a trainer with the given id, returns the trainer", %{conn: conn} do
      params = %{name: "John Nash", password: "123xpto"}
      {:ok, %Trainer{id: id}} = Exmon.create_trainer(params)

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"trainer" => %{"name" => "John Nash"}} = response
    end

    test "When there is an error, returns the error", %{conn: conn} do
      response =
        conn
        |> get(Routes.trainers_path(conn, :show, "123xp"))
        |> json_response(:bad_request)

      assert response == "Invalid ID format!"
    end
  end
end
