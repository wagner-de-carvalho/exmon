defmodule ExmonWeb.TrainersView do
  use ExmonWeb, :view

  def render("trainer.json", %{trainer: trainer, token: token}), do: %{trainer: trainer, token: token}
end
