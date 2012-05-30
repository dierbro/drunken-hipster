describe("HN.Utils.JobsParser", function() {
  var parsed;

  beforeEach(function() {
    parsed = HN.Utils.JobsParser.parse(loadTestHtml('fixtures/jobs'))
  });

  it("should return the correct number of jobs", function() {
    console.log(parsed)
    expect(parsed.length).toEqual(20)
  });

});