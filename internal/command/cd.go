package command

func init() {
	NewCommand(
		"cd",
		[]string{"arg1", "arg2"},
		func(strings []string) (any, error) {
			return nil, nil
		},
	)
}
