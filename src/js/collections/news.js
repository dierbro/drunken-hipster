// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  HN.Collections.News = (function(_super) {

    __extends(News, _super);

    function News() {
      return News.__super__.constructor.apply(this, arguments);
    }

    News.prototype.model = HN.Models.Post;

    News.prototype.url = "http://news.ycombinator.com/news";

    News.prototype.parse = function(response) {
      return HN.Utils.NewsParser.parse(response);
    };

    return News;

  })(Backbone.Collection);

}).call(this);
