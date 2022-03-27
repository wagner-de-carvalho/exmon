defmodule Exmon.PokeApi.ClientTest do
  use ExUnit.Case, async: true
  import Tesla.Mock
  alias Exmon.PokeApi.Client
  alias Tesla.Env

  @base_url "https://pokeapi.co/api/v2/pokemon/"

  describe "get_pokemon/1" do
    test "When there is a pokemon with the given name, returns the pokemon" do
      body = %{"name" => "pikachu", "weight" => 60, "types" => ["electric"]}

      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
        %Env{status: 200, body: body}
      end)

      response = Client.get_pokemon("pikachu")
      expected_response = {:ok, %{"name" => "pikachu", "types" => ["electric"], "weight" => 60}}

      assert expected_response == response
    end

    test "When there is no pokemon with the given name, returns an error" do
      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
        %Env{status: 404}
      end)

      response = Client.get_pokemon("pikachu")
      expected_response = {:error, "Pokemon not found"}

      assert expected_response == response
    end

    test "When there is an unexpected error, returns the error" do
      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
        {:error, :timeout}
      end)

      response = Client.get_pokemon("pikachu")
      expected_response = {:error, :timeout}

      assert expected_response == response
    end
  end
end
