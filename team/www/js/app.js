// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

  .state('app.create_new_transaction', {
      url: '/create_new_transaction',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/create_new_trans.html',
          controller: 'ProfileCtrl'
        }
      }
    })

  .state('app.edit_new_transaction', {
      url: '/edit_new_transaction',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/edit_new_transaction.html',
          controller: 'ProfileCtrl'
        }
      }
    })

  .state('app.search_scan', {
      url: '/search_scan',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/search_scan.html',
          controller: 'ProfileCtrl'
        }
      }
    })

  .state('app.search_item', {
      url: '/search_item',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/search_item.html',
          controller: 'ProfileCtrl'
        }
      }
    })





















  ///////////////////////////////////////DANICA'S PART////////////////////////////////////////
    .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'AppCtrl'
  })

  .state('app.login', {
    url: '/login',
    views: {
      'menuContent':{
        templateUrl: 'templates/login.html'
      }
    }
  })

  .state('app.signup', {
    url: '/signup',
    views: {
      'menuContent':{
        templateUrl: 'templates/signup.html'
      }
    }
  })

  .state('app.search', {
    url: '/search',
    views: {
      'menuContent': {
        templateUrl: 'templates/search.html'
      }
    }
  })

  .state('app.profile', {
      url: '/profile',
      views: {
        'menuContent': {
          templateUrl: 'templates/profile.html',
          controller: 'ProfileCtrl'
        }
      }
    })
    .state('app.transaction', {
      url: '/transaction',
      views: {
        'menuContent': {
          templateUrl: 'templates/transactions.html',
          controller: 'PlaylistsCtrl'
        }
      }
    });

  // .state('app.single', {
  //   url: '/transaction',
  //   views: {
  //     'menuContent': {
  //       templateUrl: 'templates/transaction.html',
  //       controller: 'PlaylistCtrl'
  //     }
  //   }
  // });
  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/login');
});
