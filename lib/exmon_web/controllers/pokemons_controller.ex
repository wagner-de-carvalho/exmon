defmodule ExmonWeb.PokemonsController do
  use ExmonWeb, :controller

  action_fallback ExmonWeb.FallbackController

  def show(conn, %{"name" => name}) do
    with {:ok, pokemon} <- Exmon.fetch_pokemon(name) do
      conn
      |> put_status(:ok)
      |> json(pokemon)
    end
  end
end
