describe("HN.Utils.NewsParser", function() {
  var parsed;

  beforeEach(function() {
    parsed = HN.Utils.NewsParser.parse(loadTestHtml('fixtures/news'))
  });

  it("should return the correct number of posts", function() {
	expect(parsed.length).toEqual(30)
  });

  it("should parse the news", function() {
	expect(parsed[0].link).toEqual("http://www.sec.gov/Archives/edgar/data/1326801/000120919112029812/xslF345X03/doc4.xml")
	expect(parsed[parsed.length-1].link).toEqual("http://blog.jasonshah.org/post/23611548670/last-year-i-graduated-college-and-launched-a-startup")
  });
});