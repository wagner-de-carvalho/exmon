defmodule ExmonWeb.TrainersView do
  use ExmonWeb, :view

  def render("trainer.json", %{trainer: trainer, token: token}),
    do: %{trainer: trainer, token: token}

  def render("show_trainer.json", %{trainer: trainer}), do: %{trainer: trainer}

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
