defmodule ExmonWeb.TrainerPokemonsView do
  use ExmonWeb, :view

  alias Exmon.Trainer.Pokemon

  def render("trainer_pokemon.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon created",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end

  def render("show.json", %{
        trainer_pokemon: %{
          id: id,
          inserted_at: inserted_at,
          name: name,
          nickname: nickname,
          types: types,
          weight: weight,
          trainer: %{name: trainer_name, id: trainer_id}
        }
      }) do
    %{
      id: id,
      inserted_at: inserted_at,
      name: name,
      nickname: nickname,
      types: types,
      weight: weight,
      trainer: %{
        name: trainer_name,
        id: trainer_id
      }
    }
  end

  def render("update.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          updated_at: updated_at,
          types: types,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon updated!",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        weight: weight,
        updated_at: updated_at
      }
    }
  end
end
