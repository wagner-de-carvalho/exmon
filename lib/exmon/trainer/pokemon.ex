defmodule Exmon.Trainer.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset
  alias Exmon.Trainer

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  @required [:name, :nickname, :weight, :types, :trainer_id]

  schema "pokemons" do
    field :name, :string
    field :nickname, :string
    field :weight, :integer
    field :types, {:array, :string}
    belongs_to(:trainer, Trainer)
    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required)
    |> validate_required(@required)
    |> assoc_constraint(:trainer)
    |> validate_length(:nickname, min: 2)
  end
end
