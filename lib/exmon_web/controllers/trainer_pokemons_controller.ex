defmodule ExmonWeb.TrainerPokemonsController do
  use ExmonWeb, :controller
  alias ExmonWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, pokemon} <- Exmon.create_trainer_pokemon(params) do
      conn
      |> put_status(:created)
      |> render("trainer_pokemon.json", pokemon: pokemon)
    end
  end
end
