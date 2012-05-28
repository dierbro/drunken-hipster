// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  HN.Views.PostRow = (function(_super) {

    __extends(PostRow, _super);

    function PostRow() {
      return PostRow.__super__.constructor.apply(this, arguments);
    }

    PostRow.prototype.className = "post-row";

    PostRow.prototype.template = _.template($('#post-row').html());

    PostRow.prototype.events = {
      "click": "open"
    };

    PostRow.prototype.render = function() {
      this.$el.append(this.template(this.model.toJSON()));
      return this;
    };

    PostRow.prototype.open = function() {
      return HN.router.navigate("post/" + this.model.id, true);
    };

    return PostRow;

  })(Backbone.View);

}).call(this);