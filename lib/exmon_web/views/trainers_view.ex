defmodule ExmonWeb.TrainersView do
  use ExmonWeb, :view

  def render("create.json", %{trainer: trainer}), do: %{trainer: trainer}
end
