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

  def delete(conn, %{"id" => id}) do
    with {:ok, _pokemon} <- Exmon.delete_trainer_pokemon(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, trainer_pokemon} <- Exmon.fetch_trainer_pokemon(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", trainer_pokemon: trainer_pokemon)
    end
  end

  def update(conn, params) do
    with {:ok, pokemon} <- Exmon.update_trainer_pokemon(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", pokemon: pokemon)
    end
  end
end
