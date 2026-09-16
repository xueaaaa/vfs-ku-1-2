package command

func init() {
	NewCommand(
		"ls",
		[]string{"arg1", "arg2"},
		func(strings []string) (any, error) {
			return nil, nil
		},
	)
}
