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

  # def render("show.json", %{
  #       pokemon: %Pokemon{
  #         id: id,
  #         name: name,
  #         inserted_at: inserted_at,
  #         nickname: nickname,
  #         types: types,
  #         trainer_id: %{id: trainer_id, name: trainer_name},
  #         weight: weight
  #       }
  #     }) do
  #   %{
  #     pokemon: %{
  #       id: id,
  #       name: name,
  #       inserted_at: inserted_at,
  #       nickname: nickname,
  #       types: types,
  #       trainer: %{trainer_id: trainer_id, name: trainer_name},
  #       weight: weight
  #     }
  #   }
  # end
end
