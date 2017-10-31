defmodule StatusUpdater do
  @moduledoc """
  Documentation for StatusUpdater.
  """

  def test do
    url = "https://slack.com/api/users.profile.set"
    token = Application.get_env(:status_updater, :token)
    body = {:form, [{"profile", "{\"status_text\":\"Testing\"}"}, {"token", token}]}
    headers = [{"Content-Type", "application/x-www-form-urlencoded"}]
    
    HTTPoison.post(url, body, headers)
  end
  
  
  def main (args) do
    test()
  end
end
