defmodule Exmon.Trainer.Pokemon.Update do
  alias Ecto.UUID
  alias Exmon.{Repo, Trainer.Pokemon}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Trainer not found"}
      pokemon -> update_pokemon(pokemon, params)
    end
  end

  defp update_pokemon(pokemon, params) do
    pokemon
    |> Map.put(:updated_at, DateTime.utc_now())
    |> Pokemon.update_changeset(params)
    |> Repo.update()
  end
end
