%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "apps/", "test/"],
        excluded: [~r"/_build/", ~r"/deps/"]
      },
      checks: [
        # {Credo.Check.Consistency.TabsOrSpaces},
        #
        # # For some checks, like AliasUsage, you can only customize the priority
        # # Priority values are: `low, normal, high, higher`
        # {Credo.Check.Design.AliasUsage, priority: :low},
        #
        # # For others you can also set parameters
        # {Credo.Check.Readability.MaxLineLength, priority: :low, max_length: 80},
        #
        # # You can also customize the exit_status of each check.
        # # If you don't want TODO comments to cause `mix credo` to fail, just
        # # set this value to 0 (zero).
        # {Credo.Check.Design.TagTODO, exit_status: 2},

        # To deactivate a check:
        # Put `false` as second element:
        {Credo.Check.Design.TagFIXME, false},
        {Credo.Check.Warning.IoInspect, false},
        {Credo.Check.Consistency.SpaceInParentheses, false},
        {Credo.Check.Readability.VariableNames, false},
        {Credo.Check.Readability.ModuleDoc, false},
        {Credo.Check.Design.TagTODO, false},
        {Credo.Check.Refactor.PipeChainStart, false}

        # ... several checks omitted for readability ...
      ]
    }
  ]
}
