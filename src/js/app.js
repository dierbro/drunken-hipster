// Generated by CoffeeScript 1.3.3
(function() {

  window.HN = {
    Models: {},
    Collections: {},
    Views: {},
    Utils: {},
    TabBarButtons: {},
    init: function() {
      var originalSync;
      forge.logging.log("Init");
      forge.topbar.show();
      forge.topbar.setTitle("HN");
      forge.topbar.setTint([255, 102, 0, 255]);
      forge.tabbar.addButton({
        icon: "img/list.png",
        text: "News",
        index: 0
      }, function(button) {
        window.HN.TabBarButtons.news = button;
        button.setActive();
        return button.onPressed.addListener(function() {
          console.log("button news");
          return HN.router.navigate("/", true);
        });
      });
      forge.tabbar.addButton({
        icon: "img/list.png",
        text: "New",
        index: 1
      }, function(button) {
        window.HN.TabBarButtons.newest = button;
        return button.onPressed.addListener(function() {
          return HN.router.navigate("newest", true);
        });
      });
      forge.tabbar.addButton({
        icon: "img/list.png",
        text: "Job",
        index: 2
      }, function(button) {
        window.HN.TabBarButtons.jobs = button;
        return button.onPressed.addListener(function() {
          return HN.router.navigate("jobs", true);
        });
      });
      forge.tabbar.addButton({
        icon: "img/list.png",
        text: "Ask",
        index: 3
      }, function(button) {
        window.HN.TabBarButtons.ask = button;
        return button.onPressed.addListener(function() {
          return HN.router.navigate("ask", true);
        });
      });
      forge.tabbar.show();
      $(document).on('ajaxStart', function(e, xhr, options) {
        return $("div#loading").show();
      });
      $(document).on('ajaxStop', function(e, xhr, options) {
        return $("div#loading").hide();
      });
      originalSync = Backbone.sync;
      Backbone.sync = function(method, model, options) {
        options = _.extend(options, {
          dataType: 'html',
          contentType: 'text/html',
          processData: false
        });
        return originalSync.apply(Backbone, [method, model, options]);
      };
      HN.news = new HN.Collections.News();
      HN.news.fetch({
        success: function(collection, response) {
          HN.router = new HN.Router();
          return Backbone.history.start();
        }
      });
      HN.newest = new HN.Collections.Newest();
      HN.newest.fetch();
      HN.jobs = new HN.Collections.Jobs();
      HN.jobs.fetch();
      HN.ask = new HN.Collections.Ask();
      return HN.ask.fetch();
    }
  };

}).call(this);
