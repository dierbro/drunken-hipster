describe("HN.Utils.DiscussionParser", function() {
  var parsed;

  beforeEach(function() {
    parsed = HN.Utils.DiscussionParser.parse(loadTestHtml('fixtures/post'))
  });

  it("should return the correct number of posts", function() {
  	expect(parsed.comments.length).toEqual(56)
  });

  it("should parse the news", function() {
	expect(parsed.link).toEqual("http://us.battle.net/d3/en/forum/topic/5152409863")
  });
});