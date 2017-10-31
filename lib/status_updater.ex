defmodule StatusUpdater do
  @moduledoc """
  Documentation for StatusUpdater.
  """


  def main (args) do
    args
    |> Enum.at(0)
    |> case do
      "lunch" ->
        update("Lunch", ":fork_and_knife:")

      "meeting" ->
        update("In a Meeting", ":calendar:")
    end
  end

  defp update(text, emoji \\ "") do
    url = "https://slack.com/api/users.profile.set"
    token = Application.get_env(:status_updater, :token)
    body = {:form, [{"profile", "{\"status_text\":\"#{text}\",\"status_emoji\":\"#{emoji}\"}"}, {"token", token}]}
    headers = [{"Content-Type", "application/x-www-form-urlencoded"}]

    HTTPoison.post(url, body, headers)
  end
end
