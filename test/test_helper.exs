ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PeepProjectBackend.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PeepProjectBackend.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PeepProjectBackend.Repo)

