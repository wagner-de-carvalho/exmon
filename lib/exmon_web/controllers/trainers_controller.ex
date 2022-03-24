defmodule ExmonWeb.TrainersController do
  use ExmonWeb, :controller
  alias ExmonWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- Exmon.create_trainer(params) do
      conn
      |> put_status(:created)
      |> render("trainer.json", trainer: trainer)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _trainer} <- Exmon.delete_trainer(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, trainer} <- Exmon.fetch_trainer(id) do
      conn
      |> put_status(:ok)
      |> render("trainer.json", trainer: trainer)
    end
  end

  def update(conn, params) do
    with {:ok, trainer} <- Exmon.update_trainer(params) do
      conn
      |> put_status(:ok)
      |> render("trainer.json", trainer: trainer)
    end
  end
end
