defmodule ExmonWeb.TrainersController do
  use ExmonWeb, :controller
  alias ExmonWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- Exmon.create_trainer(params) do
      conn
      |> put_status(:created)
      |> render("create.json", trainer: trainer)
    end
  end
end
