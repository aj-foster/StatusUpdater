# StatusUpdater

**A small Elixir / escript package for updating your status on Slack.**

## Installation

1. First, copy `config/config.example.exs` to `config/config.exs`. This is where you'll store your
  Slack token without risk of accidentally committing it.

2. Add your Slack token to `config/config.exs`. It should have the form `xoxp-...`.

3. For now, install by running
    ```
    mix escript.build
    ```

This should create a binary `status` which can be run to execute a "Testing" status update.

4. Optionally, create a symbolic link to the binary in `/usr/local/bin` or another directory in your `$PATH`.

Note that the `status` script will use whichever version of Erlang is set **from the place where
you call it**. So if you've changed directory into a project that uses the ASDF version manager to
set a different major version of the Erlang runtime, you might find that calling `status` there
doesn't work as expected.

## Customization

You can create customized preset statuses in `lib/status_updater.ex` by modifying the `case`
statement in the `main/1` function.
