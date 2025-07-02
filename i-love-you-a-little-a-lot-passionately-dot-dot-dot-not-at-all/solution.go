package kata

func HowMuchILoveYou(i int) string {
  phrases := []string{
    "not at all",
    "I love you",
    "a little",
    "a lot",
    "passionately",
    "madly",
  }
  return phrases[i % 6]
}