package parser

import (
	"os"
	"slices"
	"strings"
	"testing"
)

func TestParse(t *testing.T) {
	_ = os.Setenv("VFS_TEST", "env")

	tests := []struct {
		name          string
		input         string
		expectedCmd   string
		expectedArgs  []string
		errorExpected bool
	}{
		{
			name:          "empty command",
			input:         "",
			errorExpected: true,
		},
		{
			name:        "command without args",
			input:       "exit",
			expectedCmd: "exit",
		},
		{
			name:         "command with args",
			input:        "cmd arg1 -arg2",
			expectedCmd:  "cmd",
			expectedArgs: []string{"arg1", "-arg2"},
		},
		{
			name:         "args with many spaces",
			input:        "cmd     arg1	-arg2",
			expectedCmd:  "cmd",
			expectedArgs: []string{"arg1", "-arg2"},
		},
		{
			name:         "command with env variable",
			input:        "cmd $VFS_TEST",
			expectedCmd:  "cmd",
			expectedArgs: []string{"env"},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			cmd, args, err := Parse(tt.input)

			if tt.errorExpected && err == nil {
				t.Error("expected error, got nil")
			}

			if cmd != tt.expectedCmd {
				t.Errorf("expected command %s, got %s", tt.expectedCmd, cmd)
			}

			if !slices.Equal(args, tt.expectedArgs) {
				t.Errorf("expected args [%s] got [%s]",
					strings.Join(tt.expectedArgs, ","),
					strings.Join(args, ","),
				)
			}
		})
	}
}
