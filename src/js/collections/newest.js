// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  HN.Collections.Newest = (function(_super) {

    __extends(Newest, _super);

    function Newest() {
      return Newest.__super__.constructor.apply(this, arguments);
    }

    Newest.prototype.model = HN.Models.Post;

    Newest.prototype.url = "http://news.ycombinator.com/newest";

    Newest.prototype.parse = function(response) {
      return HN.Utils.NewsParser.parse(response);
    };

    return Newest;

  })(Backbone.Collection);

}).call(this);
