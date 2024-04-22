/*
 * Class is in charge of holding all phrases that are needed for the program
 */
class Phrases{

  final int id;
  final String titles;
  final String quotes;

  Phrases({required this.id, required this.titles, required this.quotes});
}

final List<Phrases> phraseList = <Phrases>[
  Phrases(
    id: 1,
    titles: "The Tragedy of Hamlet, Prince of Denmark",
    quotes: "Now cracks a noble heart. Good-night, sweet prince: And flights of angels sing thee to thy rest.",
  ),
  Phrases(
      id: 2,
      titles: "King Lear",
      quotes: "As flies to wanton boys, are we to th\' gods. They kill us for their sport."
  ),
  Phrases(
      id: 3,
      titles: "Julius Caesar",
      quotes: "There is a tide in the affairs of men, which taken at the flood, leads on to fortune. Omitted, all the voyage of their life is bound in shallows and in miseries."
  ),
  Phrases(
      id: 4,
      titles: "King Henry VI, Part 2",
      quotes: "The first thing we do, let\'s kill all the lawyers."
  ),
  Phrases(
      id: 5,
      titles: "King Richard III",
      quotes: "A horse! a horse! my kingdom for a horse."
  ),
  // this is necessary to display no quote
  Phrases(
    id: 6,
    titles: "",
    quotes: "",
  ),
];