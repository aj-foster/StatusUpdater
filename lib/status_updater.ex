defmodule StatusUpdater do
  @moduledoc """
  This module is the entrypoint for an escript binary. It calls out to the
  Slack API using a token defined in `config.exs` in order to update a user's
  status message and emoji.
  """


  @doc """
  Entrypoint for the escript binary.

  When the generated binary is run, this function will be called with an array
  containing strings representing the arguments passed to the binary. Using
  these arguments, it will delegate to update/2 to call the Slack API.
  """
  def main (args) do
    args
    |> Enum.at(0)
    |> case do
      "clear" ->
        update("", "")

      "lunch" ->
        update("Lunch", ":fork_and_knife:")

      "meeting" ->
        update("In a Meeting", ":calendar:")
    end
  end


  @doc """
  Calls the Slack API to update the configured user's status.

  Which user is updated depends on the token placed in `config.exs`.
  """
  def update(text, emoji \\ "") do
    url = "https://slack.com/api/users.profile.set"
    token = Application.get_env(:status_updater, :token)
    body = {:form, [{"profile", "{\"status_text\":\"#{text}\",\"status_emoji\":\"#{emoji}\"}"}, {"token", token}]}
    headers = [{"Content-Type", "application/x-www-form-urlencoded"}]

    HTTPoison.post(url, body, headers)
  end
end
