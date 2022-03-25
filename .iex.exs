alias Exmon.Trainer
alias Exmon.{Pokemon, Repo}
alias Exmon.Trainer.Pokemon, as: TrainerPokemon
alias Exmon.PokeApi.Client
alias Exmon.Trainer.Pokemon.Create

params = %{name: "Exmon", password: "12345678"}
params2 = %{name: "Exmon"}
param_create_pokemon = %{"name" => "pikachu", "nickname" => "raio", "trainer_id" => "271a8632-c9e7-41cd-9e82-8e3d91797509"}
param_create_pokemon2 = %{"name" => "scyther", "nickname" => "fogo", "trainer_id" => "271a8632-c9e7-41cd-9e82-8e3d91797509"}
param_create_pokemon3 = %{"name" => "nono", "nickname" => "fogo", "trainer_id" => "271a8632-c9e7-41cd-9e82-8e3d91797509"}
param_create_pokemon4 = %{"name" => "pikachu", "nickname" => "raio", "trainer_id" => "271a8632-c9e7-41cd-9e82-8e3d91797501"}

pokemon = %{
  name: "pikachu",
  nickname: "raio",
  weight: 35,
  types: ["electric"],
  trainer_id: "271a8632-c9e7-41cd-9e82-8e3d91797509"
}
