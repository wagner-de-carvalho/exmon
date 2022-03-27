defmodule ExmonWeb.FallbackController do
  use ExmonWeb, :controller

  alias ExmonWeb.ErrorView

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ErrorView)
    |> render("401.json", error: "Trainer unauthorized")
  end

  def call(conn, {:error, error}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("error.json", error: error)
  end
end
