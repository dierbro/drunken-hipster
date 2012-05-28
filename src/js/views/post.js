// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  HN.Views.Post = (function(_super) {

    __extends(Post, _super);

    function Post() {
      return Post.__super__.constructor.apply(this, arguments);
    }

    Post.prototype.template = _.template($('#post-row').html());

    Post.prototype.template_comment = _.template($('#discussion-comment').html());

    Post.prototype.events = {
      "click p.title": "open"
    };

    Post.prototype.initialize = function() {
      _.bindAll(this, "render");
      this.model.on("change", this.render);
      return this.model.fetch();
    };

    Post.prototype.render = function() {
      var comment, _i, _len, _ref;
      this.$el.append(this.template(this.model.toJSON()));
      _ref = this.model.get("comments");
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        comment = _ref[_i];
        this.$el.append(this.template_comment(comment));
      }
      return this;
    };

    Post.prototype.open = function() {
      console.log("open external link: " + this.model.get("link"));
      return forge.tabs.open(this.model.get("link"));
    };

    return Post;

  })(HN.Views.Page);

}).call(this);
