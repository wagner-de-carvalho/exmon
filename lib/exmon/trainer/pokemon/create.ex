defmodule Exmon.Trainer.Pokemon.Create do
  alias Exmon.PokeApi.Client
  alias Exmon.{Pokemon, Repo, Trainer}
  alias Exmon.Trainer.Pokemon, as: TrainerPokemon

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, %{"trainer_id" => trainer_id} = params) do
    body
    |> Pokemon.build()
    |> check_trainer_id(trainer_id)
    |> create_pokemon(params)
  end

  defp handle_response({:error, _reason} = error, _params), do: error

  defp check_trainer_id(pokemon, trainer_id) do
    case Trainer.Get.call(trainer_id) do
      {:ok, _trainer} -> pokemon
      {:error, _reason} = error -> error
    end
  end

  defp create_pokemon(%Pokemon{name: name, weight: weight, types: types}, %{
         "nickname" => nickname,
         "trainer_id" => trainer_id
       }) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      nickname: nickname,
      trainer_id: trainer_id
    }

    params
    |> TrainerPokemon.build()
    |> handle_build()
  end

  defp create_pokemon({:error, _reason} = error, _params), do: error

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
