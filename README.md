# StatusUpdater

**A small Elixir / escript package for updating your status on Slack.**

## Installation

1. First, add your Slack token to `config.exs`. It should have the form `xoxp-...`.
2. For now, install by running
    ```
    mix escript.build
    ```

This should create a binary `status` which can be run to execute a "Testing" status update.

3. Optionally, create a symbolic link to the binary in `/usr/local/bin` or another directory in your `$PATH`.


## Customization

You can create customized preset statuses in `lib/status_updater.ex` by modifying the `case` statement in the `main/1` function.
