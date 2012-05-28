describe("HN.Collections.News", function() {
  var news;

  beforeEach(function() {
    news = new HN.Collections.News();
    registerFakeAjax({url: 'http://news.ycombinator.com/news', successData: loadTestHtml('fixtures/news')})
  });

  it("should initialize url", function() {
    expect(news.url).toEqual("http://news.ycombinator.com/news");
  });

  it("should initialize model", function() {
    expect(news.model).toEqual(HN.Models.Post);
  });

  it('should fetch html', function() {
	news.fetch({
		success: function(collection, response){
			expect(collection.length).toEqual(30)
		}
	})
  })
});