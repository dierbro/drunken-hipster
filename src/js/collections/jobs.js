// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  HN.Collections.Jobs = (function(_super) {

    __extends(Jobs, _super);

    function Jobs() {
      return Jobs.__super__.constructor.apply(this, arguments);
    }

    Jobs.prototype.model = HN.Models.Post;

    Jobs.prototype.url = "http://news.ycombinator.com/jobs";

    Jobs.prototype.parse = function(response) {
      return HN.Utils.JobsParser.parse(response);
    };

    return Jobs;

  })(Backbone.Collection);

}).call(this);
