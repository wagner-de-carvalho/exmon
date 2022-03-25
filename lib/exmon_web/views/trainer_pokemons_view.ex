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
end
