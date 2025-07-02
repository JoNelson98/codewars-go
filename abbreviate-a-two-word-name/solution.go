package kata

import (
	"strings"
)

func AbbrevName(name string) string{
  splitNames := strings.Split(name," ")
  fUpper := strings.ToUpper(string(splitNames[0][0]))
  lUpper := strings.ToUpper(string(splitNames[1][0]))
  return fUpper + "." + lUpper
}