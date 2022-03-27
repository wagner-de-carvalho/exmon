defmodule ExmonWeb.TrainersController do
  use ExmonWeb, :controller
  alias ExmonWeb.FallbackController
  alias ExmonWeb.Auth.Guardian

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- Exmon.create_trainer(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(trainer) do
      conn
      |> put_status(:created)
      |> render("trainer.json", trainer: trainer, token: token)
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
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
