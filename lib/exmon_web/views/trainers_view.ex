defmodule ExmonWeb.TrainersView do
  use ExmonWeb, :view

  def render("trainer.json", %{trainer: trainer}), do: %{trainer: trainer}
end
