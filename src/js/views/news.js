// Generated by CoffeeScript 1.3.3
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  HN.Views.News = (function(_super) {

    __extends(News, _super);

    function News() {
      this.addOne = __bind(this.addOne, this);
      return News.__super__.constructor.apply(this, arguments);
    }

    News.prototype.initialize = function() {
      _.bindAll(this, "render");
      this.collection.on("reset", this.render);
      return this.render();
    };

    News.prototype.render = function() {
      console.log(this.collection);
      this.addAll();
      return this;
    };

    News.prototype.addAll = function() {
      return this.collection.each(this.addOne);
    };

    News.prototype.addOne = function(post) {
      var view;
      view = new HN.Views.PostRow({
        model: post
      });
      return this.$el.append(view.render().el);
    };

    return News;

  })(HN.Views.Page);

}).call(this);