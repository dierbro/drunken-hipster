// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  HN.Views.Page = (function(_super) {

    __extends(Page, _super);

    function Page() {
      return Page.__super__.constructor.apply(this, arguments);
    }

    Page.prototype.className = "page";

    Page.prototype.initialize = function() {
      return this.render();
    };

    Page.prototype.show = function() {
      var $old, direction_coefficient, _base;
      $('.page').css({
        "position": "absolute"
      });
      direction_coefficient = typeof (_base = this.options).back === "function" ? _base.back({
        1: -1
      }) : void 0;
      if (this.options.back != null) {
        forge.topbar.addButton({
          text: "News",
          position: "left"
        }, function() {
          return HN.router.navigate("/", true);
        });
      }
      if ($('.page').length) {
        $old = $('.page').not(this.el);
        $old.get(0).style["margin-left"] = "";
        $old.get(0).style["-webkit-transform"] = "";
        this.$el.appendTo('body').hide();
        this.$el.show();
        $old.remove();
        $('.page').css({
          "position": "static"
        });
      } else {
        this.$el.appendTo('body').hide();
        this.$el.show();
      }
      return window.scrollTo(0, 0);
    };

    return Page;

  })(Backbone.View);

}).call(this);