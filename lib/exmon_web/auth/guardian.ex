defmodule ExmonWeb.Auth.Guardian do
  use Guardian, otp_app: :exmon

  def subject_for_token(trainer, _claims) do
    sub = to_string(trainer.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> Exmon.fetch_trainer()
  end
end
