defmodule Exmon.Trainer.Update do
  alias Ecto.UUID
  alias Exmon.{Repo, Trainer}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> update_trainer(trainer, params)
    end
  end

  defp update_trainer(trainer, params) do
    trainer
    |> Map.put(:updated_at, DateTime.utc_now())
    |> Trainer.changeset(params)
    |> Repo.update()
  end
end
